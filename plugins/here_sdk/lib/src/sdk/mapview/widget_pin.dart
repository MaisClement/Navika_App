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
import 'package:flutter/widgets.dart';
import 'package:here_sdk/core.dart';

/// Controller for a [Widget] pinned at a fixed geographical location on the map.
///
/// A pinned Widget tracks the geographical location as the map is being
/// manipulated. It behaves like a [MapMarker], only it's a regular
/// Flutter Widget and is not part of normal map rendering.
///
/// WidgetPin allows modifying the geographical location of the pinned Widget
/// as well as its placement relative to it.
///
/// Use [HereMapController.pinWidget] to pin (add) a [Widget] to a map and obtain
/// in instance of [WidgetPin] that controls it.
///
/// To unpin (remove) a Widget from the map, use [HereMapController.unpinWidget].
/// or [WidgetPin.unpin].
abstract class WidgetPin {
  /// Creates a [WidgetPin] displaying child [Widget] at coordinates location on the map
  /// Don't use this constructor directly. Instead use [HereMapController.pinWidget] to create a [WidgetPin].
  factory WidgetPin({
    required Widget child,
    required GeoCoordinates coordinates,
    Anchor2D? anchor,
    Function()? onChange,
    Function(WidgetPin)? onUnpin,
  }) =>
      $prototype.make(
        child: child,
        coordinates: coordinates,
        anchor: anchor,
        onChange: onChange,
        onUnpin: onUnpin,
      );

  /// The pinned Widget controlled by this [WidgetPin].
  Widget get child;

  GeoCoordinates get coordinates;

  /// Changes geographical location of the [WidgetPin].
  set coordinates(GeoCoordinates newCoords);

  Anchor2D get anchor;

  /// Controls pinned [Widget]'s placement relative to geographical location,
  /// with (0,0) meaning top left corner of the Widget is placed at [coordinates]
  /// and (1,1) for bottom right corner.
  set anchor(Anchor2D newAnchor);

  /// Removes this [WidgetPin] from the map.
  unpin();

  /// Creates a widget for this [WidgetPin].
  Widget makeWidget(BuildContext context);

  updateScreenPosition(Point2D? screenPosition);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = WidgetPin$Prototype();
}

/// @nodoc
@visibleForTesting
class WidgetPin$Prototype {
  WidgetPin make({
    required Widget child,
    required GeoCoordinates coordinates,
    Anchor2D? anchor,
    Function()? onChange,
    Function(WidgetPin)? onUnpin,
  }) =>
      WidgetPin$Impl(
        child: child,
        coordinates: coordinates,
        anchor: anchor,
        onChange: onChange,
        onUnpin: onUnpin,
      );
}

/// @nodoc
class WidgetPin$Impl implements WidgetPin {
  /// @nodoc
  WidgetPin$Impl({
    required this.child,
    required GeoCoordinates coordinates,
    Anchor2D? anchor,
    this.onChange,
    this.onUnpin,
  }) {
    // _coordinates is private and thus must be initialised differently to child, which is public and final
    // and thus read only
    _coordinates = coordinates;

    // Only assign the user's anchor if one was actually passed in, so that we have a valid default one with
    // which to work
    if (anchor != null) {
      _anchor = anchor;
    }
  }

  final Widget child;
  late GeoCoordinates _coordinates;
  Anchor2D _anchor = Anchor2D();
  bool _isInsideViewArea = true;
  final GlobalKey _key = GlobalKey();
  final Function()? onChange;
  final Function(WidgetPin)? onUnpin;

  // position on screen, will be changing as map is panned
  Point2D _point = Point2D(0.0, 0.0);

  @override
  GeoCoordinates get coordinates => _coordinates;

  @override
  set coordinates(GeoCoordinates newCoords) {
    _coordinates = newCoords;
    onChange?.call();
  }

  @override
  Anchor2D get anchor => _anchor;

  @override
  set anchor(Anchor2D newAnchor) {
    _anchor = newAnchor;
    onChange?.call();
  }

  @override
  unpin() => onUnpin?.call(this);

  @override
  Widget makeWidget(BuildContext context) {
    final Size size = _getWidgetSize();
    final double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final Point2D pos = _getXY(size, pixelRatio);
    Widget widget = Positioned(
      key: _key,
      left: pos.x,
      top: pos.y,
      child: Visibility(
        visible: _isInsideViewArea,
        child: SizeChangedLayoutNotifier(child: child),
      ),
    );

    if (size.width == 0 || size.height == 0) {
      // Size of widget is not known until first render.
      // Without size we can't calculate position taking anchor into account
      //  so in first run we render the widget offstage just to get the size.
      // Also some widgets (e.g. Image.network()) may need some time until the size is known
      //  we rely on SizeChangedLayoutNotifier to let us know when their size changed so we can re-render
      return Offstage(child: Stack(children: <Widget>[widget]));
    }
    // real render when we have the size
    return widget;
  }

  @override
  updateScreenPosition(Point2D? screenPosition) {
    _isInsideViewArea = screenPosition != null;
    if (screenPosition != null) {
      _point = screenPosition;
    }
  }

  // Calculate screen position of the pin taking anchor into account
  Point2D _getXY(Size size, double pixelRatio) {
    return Point2D(
      _point.x / pixelRatio - size.width * anchor.horizontal,
      _point.y / pixelRatio - size.height * anchor.vertical,
    );
  }

  // This will return a size of 0 x 0 if the widget was not rendered yet
  Size _getWidgetSize() {
    final RenderBox? renderBoxRed =
        _key.currentContext?.findRenderObject() as RenderBox?;
    return renderBoxRed?.size ?? Size.zero;
  }
}
