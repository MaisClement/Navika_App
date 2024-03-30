// Copyright (c) 2018-2023 HERE Global B.V. and its affiliate(s).
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
import 'dart:ffi';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/gestures.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/src/sdk/mapview/map_context_provider.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_internal_hsdk.dart';

enum HereMapEvent { pinAdded, pinChanged, pinRemoved }
typedef HereMapEventCallback = void Function(HereMapEvent event);

/// Callback to be called on retrieval of screenshot.
typedef TakeScreenshotCallback = void Function(ImageInfo? image);

/// Allows interacting with the map displayed by [HereMap] widget.
abstract class HereMapController extends MapViewBase {
  factory HereMapController(int id) => $prototype.make(id);

  /// @nodoc
  Future<bool> initialize(HereMapEventCallback callback);

  /// @nodoc
  void finalize();

  /// Asynchronously retrieves a screenshot of the map view.
  ///
  /// Note that on Android devices this may not work when the map view is currently not visible,
  /// for example, when an application is running in background and onPause() was called. On iOS
  /// devices the GPU cannot be used when running in background and taking a screenshot is
  /// therefore not possible when the map view is not visible.
  ///
  /// The image is returned in a Dart ImageInfo object. The image itself can be accessed from
  /// the ImageInfo.image member and its dimensions from the ImageInfo.image.width and the
  /// ImageInfo.image.height members. These are represented as physical pixels, not device
  /// independent pixels.
  ///
  /// If a Flutter Image widget is desired, it can be created thus:
  ///
  /// final ByteData byteData = await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
  /// Image widget = Image.memory(byteData.buffer.asUint8List());
  ///
  /// [callback] Completion handler called when the screenshot is completed
  void takeScreenshot(TakeScreenshotCallback callback);

  /// Pins a [Widget] to the MapView and returns a proxy object that can be used to
  /// control the pinning.
  ///
  /// [widget] Widget to pin
  ///
  /// [coordinates] GeoCoordinates to pin the widget at
  ///
  /// [anchor] The anchor point for the widget which specifies the position offset relative to the widget's coordinates.
  ///
  /// Returns [WidgetPin] a pin proxy object
  WidgetPin? pinWidget(Widget widget, GeoCoordinates coordinates, {Anchor2D? anchor});

  /// Removes a [WidgetPin] from the MapView by specifying the corresponding [Widget].
  /// Trying to unpin a widget that was not pinned or has been unpinned before has no effect.
  /// All pinned widgets equal to [widget] will be removed.
  ///
  /// [widget] corresponding to the [WidgetPin] to remove.
  ///
  void unpinWidget(Widget widget);

  /// Returns all map contents located inside the specified pick area.
  ///
  /// Pickable map contents currently consist of:
  /// - Embedded carto POI markers that are available on the map, by default.
  /// - Traffic incidents which are visible when they are enabled using [MapScene.enableFeatures]
  /// with [MapFeatures.trafficIncidents]. Note: Using the deprecated method
  /// [MapScene.setLayerVisibility] together with [MapScene.enableFeatures] is not supported.
  /// - Vehicle restrictions which are only available for the Navigate Edition.
  /// Vehicle restrictions are enabled using [MapScene.enableFeatures] with
  /// [MapFeatures.vehicleRestrictions]. Please note that the vehicle restriction line marking the
  /// affected street is pickable, but not the restriction icon itself. If the [viewRectangle]
  /// passed in is not too small then tapping on the icon will always include the respective
  /// vehicle restriction in the callback.
  /// Only visible POIs, traffic incidents and vehicle restrictions lines can be picked, i.e. only
  /// those categories that were not hidden by [MapScene.setPoiVisibility] and those which aren't
  /// covered by any custom marker. The pick area is defined by a rectangle in map view coordinates
  /// in pixels, relative to the map view's origin at (0, 0) which indicates the top-left corner
  /// of the map view.
  ///
  /// Note: Map items that are added by the user can be picked with
  /// [MapViewBase.pickMapItems] instead.
  ///
  /// [viewRectangle] The rectangle inside which the objects should be picked in view coordinates.
  ///
  /// [callback] Callback to call with the result. This will be called on main thread when the operation
  /// has completed.
  ///
  void pickMapContent(Rectangle2D viewRectangle, PickMapContentCallback callback);

  /// Gets a list of currently added widget pins.
  List<WidgetPin> get widgetPins;

  /// The code of desired primary map display language.
  static LanguageCode? get primaryLanguage => $prototype.primaryLanguage;

  /// Sets the desired primary map display language for all instances of
  /// MapView to [languageCode]. Applying a language change causes map to be
  /// redrawn. If null or the specified language is not supported, local
  /// language of the region will be used which is the default behaviour.
  static void set primaryLanguage(LanguageCode? languageCode) {
    $prototype.primaryLanguage = languageCode;
  }

  /// The code of desired secondary map display language.
  /// Note: This feature is in beta state and thus there can be bugs and unexpected behavior.
  static LanguageCode? get secondaryLanguage => $prototype.secondaryLanguage;

  /// Sets the desired secondary map display language for all instances of
  /// MapView to [languageCode]. Applying a language change causes map to be
  /// redrawn. If the specified language is not supported, local language of the
  /// region will be used. If null, no secondary map language will be used which
  /// is the default behaviour.
  /// Note: This feature is in beta state and thus there can be bugs and unexpected behavior.
  static void set secondaryLanguage(LanguageCode? languageCode) {
    $prototype.secondaryLanguage = languageCode;
  }

  /// The current shadow quality.
  /// Note: This feature is in beta state and thus there can be bugs and unexpected behavior.
  static ShadowQuality? get shadowQuality => $prototype.shadowQuality;

  /// Sets the desired shadow quality for all instances of MapView to [shadowQuality].
  /// The quality controls the size of the shadow maps and the cascade count.
  /// MapViews can request to render shadows by feature. If no quality is configured, the feature
  /// has no effect and no shadows are rendered until a quality is specified.
  /// Enabling shadows has a performance impact and should be considered only for devices with
  /// sufficient performance.
  /// Note: This feature is in beta state and thus there can be bugs and unexpected behavior.
  static void set shadowQuality(ShadowQuality? shadowQuality) {
    $prototype.shadowQuality = shadowQuality;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = HereMapController$Prototype();
}

/// @nodoc
@visibleForTesting
class HereMapController$Prototype {
  HereMapController make(int id) => HereMapController$Impl(id);

  /// @nodoc
  LanguageCode? get primaryLanguage => HereMapController$Impl.primaryLanguage;

  /// @nodoc
  set primaryLanguage(LanguageCode? languageCode) {
    HereMapController$Impl.primaryLanguage = languageCode;
  }

  /// @nodoc
  LanguageCode? get secondaryLanguage => HereMapController$Impl.secondaryLanguage;

  /// @nodoc
  set secondaryLanguage(LanguageCode? languageCode) {
    HereMapController$Impl.secondaryLanguage = languageCode;
  }

  /// @nodoc
  ShadowQuality? get shadowQuality => HereMapController$Impl.shadowQuality;

  /// @nodoc
  set shadowQuality(ShadowQuality? shadowQuality) {
    HereMapController$Impl.shadowQuality = shadowQuality;
  }
}

/// @nodoc
class HereMapController$Impl implements HereMapController {
  HereMapController$Impl(int id) {
    _channel = MethodChannel('com.here.flutter/here_sdk_$id');
  }

  List<WidgetPin> _pins = <WidgetPin>[];
  late MapViewInternalHsdk _mapViewInternal;
  late MethodChannel _channel;
  StreamController<HereMapEvent> _mapEventStream = StreamController<HereMapEvent>();

  @override
  Future<bool> initialize(HereMapEventCallback callback) async {
    final mapViewInternalAddress = await _channel.invokeMethod('initialize');
    if (mapViewInternalAddress == 0) {
      print('Platform failed to initialize MapView');
      return false;
    }

    final mapViewInternalPointer = Pointer.fromAddress(mapViewInternalAddress).cast<Void>();
    _mapViewInternal = sdkMapviewMapviewinternalhsdkFromFfi(mapViewInternalPointer);

    _mapEventStream.stream.listen(callback);

    return true;
  }

  @override
  bool get isValid => _mapViewInternal.isValid;

  @override
  void finalize() {
    _mapEventStream.close();
  }

  @override
  MapCamera get camera => _mapViewInternal.camera;

  @override
  MapScene get mapScene => _mapViewInternal.mapScene;

  @override
  Gestures get gestures => _mapViewInternal.gestures;

  @override
  MapContext get mapContext => _mapViewInternal.mapContext;

  @override
  HereMapControllerCore get hereMapControllerCore => _mapViewInternal.hereMapControllerCore;

  @override
  GeoCoordinates? viewToGeoCoordinates(Point2D point) => _mapViewInternal.viewToGeoCoordinates(point);

  @override
  Point2D? geoToViewCoordinates(GeoCoordinates coords) => _mapViewInternal.geoToViewCoordinates(coords);

  @override
  addLifecycleListener(MapViewLifecycleListener lifecycleListener) =>
      _mapViewInternal.addLifecycleListener(lifecycleListener);

  @override
  pickMapItems(Point2D centerPoint, double radius, callback) =>
      _mapViewInternal.pickMapItems(centerPoint, radius, callback);

  @override
  pickMapContent(pickingArea, callback) => _mapViewInternal.pickMapContent(pickingArea, callback);

  @override
  double get pixelScale => _mapViewInternal.pixelScale;

  @override
  Size2D get viewportSize => _mapViewInternal.viewportSize;

  @override
  int get frameRate => _mapViewInternal.frameRate;

  @override
  set frameRate(int value) => _mapViewInternal.frameRate = value;

  @override
  removeLifecycleListener(MapViewLifecycleListener lifecycleListener) =>
      _mapViewInternal.removeLifecycleListener(lifecycleListener);

  @override
  setWatermarkLocation(Anchor2D anchor, Point2D offset) =>
      _mapViewInternal.setWatermarkLocation(anchor, offset);

  @override
  Size2D get watermarkSize => _mapViewInternal.watermarkSize;

  @override
  void takeScreenshot(TakeScreenshotCallback callback) {
    _mapViewInternal.takeScreenshot((Uint8List? bytes) async {
      ImageInfo? imageInfo;
      try {
        final ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(bytes!);
        final ui.ImageDescriptor descriptor = await ui.ImageDescriptor.encoded(buffer);
        final ui.Codec codec = await descriptor.instantiateCodec();
        final ui.FrameInfo frameInfo = await codec.getNextFrame();

        imageInfo = ImageInfo(image: frameInfo.image, scale: pixelScale);
      } catch (e) {
        print('Error when creating image from screenshot data $e');
      }
      callback(imageInfo);
    });
  }

  @override
  WidgetPin? pinWidget(Widget widget, GeoCoordinates coordinates, {Anchor2D? anchor}) {
    if (_mapEventStream.isClosed) {
      return null;
    }
    final WidgetPin newPin = WidgetPin(
        child: widget,
        coordinates: coordinates,
        anchor: anchor,
        onChange: () {
          if (!_mapEventStream.isClosed) {
            _mapEventStream.add(HereMapEvent.pinChanged);
          }
        },
        onUnpin: (WidgetPin pin) => _removePin(pin));
    _pins.add(newPin);
    _mapEventStream.add(HereMapEvent.pinAdded);
    return newPin;
  }

  @override
  void unpinWidget(Widget widget) => _unpinWhere((WidgetPin pin) => pin.child == widget);

  /// @nodoc
  /// Removes specific WidgetPin
  void _removePin(WidgetPin pin) => _unpinWhere((WidgetPin candidate) => candidate == pin);

  /// @nodoc
  /// Unpins all WidgetPins satisfying given test
  void _unpinWhere(bool test(WidgetPin element)) {
    final previousPinCount = _pins.length;
    _pins.removeWhere(test);
    if (_pins.length < previousPinCount && !_mapEventStream.isClosed) {
      _mapEventStream.add(HereMapEvent.pinRemoved);
    }
  }

  @override
  List<WidgetPin> get widgetPins => List<WidgetPin>.from(_pins);

  /// @nodoc
  static LanguageCode? get primaryLanguage {
    return _primaryLanguage;
  }

  /// @nodoc
  static LanguageCode? get _primaryLanguage {
    return MapContextProvider.languageOptions.primary;
  }

  /// @nodoc
  static void set primaryLanguage(LanguageCode? languageCode) {
    _primaryLanguage = languageCode;
  }

  /// @nodoc
  static void set _primaryLanguage(LanguageCode? languageCode) {
    MapContextProviderLanguageOptions options = MapContextProvider.languageOptions;
    options.primary = languageCode;
    MapContextProvider.languageOptions = options;
  }

  /// @nodoc
  static LanguageCode? get secondaryLanguage {
    return _secondaryLanguage;
  }

  /// @nodoc
  static LanguageCode? get _secondaryLanguage {
    return MapContextProvider.languageOptions.secondary;
  }

  /// @nodoc
  static void set secondaryLanguage(LanguageCode? languageCode) {
    _secondaryLanguage = languageCode;
  }

  /// @nodoc
  static void set _secondaryLanguage(LanguageCode? languageCode) {
    MapContextProviderLanguageOptions options = MapContextProvider.languageOptions;
    options.secondary = languageCode;
    MapContextProvider.languageOptions = options;
  }

  /// @nodoc
  static ShadowQuality? get shadowQuality {
    return _shadowQuality;
  }

  /// @nodoc
  static ShadowQuality? get _shadowQuality {
    return MapContextProvider.shadowQuality;
  }

  /// @nodoc
  static void set shadowQuality(ShadowQuality? shadowQuality) {
    _shadowQuality = shadowQuality;
  }

  /// @nodoc
  static void set _shadowQuality(ShadowQuality? shadowQuality) {
    MapContextProvider.shadowQuality = shadowQuality;
  }
}
