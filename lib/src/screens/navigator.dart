import 'package:flutter/material.dart';

import '../routing.dart';
import '../widgets/fade_transition_page.dart';
import 'home.dart';
import 'trafic_details.dart';
import 'schedules_details.dart';
import 'scaffold.dart';
import 'route_search.dart';

/// Builds the top-level navigator for the app. The pages to display are based
/// on the `routeState` that was parsed by the TemplateRouteParser.
class NavikaAppNavigator extends StatefulWidget {
	final GlobalKey<NavigatorState> navigatorKey;

	const NavikaAppNavigator({
		required this.navigatorKey,
		super.key,
	});

	@override
	State<NavikaAppNavigator> createState() => _NavikaAppNavigatorState();
}

class _NavikaAppNavigatorState extends State<NavikaAppNavigator> {
	final _scaffoldKey = const ValueKey('App scaffold');
	final _bookDetailsKey = const ValueKey('Book details screen');
	final _authorDetailsKey = const ValueKey('Author details screen');

	@override
	Widget build(BuildContext context) {
		final routeState = RouteStateScope.of(context);
		final pathTemplate = routeState.route.pathTemplate;

    String? selectedLine;
		if (pathTemplate == '/trafic/:lineId') {
			selectedLine = routeState.route.parameters['lineId'];
		}

    String? selectedNavPos;
		if (pathTemplate == '/schedules/:stop_area') {
			selectedNavPos = routeState.route.parameters['stop_area'];
		}

		bool? route_search;
		if (pathTemplate == '/home/search') {
			route_search = true;
		}

		bool? displaySchedules;
		if (pathTemplate == '/stops') {
			displaySchedules = true;
		}

		print({'INFO_route3', pathTemplate});

		return Navigator(
			key: widget.navigatorKey,
			onPopPage: (route, dynamic result) {
				// When a page that is stacked on top of the scaffold is popped, display
				// the /books or /schedules tab in NavikaAppScaffold.
        if (pathTemplate == '/trafic/:lineId') {
					routeState.go('/trafic');
				}

        if (pathTemplate == '/schedules/:stop_area') {
          routeState.go('/schedules');
        }

				if (pathTemplate == '/home/search') {
          routeState.go('/home');
        }

				if (pathTemplate == '/stops') {
          routeState.go('/stops');
        }

				return route.didPop(result);
			},
			pages: [
				// Display the app
					FadeTransitionPage<void>(
						key: _scaffoldKey,
						child: const NavikaAppScaffold(),
					),
					// Add an additional page to the stack if the user is viewing a book
					// or an author
					if (selectedLine != null)
						MaterialPage<void>(
							key: _authorDetailsKey,
							child: TraficDetailsScreen(
								lineId: selectedLine,
							),
						)
          else if (selectedNavPos != null)
						MaterialPage<void>(
							key: _authorDetailsKey,
							child: SchedulesDetailsScreen(
                navPos: selectedNavPos,
							),
						)
					else if (route_search != null)
						MaterialPage<void>(
							key: _authorDetailsKey,
							child: RouteSearch(),
						)
			],
		);
	}
}
