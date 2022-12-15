import 'package:flutter/material.dart';
import 'package:navika/src/screens/route.dart';
import 'package:navika/src/screens/route_details.dart';
import 'package:navika/src/screens/schedules_departures.dart';
import 'package:navika/src/screens/schedules_search.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/trafic_details.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/screens/scaffold.dart';

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

	@override
	Widget build(BuildContext context) {
		final routeState = RouteStateScope.of(context);
		final pathTemplate = routeState.route.pathTemplate;

    String? lineId;
		if (pathTemplate == '/trafic/:lineId') {
			lineId = routeState.route.parameters['lineId'];
		}

    // /schedules/search
    String? stopArea;
		String? stopLine;
		if (pathTemplate == '/schedules/stops/:stop_area') {
			stopArea = routeState.route.parameters['stop_area'];
		}
		if (pathTemplate == '/schedules/stops/:stop_area/departures/:line_id') {
			stopArea = routeState.route.parameters['stop_area'];
			stopLine = routeState.route.parameters['line_id'];
		}

		return Navigator(
			key: widget.navigatorKey,
			onPopPage: (route, dynamic result) {
				// Il y'a aussi des retour dans scaffold_body.dart
        if (pathTemplate == '/journeys') {
          routeState.go('/home');
        }
        if (pathTemplate == '/journeys/details') {
          routeState.go('/journeys');
        }

				if (pathTemplate == '/stops/:stop_area') {
          routeState.go('/home');
        }
				
        if (pathTemplate == '/trafic/:lineId') {
					routeState.go('/trafic');
				}
        
        if (pathTemplate == '/schedules/search') {
          routeState.go('/schedules');
        }
        if (pathTemplate == '/schedules/stops/:stop_area') {
          routeState.go('/schedules');
        }
				if (pathTemplate == '/schedules/stops/:stop_area/departures/:line_id') {
          routeState.go('/schedules/stops/$stopArea');
        }

				return route.didPop(result);
			},
			pages: [
				// Display the app
					const MaterialPage<void>(
						key: ValueKey('Home'),
						child: NavikaAppScaffold(),
					),
          
          if (pathTemplate == '/journeys') // /journeys
						const MaterialPage<void>(
							key: ValueKey('Route'),
							child: RouteHome(),
						)
          else if (pathTemplate == '/journeys/details') // /journeys/details
						const MaterialPage<void>(
							key: ValueKey('Route details'),
							child: RouteDetails(),
						)
          else if (lineId != null) // /trafic/:lineId
						MaterialPage<void>(
							key: const ValueKey('Trafic Details'),
							child: TraficDetails(
								lineId: lineId,
							),
						)
          else if (pathTemplate == '/schedules/search')
						const MaterialPage<void>(
							key: ValueKey('Schdedules Search'),
							child: SchedulesSearch(),
						)
          else if (stopArea != null && pathTemplate == '/schedules/stops/:stop_area') // /schedules/stops/:stop_area
						MaterialPage<void>(
							key: const ValueKey('Schedules Stops'),
							child: SchedulesDetails(
                navPos: stopArea,
							),
						)
					else if (stopArea != null && stopLine != null && pathTemplate == '/schedules/stops/:stop_area/departures/:line_id') // /schedules/stops/:stop_area/departures/:line_id
						MaterialPage<void>(
							key: const ValueKey('Schedules Departures Lines'),
							child: DepartureDetails(
								stopArea: stopArea,
								stopLine: stopLine,
							),
						)
			],
		);
	}
}
