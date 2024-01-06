import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/screens/home_settings.dart';
import 'package:navika/src/screens/journeys_get.dart';
import 'package:navika/src/screens/journeys_list.dart';
import 'package:navika/src/screens/journeys_search.dart';
import 'package:navika/src/screens/maps.dart';
import 'package:navika/src/screens/pdf.dart';
import 'package:navika/src/screens/position.dart';
import 'package:navika/src/screens/add_address.dart';
import 'package:navika/src/screens/journeys_details.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/screens/routes_details.dart';
import 'package:navika/src/screens/routes_schedules.dart';
import 'package:navika/src/screens/scaffold.dart';
import 'package:navika/src/screens/schedules_departures.dart';
import 'package:navika/src/screens/schedules_search.dart';
import 'package:navika/src/screens/routes_search.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/settings.dart';
import 'package:navika/src/screens/settings_notifications.dart';
import 'package:navika/src/screens/trafic_details.dart';
import 'package:navika/src/screens/schedules_details.dart';
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

    globals.path.add(routeState.route.path);

		if (kDebugMode) {
		  print({'INFO_route', pathTemplate});
		}


    String? type;
    String? id;
    String? lineId;
    String? stopId;
    String? fromId;
    String? toId;
    if (pathTemplate == '/stops/:id' || pathTemplate == '/bike/:id') {
      id = routeState.route.parameters['id'];
    }

    if (pathTemplate == '/home/address/:type') {
      type = routeState.route.parameters['type'];
    }

    if (pathTemplate == '/home/address/:type/:id') {
      type = routeState.route.parameters['type'];
      id = routeState.route.parameters['id'];
    }

    if (pathTemplate == '/home/journeys/search/:type') {
      type = routeState.route.parameters['type'];
    }

    if (pathTemplate == '/home/journeys/get/:id') {
      id = routeState.route.parameters['id'];
    }

    if (pathTemplate == '/schedules/stops/:id') {
      id = routeState.route.parameters['id'];
    }

    if (pathTemplate == '/schedules/stops/:id/departures/:line_id') {
      id = routeState.route.parameters['id'];
      lineId = routeState.route.parameters['line_id'];
    }

    if (pathTemplate == '/routes/details/:id') {
      id = routeState.route.parameters['id'];
    }

    if (pathTemplate == '/routes/details/:id/schedules/:stop_id') {
      id = routeState.route.parameters['id'];
      stopId = routeState.route.parameters['stop_id'];
    }

    if (pathTemplate == '/trip/details/:id') {
      id = routeState.route.parameters['id'];
    }

    if (pathTemplate == '/trip/details/:id/from/:from') {
      id = routeState.route.parameters['id'];
      fromId = routeState.route.parameters['from'];
    }

    if (pathTemplate == '/trip/details/:id/from/:from/to/:to') {
      id = routeState.route.parameters['id'];
      fromId = routeState.route.parameters['from'];
      toId = routeState.route.parameters['toId'];
    }

    return Navigator(
      key: widget.navigatorKey,
      onPopPage: (route, dynamic result) {
        if (pathTemplate == '/stops/:id') {
          routeState.go('/home');
        }
        if (pathTemplate == '/bike/:id') {
          routeState.go('/home');
        }

        if (pathTemplate == '/maps') {
          routeState.go('/home');
        }

        if (pathTemplate == '/settings') {
          routeState.go('/home');
        }

        if (pathTemplate == '/settings/notifications') {
          routeState.go('/settings');
        }
        
        if (pathTemplate == '/position') {
          routeState.go(globals.path[globals.path.length - 2]);
          globals.path = [...globals.path.slice(0, globals.path.length - 2)];
        }

        if (pathTemplate == '/home/journeys') {
          routeState.go('/home');
        }
        if (pathTemplate == '/home/settings') {
          routeState.go('/home');
        }
        if (pathTemplate == '/home/journeys/search/:type') {
          routeState.go('/home/journeys');
        }
        if (pathTemplate == '/home/journeys/details') {
          if (globals.path[globals.path.length - 2] == '/home/journeys') {
            routeState.go('/home/journeys');
          } else {
            routeState.go('/home/journeys/list');
          }
        }
        if (pathTemplate == '/home/journeys/list') {
          routeState.go('/home');
        }
        if (pathTemplate == '/home/journeys/get/:id') {
          routeState.go('/home');
        }

        if (pathTemplate == '/home/address') {
          routeState.go('/home');
        }
        if (pathTemplate == '/home/address/:type') {
          routeState.go('/home');
        }

        if (pathTemplate == '/trafic/details') {
          routeState.go(globals.path[globals.path.length - 2]);
          globals.path = [...globals.path.slice(0, globals.path.length - 2)];
        }

        if (pathTemplate == '/trafic/add') {
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

        if (pathTemplate == '/routes/search') {
          routeState.go('/routes');
        }
        if (pathTemplate == '/routes/details/:id') {
          if (globals.path[globals.path.length - 2] == '/routes/search') {
            routeState.go('/routes');
          } else {
            routeState.go(globals.path[globals.path.length - 2]);
            globals.path = [...globals.path.slice(0, globals.path.length - 2)];
          }
        }
        if (pathTemplate == '/routes/details/:id/schedules/:stop_id') {
          routeState.go(globals.path[globals.path.length - 2]);
          globals.path = [...globals.path.slice(0, globals.path.length - 2)];
        }

        if (pathTemplate == '/trip/details/:id' || pathTemplate == '/trip/details/:id/from/:from' || pathTemplate == '/trip/details/:id/from/:from/to/:to') {
          routeState.go(globals.path[globals.path.length - 2]);
          globals.path = [...globals.path.slice(0, globals.path.length - 2)];
        }

        if (pathTemplate == '/pdf') {
          routeState.go(globals.path[globals.path.length - 2]);
          globals.path = [...globals.path.slice(0, globals.path.length - 2)];
        }

        //TEST
        if (pathTemplate == '/stops/:id') {
          routeState.go('/home');
					return false; 
        }
        if (pathTemplate == '/bike/:id') {
          routeState.go('/home');
					return false; 
        }

        return route.didPop(result);
      },
      pages: [
        // Display the app
        MaterialPage<void>(
          key: const ValueKey('App'),
          child: NavikaAppScaffold(
            pathTemplate: pathTemplate,
            id: id
          ),
        ),
        
        if (pathTemplate == '/maps')
          const MaterialPage<void>(
            key: ValueKey('Maps'),
            child: Maps(),
          )        
        else if (pathTemplate == '/settings')
          const MaterialPage<void>(
            key: ValueKey('Settings'),
            child: Settings(),
          )
        else if (pathTemplate == '/settings/notifications')
          const MaterialPage<void>(
            key: ValueKey('Settings Notification'),
            child: SettingsNotification(),
          )
        else if (pathTemplate == '/position')
          const MaterialPage<void>(
            key: ValueKey('Posiition'),
            child: Position(),
          )
        else if (pathTemplate == '/home/address')
          const MaterialPage<void>(
            key: ValueKey('Addresse'),
            child: AddAddress(),
          )
        else if (pathTemplate == '/home/address/:type' && type != null)
          MaterialPage<void>(
            key: const ValueKey('Addresse'),
            child: AddAddress(predefineType : type),
          )
        else if (pathTemplate == '/home/address/:type/:id' &&
            type != null &&
            id != null)
          MaterialPage<void>(
            key: const ValueKey('Addresse'),
            child: AddAddress(predefineType: type, id: id),
          )
        else if (pathTemplate == '/home/journeys')
          const MaterialPage<void>(
            key: ValueKey('Route'),
            child: Journeys(),
          )
        else if (pathTemplate == '/home/settings')
          const MaterialPage<void>(
            key: ValueKey('HomeSettings'),
            child: HomeSettings(),
          )
        else if (pathTemplate == '/home/journeys/search/:type' && type != null)
          MaterialPage<void>(
            key: const ValueKey('Route'),
            child: JourneysSearch(type: type),
          )
        else if (pathTemplate == '/home/journeys/details')
          const MaterialPage<void>(
            key: ValueKey('Route details'),
            child: JourneysDetails(),
          )
        else if (pathTemplate == '/home/journeys/list')
          const MaterialPage<void>(
            key: ValueKey('Route details'),
            child: JourneysList(),
          )
        else if (pathTemplate == '/home/journeys/get/:id' && id != null)
          MaterialPage<void>(
            key: const ValueKey('Route get details'),
            child: JourneysGet(
              id: id,
            ),
          )
        else if (pathTemplate == '/trafic/details') // /trafic/details
          const MaterialPage<void>(
            key: ValueKey('Trafic Details'),
            child: TraficDetails(),
          )
        else if (pathTemplate == '/trafic/add')
          const MaterialPage<void>(
            key: ValueKey('Trafic Details'),
            child: RoutesSearch(
              toFavorite: true,
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
              id: id,
            ),
          )
        else if (id != null &&
            lineId != null &&
            pathTemplate ==
                '/schedules/stops/:id/departures/:line_id') // /schedules/stops/:id/departures/:line_id
          MaterialPage<void>(
            key: const ValueKey('Schedules Departures Lines'),
            child: DepartureDetails(
              id: id,
              stopLine: lineId,
            ),
          )
        else if (id != null &&
            pathTemplate == '/trip/details/:id') // /schedules/stops/:id
          MaterialPage<void>(
            key: const ValueKey('Schedules Stops'),
            child: TripDetails(
              tripId: id,
            ),
          )
        else if (id != null &&
            fromId != null &&
            pathTemplate == '/trip/details/:id/from/:from') // /schedules/stops/:id
          MaterialPage<void>(
            key: const ValueKey('Schedules Stops'),
            child: TripDetails(
              tripId: id,
              fromId: fromId,
            ),
          )
        else if (pathTemplate == '/routes/search')
          const MaterialPage<void>(
            key: ValueKey('Routes Search'),
            child: RoutesSearch(),
          )
        else if (pathTemplate == '/routes/details/:id' && id != null)
          MaterialPage<void>(
            key: const ValueKey('Routes Search'),
            child: RoutesDetails(
              routeId: id,
            ),
          )
        else if (pathTemplate == '/routes/details/:id/schedules/:stop_id' && id != null && stopId != null)
          MaterialPage<void>(
            key: const ValueKey('Routes Search'),
            child: RoutesSchedules(
              routeId: id,
              stopId: stopId
            ),
          )
        else if (id != null &&
            fromId != null &&
            toId != null &&
            pathTemplate == '/trip/details/:id/from/:from/to/:to')
          MaterialPage<void>(
            key: const ValueKey('Schedules Stops'),
            child: TripDetails(
              tripId: id,
              fromId: fromId,
              toId: toId,
            ),
          )
        else if (pathTemplate == '/pdf')
          const MaterialPage<void>(
            key: ValueKey('Routes Search'),
            child: PDFViewer(),
          )
      ],
    );
  }
}
