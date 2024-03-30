// Copyright (c) 2018-2022 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/src/sdk/core/color_converter.dart';

/// Method called when the map is ready to be used.
typedef void HereMapCreatedCallback(HereMapController mapController);

/// Mode of hosting native Android view in Flutter
/// - virtualDisplay - causes issues on Android 12
/// - hybridComposition - is slower on Android 9
enum NativeViewMode { hybridComposition, virtualDisplay }

/// Widget that displays a map. To interact with the map, use the
/// [HereMapController] object that is passed to [HereMapCreatedCallback]
/// Note: Before using this class, [SDKNativeEngine] must be already initialized.
class HereMap extends StatefulWidget {
  /// Creates a widget that displays a map.
  const HereMap({
    Key? key,
    this.onMapCreated,
    this.gestureRecognizers,
    this.mode = NativeViewMode.virtualDisplay,
    options,
  })  : this._options = options,
        super(key: key);

  /// Method called when the map is ready to be used.
  final HereMapCreatedCallback? onMapCreated;

  /// Options used to customize map view for example its map projection
  final HereMapOptions? _options;

  /// Which method of hosting Android native view (the map) will be used.
  /// Default value is [NativeViewMode.virtualDisplay].
  ///
  /// More details: https://docs.flutter.dev/development/platform-integration/android/platform-views
  final NativeViewMode mode;

  /// Which gestures should be consumed by the map.
  ///
  /// It is possible for other gesture recognizers to be competing with the map on pointer
  /// events, e.g if the map is inside a [ListView] the [ListView] will want to handle
  /// vertical drags. The map will claim gestures that are recognized by any of the
  /// recognizers on this list.
  ///
  /// When this set is empty or null, the map will only handle pointer events for gestures that
  /// were not claimed by any other gesture recognizer.
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  @override
  State<StatefulWidget> createState() => _HereMapState();
}

class _HereMapState extends State<HereMap> implements MapCameraListener {
  HereMapController? _mapController;
  List<WidgetPin> _pins = <WidgetPin>[];
  _MapOrientationChangeHandler _orientationHandler = _MapOrientationChangeHandler();

  @override
  void dispose() {
    _mapController?.camera.removeListener(this);
    _mapController?.finalize();
    super.dispose();
  }

  Widget build(BuildContext context) {
    _orientationHandler.handleOrientationChange(context, () => _updatePins());

    return NotificationListener<SizeChangedLayoutNotification>(
      child: Stack(
        children: <Widget>[
          _buildMap(context),
          ..._buildPins(context, _pins),
        ],
      ),
      onNotification: (SizeChangedLayoutNotification? notification) {
        WidgetsBinding.instance.addPostFrameCallback(_renderAgain);
        return false;
      },
    );
  }

  void onMapCameraUpdated(MapCameraState cameraState) {
    _updatePins();
  }

  Widget _buildMap(BuildContext context) {
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    Color? backgroundColor = widget._options?.initialBackgroundColor;
    if (backgroundColor != null) {
      // this enforces projection to be set to globe
      if (widget._options?.projection == null) {
        creationParams['globeProjection'] = true;
      }
      creationParams['initialBackgroundRed'] = ColorConverter.colorComponentToDouble(backgroundColor.red);
      creationParams['initialBackgroundGreen'] = ColorConverter.colorComponentToDouble(backgroundColor.green);
      creationParams['initialBackgroundBlue'] = ColorConverter.colorComponentToDouble(backgroundColor.blue);
    }
    if (widget._options?.projection != null) {
      creationParams['globeProjection'] = widget._options?.projection == MapProjection.globe;
    }
    if (widget._options?.renderMode != null) {
      creationParams['textureRenderMode'] = widget._options?.renderMode == MapRenderMode.texture;
    }
    const String viewType = 'com.here.flutter/here_sdk';
    if (defaultTargetPlatform == TargetPlatform.android) {
      if (widget.mode == NativeViewMode.virtualDisplay) {
        return AndroidView(
          viewType: viewType,
          onPlatformViewCreated: _onPlatformViewCreated,
          gestureRecognizers: widget.gestureRecognizers,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        );
      } else {
        return PlatformViewLink(
          viewType: viewType,
          surfaceFactory: (BuildContext context, PlatformViewController controller) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers: widget.gestureRecognizers ?? const <Factory<OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
            // initExpensiveAndroidView is Hybrid Composition -> AndroidViewController
            // initSurfaceAndroidView is Texture Layer Hybrid Composition -> SurfaceAndroidViewController
            //
            // In the future we might want to use initSurfaceAndroidView() here.
            // That would select Texture Layer Hybrid Composition mode which currently falls back to Virtual Display
            // when plugin uses Surface View (that is our case) but will fallback to Hybrid Composition in future
            // Flutter versions.
            // Alternatively we might keep this and add another mode NativeViewMode.textureLayerHybridComposition.
            final AndroidViewController controller = PlatformViewsService.initExpensiveAndroidView(
              id: params.id,
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
              onFocus: () => params.onFocusChanged(true),
            );
            controller.addOnPlatformViewCreatedListener(params.onPlatformViewCreated);
            controller.addOnPlatformViewCreatedListener(_onPlatformViewCreated);
            controller.create();
            return controller;
          },
        );
      }
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: viewType,
        onPlatformViewCreated: _onPlatformViewCreated,
        gestureRecognizers: widget.gestureRecognizers,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return Text('$defaultTargetPlatform is not yet supported by the plugin');
  }

  List<Widget> _buildPins(BuildContext context, List<WidgetPin> pins) {
    List<Widget> pinWidgets = pins.map((WidgetPin pin) => pin.makeWidget(context)).toList();
    return pinWidgets;
  }

  void _onPlatformViewCreated(int id) async {
    // The map controller has a two-phase constructor. The first, synchronous phase, creates the
    // HereMapController instance and the second, asynchronous phase, prepares it for use. Note
    // that these two steps *must* be executed together to ensure that the map controller conforms
    // to null safety requirements
    HereMapController mapController = HereMapController(id);
    bool success = await mapController.initialize(_handleMapEvent);

    _mapController = mapController;
    _mapController!.camera.addListener(this);
    if (success && widget.onMapCreated != null) {
      widget.onMapCreated!(_mapController!);
    }
  }

  _updatePins() {
    final List<WidgetPin> newPins = _mapController!.widgetPins.map((WidgetPin pin) {
      final Point2D? point = _mapController!.geoToViewCoordinates(pin.coordinates);
      pin.updateScreenPosition(point);
      return pin;
    }).toList();

    if (mounted)
      setState(() {
        _pins = newPins;
      });
  }

  _renderAgain(_) {
    // To place the pin correctly (taking into account anchor) we need to know its size. Size of a widget is not
    //  known until it is rendered first time so first render is offstage. Here we trigger re-render to actually
    //  show the pin after we know the size
    setState(() {
      _pins = _mapController!.widgetPins;
    });
  }

  _handleMapEvent(HereMapEvent event) {
    switch (event) {
      case HereMapEvent.pinAdded:
        {
          _updatePins();
          WidgetsBinding.instance.addPostFrameCallback(_renderAgain);
          break;
        }
      case HereMapEvent.pinChanged:
      case HereMapEvent.pinRemoved:
        {
          _updatePins();
          WidgetsBinding.instance.addPostFrameCallback(_renderAgain);
          break;
        }
    }
  }
}

class _MapOrientationChangeHandler {
  static const Duration _refreshInterval = Duration(milliseconds: 200);
  static const int _refreshLimit = 5;

  Orientation? _orientation;
  Timer? _pinUpdateTimer;
  int _pinUpdateAttemptCount = 0;

  handleOrientationChange(BuildContext context, Function orientationChangeCallback) {
    final Orientation newOrientation = MediaQuery.of(context).orientation;
    if (_orientation != null && _orientation != newOrientation) {
      // This is a temporary solution until MapView provides a listener which notifies about MapView size change.
      // When orientation changes mapView is re-rendered to fit in new size. This means that pins have to be updated.
      //  However mapview does not notify us when its size changes. And Flutter's orientation/size notifications happen
      //  before the map is rendered so update based on Flutter's notifications will not work (we will get old values from geoToViewCoordinates)
      if (_pinUpdateTimer != null) {
        _pinUpdateTimer!.cancel();
      }
      _pinUpdateAttemptCount = 0;
      _pinUpdateTimer = Timer.periodic(_refreshInterval, (Timer timer) {
        orientationChangeCallback();
        _pinUpdateAttemptCount += 1;
        if (_pinUpdateAttemptCount > _refreshLimit) {
          timer.cancel();
        }
      });
    }
    _orientation = newOrientation;
  }
}
