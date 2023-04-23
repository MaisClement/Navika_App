import 'package:flutter/material.dart';
import 'package:navika/src/screens/position.dart';
import 'package:navika/src/screens/route.dart';
import 'package:navika/src/screens/add_address.dart';
import 'package:navika/src/screens/route_details.dart';
import 'package:navika/src/screens/schedules_departures.dart';
import 'package:navika/src/screens/schedules_search.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/settings.dart';
import 'package:navika/src/screens/trafic_details.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/screens/scaffold.dart';
import 'package:navika/src/screens/trip_details.dart';
import 'package:navika/src/data/global.dart' as globals;

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

    String? predefineType;
    if (pathTemplate == '/home/address/:type') {
      predefineType = routeState.route.parameters['type'];
    }

    String? id;
    String? stopLine;
    if (pathTemplate == '/schedules/stops/:id') {
      id = routeState.route.parameters['id'];
    }
    if (pathTemplate == '/schedules/stops/:id/departures/:line_id') {
      id = routeState.route.parameters['id'];
      stopLine = routeState.route.parameters['line_id'];
    }

    String? tripId;
    String? fromId;
    String? toId;
    if (pathTemplate == '/trip/details/:id') {
      tripId = routeState.route.parameters['id'];
    }

    if (pathTemplate == '/trip/details/:id/from/:from') {
      tripId = routeState.route.parameters['id'];
      fromId = routeState.route.parameters['from'];
    }

    if (pathTemplate == '/trip/details/:id/from/:from/to/:to') {
      tripId = routeState.route.parameters['id'];
      fromId = routeState.route.parameters['from'];
      toId = routeState.route.parameters['toId'];
    }

    return Navigator(
      key: widget.navigatorKey,
      onPopPage: (route, dynamic result) {
        // Il y'a aussi des retour dans scaffold_body.dart
        if (pathTemplate == '/settings') {
          routeState.go('/home');
        }
        if (pathTemplate == '/position') {
          routeState.go(globals.path[globals.path.length - 2]);
        }

        if (pathTemplate == '/home/journeys') {
          routeState.go('/home');
        }
        if (pathTemplate == '/home/journeys/details') {
          routeState.go('/home/journeys');
        }

        if (pathTemplate == '/home/address') {
          routeState.go('/home');
        }
        if (pathTemplate == '/home/address/:type') {
          routeState.go('/home');
        }

        if (pathTemplate == '/trafic/:lineId') {
          routeState.go('/trafic');
        }

        if (pathTemplate == '/schedules/search') {
          routeState.go('/schedules');
        }
        if (pathTemplate == '/schedules/stops/:id') {
          routeState.go('/schedules');
        }
        if (pathTemplate == '/schedules/stops/:id/departures/:line_id') {
          routeState.go('/schedules/stops/$id');
        }

        if (pathTemplate == '/trip/details/:id' ||
            pathTemplate == '/trip/details/:id/from/:from' ||
            pathTemplate == '/trip/details/:id/from/:from/to/:to') {
          routeState.go(globals.path[globals.path.length - 2]);
        }

        return route.didPop(result);
      },
      pages: [
        // Display the app
        const MaterialPage<void>(
          key: ValueKey('Home'),
          child: NavikaAppScaffold(),
        ),

        if (pathTemplate == '/settings') // /home/journeys/details
          const MaterialPage<void>(
            key: ValueKey('Settings'),
            child: Settings(),
          )
        else if (pathTemplate == '/position') // /home/journeys/details
          const MaterialPage<void>(
            key: ValueKey('Posiition'),
            child: Position(),
          )
        else if (pathTemplate == '/home/address') // /home/journeys
          const MaterialPage<void>(
            key: ValueKey('Addresse'),
            child: AddAddress(),
          )
        else if (pathTemplate == '/home/address/:type') // /home/journeys
          MaterialPage<void>(
            key: const ValueKey('Addresse'),
            child: AddAddress(predefineType: predefineType),
          )
        else if (pathTemplate == '/home/journeys') // /home/journeys
          const MaterialPage<void>(
            key: ValueKey('Route'),
            child: RouteHome(),
          )
        else if (pathTemplate ==
            '/home/journeys/details') // /home/journeys/details
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
        else if (id != null &&
            pathTemplate == '/schedules/stops/:id') // /schedules/stops/:id
          MaterialPage<void>(
            key: const ValueKey('Schedules Stops'),
            child: SchedulesDetails(
              navPos: id,
            ),
          )
        else if (id != null &&
            stopLine != null &&
            pathTemplate ==
                '/schedules/stops/:id/departures/:line_id') // /schedules/stops/:id/departures/:line_id
          MaterialPage<void>(
            key: const ValueKey('Schedules Departures Lines'),
            child: DepartureDetails(
              id: id,
              stopLine: stopLine,
            ),
          )
        else if (tripId != null &&
            pathTemplate == '/trip/details/:id') // /schedules/stops/:id
          MaterialPage<void>(
            key: const ValueKey('Schedules Stops'),
            child: TripDetails(
              tripId: tripId,
            ),
          )
        else if (tripId != null &&
            fromId != null &&
            pathTemplate ==
                '/trip/details/:id/from/:from') // /schedules/stops/:id
          MaterialPage<void>(
            key: const ValueKey('Schedules Stops'),
            child: TripDetails(
              tripId: tripId,
							fromId: fromId,
            ),
          )
        else if (tripId != null &&
            fromId != null &&
            toId != null &&
            pathTemplate ==
                '/trip/details/:id/from/:from/to/:to')
          MaterialPage<void>(
            key: const ValueKey('Schedules Stops'),
            child: TripDetails(
              tripId: tripId,
							fromId: fromId,
							toId: toId,
            ),
          )
      ],
    );
  }
}
