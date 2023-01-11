import 'package:flutter/widgets.dart';

import 'package:navika/src/routing/parsed_route.dart';
import 'package:navika/src/routing/parser.dart';

/// The current route state. To change the current route, call obtain the state
/// using `RouteStateScope.of(context)` and call `go()`:
///
/// ```
/// RouteStateScope.of(context).go('/book/2');
/// ```
class RouteState extends ChangeNotifier {
	final TemplateRouteParser _parser;
	ParsedRoute _route;

	RouteState(this._parser) : _route = _parser.initialRoute;

	ParsedRoute get route => _route;

	set route(ParsedRoute route) {
		// Don't notify listeners if the path hasn't changed.
		if (_route == route) return;

		_route = route;
		notifyListeners();
	}

	Future<void> go(String route) async {
		this.route =
				await _parser.parseRouteInformation(RouteInformation(location: route));
	}
}

/// Provides the current [RouteState] to descendant widgets in the tree.
class RouteStateScope extends InheritedNotifier<RouteState> {
	const RouteStateScope({
		required super.notifier,
		required super.child,
		super.key,
	});

	static RouteState of(BuildContext context) =>
			context.dependOnInheritedWidgetOfExactType<RouteStateScope>()!.notifier!;
}
