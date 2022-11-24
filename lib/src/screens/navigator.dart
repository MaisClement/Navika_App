import 'package:flutter/material.dart';
import 'package:navika/src/screens/route_search.dart';
import 'package:navika/src/screens/schedules_departures.dart';

import '../routing.dart';
import '../widgets/fade_transition_page.dart';
import 'trafic_details.dart';
import 'schedules_details.dart';
import 'scaffold.dart';

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

		String? departuresStop;
		String? departuresLine;
		if (pathTemplate == '/schedules/:stop_area/departures/:line_id') {
			departuresStop = routeState.route.parameters['stop_area'];
			departuresLine = routeState.route.parameters['line_id'];
		}

		bool? routeSearch;
		if (pathTemplate == '/home/search') {
			routeSearch = true;
		}

		bool? displaySchedules;
		if (pathTemplate == '/stops/:stop_area') {
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

				if (pathTemplate == '/schedules/:stop_area/departures/:line_id') {
          routeState.go('/schedules/${departuresStop}');
        }

				if (pathTemplate == '/home/search') {
          routeState.go('/home');
        }

				if (pathTemplate == '/stops/:stop_area') {
          routeState.go('/home');
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
							child: TraficDetails(
								lineId: selectedLine,
							),
						)
          else if (selectedNavPos != null)
						MaterialPage<void>(
							key: _authorDetailsKey,
							child: SchedulesDetails(
                navPos: selectedNavPos,
							),
						)
						
					else if (pathTemplate == '/home/search')
						MaterialPage<void>(
							key: _authorDetailsKey,
							child: const RouteSearch(),
						)

					else if (pathTemplate == '/schedules/:stop_area/departures/:line_id')
						MaterialPage<void>(
							key: _authorDetailsKey,
							child: DepartureDetails(),
						)
			],
		);
	}
}
