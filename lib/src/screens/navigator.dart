// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:app_links/app_links.dart';
import 'package:collection/collection.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/home_search.dart';
import 'package:navika/src/screens/home_settings.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/screens/journeys_details.dart';
import 'package:navika/src/screens/journeys_get.dart';
import 'package:navika/src/screens/journeys_recurrent.dart';
import 'package:navika/src/screens/journeys_search.dart';
import 'package:navika/src/screens/maps.dart';
import 'package:navika/src/screens/pdf.dart';
import 'package:navika/src/screens/position.dart';
import 'package:navika/src/screens/routes_details.dart';
import 'package:navika/src/screens/routes_schedules.dart';
import 'package:navika/src/screens/routes_search.dart';
import 'package:navika/src/screens/scaffold.dart';
import 'package:navika/src/screens/schedules_departures.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/screens/schedules_search.dart';
import 'package:navika/src/screens/settings.dart';
import 'package:navika/src/screens/trip_details.dart';
import 'package:navika/src/screens/settings_notifications.dart';
import 'package:navika/src/screens/trafic_details.dart';
import 'package:navika/src/screens/trafic_work_schedule.dart';

class NavikaAppNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const NavikaAppNavigator({
    required this.navigatorKey,
    super.key,
  });

  static void startNavi(BuildContext context) {
    context.findAncestorStateOfType<_NavikaAppNavigatorState>()?.startNavi();
  }

  static void stopNavi(BuildContext context) {
    context.findAncestorStateOfType<_NavikaAppNavigatorState>()?.stopNavi();
  }

  @override
  State<NavikaAppNavigator> createState() => _NavikaAppNavigatorState();
}

class _NavikaAppNavigatorState extends State<NavikaAppNavigator> {
  bool navi = false;
  StreamSubscription<Uri>? _appLinksSub;
  bool _appLinksInitialized = false;

  void startNavi() {
    setState(() {
      navi = true;
    });
  }

  void stopNavi() {
    setState(() {
      navi = false;
    });
  }

  Future<void> initAppLinks(context) async {
    if (_appLinksInitialized) return;
    final appLinks = AppLinks();

    _appLinksSub = appLinks.uriLinkStream.listen((uri) {
      if (uri.scheme == 'geo' && uri.queryParameters.containsKey('q')) {
        globals.query = uri.queryParameters['q'];
        RouteStateScope.of(context).go('/home/search');
      } else if (uri.pathSegments.length == 2) {
        double latitude = double.parse(uri.pathSegments[0]);
        double longitude = double.parse(uri.pathSegments[1]);
        RouteStateScope.of(context).go('/address/$latitude;$longitude');
      }
    });
    _appLinksInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    final routeState = RouteStateScope.of(context);
    final pathTemplate = routeState.route.pathTemplate;

    initAppLinks(context);

    if (globals.path.isEmpty || globals.path.last != routeState.route.path) {
      globals.path.add(routeState.route.path);
    }

    if (kDebugMode) {
      print({'INFO_route', routeState.route.path});
    }

    String? type;
    String? id;
    String? routeId;
    String? lineId;
    String? stopId;
    String? fromId;
    String? toId;
    if (pathTemplate == '/stops/:id' || pathTemplate == '/bike/:id' || pathTemplate == '/address/:id') {
      id = routeState.route.parameters['id'];
    }

    if (pathTemplate == '/stops/:id/:route_id') {
      id = routeState.route.parameters['id'];
      routeId = routeState.route.parameters['route_id'];
    }

    if (pathTemplate == '/trip/:id' || pathTemplate == '/trip/:id/from/:from' || pathTemplate == '/trip/:id/from/:from/to/:to' ||
        pathTemplate == '/schedules/trip/:id' || pathTemplate == '/schedules/trip/:id/from/:from' || pathTemplate == '/schedules/trip/:id/from/:from/to/:to') {
      id = routeState.route.parameters['id'];
      if (routeState.route.parameters.containsKey('from')) {
        fromId = routeState.route.parameters['from'];
      }
      if (routeState.route.parameters.containsKey('to')) {
        toId = routeState.route.parameters['to'];
      }
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

    return Scaffold(
      body: Navigator(
        key: widget.navigatorKey,
        onPopPage: (route, dynamic result) {
          if (pathTemplate == '/stops/:id' || pathTemplate == '/bike/:id' || pathTemplate == '/address/:id') {
            routeState.go('/home');
            return true;
          }

          if (pathTemplate == '/stops/:id/:route_id') {
            routeState.go(globals.path[globals.path.length - 2]);
            globals.path = [...globals.path.slice(0, globals.path.length - 2)];
            return true;
          }

          if (pathTemplate == '/home/search') {
            routeState.go(globals.path[globals.path.length - 2]);
            globals.path = [...globals.path.slice(0, globals.path.length - 2)];
          }

          if (pathTemplate == '/maps') {
            routeState.go('/home');
          }

          if (pathTemplate == '/changes') {
            routeState.go('/settings');
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
            routeState.go(globals.path[globals.path.length - 2]);
            globals.path = [...globals.path.slice(0, globals.path.length - 2)];
          }
          if (pathTemplate == '/home/settings') {
            routeState.go('/home');
          }
          if (pathTemplate == '/home/journeys/search/:type') {
            routeState.go(globals.path[globals.path.length - 2]);
            globals.path = [...globals.path.slice(0, globals.path.length - 2)];
          }
          if (pathTemplate == '/home/journeys/details') {
            routeState.go(globals.path[globals.path.length - 2]);
            globals.path = [...globals.path.slice(0, globals.path.length - 2)];
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

          if (pathTemplate == '/trafic/work-schedule') {
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
            routeState.go(globals.path[globals.path.length - 2]);
            globals.path = [...globals.path.slice(0, globals.path.length - 2)];
          }

          if (pathTemplate.startsWith('/schedules/trip')) {
            routeState.go(globals.path[globals.path.length - 2]);
            globals.path = [...globals.path.slice(0, globals.path.length - 2)];
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
          if (pathTemplate.startsWith('/trip')) {
            routeState.go(globals.path[globals.path.length - 2]);
            globals.path = [...globals.path.slice(0, globals.path.length - 2)];
          }

          if (pathTemplate == '/pdf') {
            routeState.go(globals.path[globals.path.length - 2]);
            globals.path = [...globals.path.slice(0, globals.path.length - 2)];
          }

          return route.didPop(result);
        },
        pages: [
          MaterialPage<void>(
            key: const ValueKey('App'),
            child: NavikaAppScaffold(pathTemplate: pathTemplate, id: id, routeId: routeId, fromId: fromId, toId: toId),
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
          else if (pathTemplate == '/home/journeys')
            const MaterialPage<void>(
              key: ValueKey('Route'),
              child: Journeys(),
            )
          else if (pathTemplate == '/home/search')
            const MaterialPage<void>(
              key: ValueKey('HomeSearch'),
              child: HomeSearch(),
            )
          else if (pathTemplate == '/home/address')
            MaterialPage<void>(
              key: const ValueKey('Add Addresse'),
              child: HomeSearch(
                addAddress: true,
              ),
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
              child: RecurrentJourneysList(),
            )
          else if (pathTemplate == '/home/journeys/get/:id' && id != null)
            MaterialPage<void>(
              key: const ValueKey('Route get details'),
              child: JourneysGet(
                id: id,
              ),
            )
          else if (pathTemplate == '/trafic/details')
            const MaterialPage<void>(
              key: ValueKey('Trafic Details'),
              child: TraficDetails(),
            )
          else if (pathTemplate == '/trafic/work-schedule')
            const MaterialPage<void>(
              key: ValueKey('Trafic Work Schedule'),
              child: TraficWorkSchedule(),
            )
          else if (pathTemplate == '/trafic/add')
            const MaterialPage<void>(
              key: ValueKey('Trafic Details'),
              child: RoutesSearch(
                addFavorite: true,
              ),
            )
          else if (pathTemplate == '/schedules/search')
            const MaterialPage<void>(
              key: ValueKey('Schdedules Search'),
              child: SchedulesSearch(),
            )
          else if (id != null && pathTemplate == '/schedules/stops/:id') // /schedules/stops/:id
            MaterialPage<void>(
              key: const ValueKey('Schedules Stops'),
              child: SchedulesDetails(
                id: id,
              ),
            )
          else if (id != null && lineId != null && pathTemplate == '/schedules/stops/:id/departures/:line_id') // /schedules/stops/:id/departures/:line_id
            MaterialPage<void>(
              key: const ValueKey('Schedules Departures Lines'),
              child: DepartureDetails(
                id: id,
                stopLine: lineId,
              ),
            )
          else if (pathTemplate == '/schedules/trip/:id' && id != null)
            MaterialPage<void>(
              key: const ValueKey('Schedules Trip Details'),
              child: TripDetails(
                tripId: id,
              ),
            )
          else if (pathTemplate == '/schedules/trip/:id/from/:from' && id != null && fromId != null)
            MaterialPage<void>(
              key: const ValueKey('Schedules Trip Details From'),
              child: TripDetails(
                tripId: id,
                fromId: fromId,
              ),
            )
          else if (pathTemplate == '/schedules/trip/:id/from/:from/to/:to' && id != null && fromId != null && toId != null)
            MaterialPage<void>(
              key: const ValueKey('Schedules Trip Details From To'),
              child: TripDetails(
                tripId: id,
                fromId: fromId,
                toId: toId,
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
              child: RoutesSchedules(routeId: id, stopId: stopId),
            )
          else if (pathTemplate == '/pdf')
            const MaterialPage<void>(
              key: ValueKey('Routes Search'),
              child: PDFViewer(),
            )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _appLinksSub?.cancel();
    super.dispose();
  }
}
