// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:navika/src/data/global.dart' as globals;

// 🌎 Project imports:
import 'package:navika/src/screens/home.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/screens/routes.dart';
import 'package:navika/src/screens/schedules.dart';
import 'package:navika/src/screens/trafic.dart';
import 'package:navika/src/routing/route_state.dart';

getHomePage(pathTemplate, id, routeId, {String? fromId, String? toId}) {
  if (pathTemplate == '/stops/:id' && id != null){
    return Home(
      displayType: 'stops',
      id: id
    );

  } else if (pathTemplate == '/stops/:id/:route_id' && id != null && routeId != null) {
    return Home(
      displayType: 'stops_route',
      id: id,
      routeId: routeId,
    );

  } else if (pathTemplate == '/trip/:id' && id != null) {
    return Home(
      displayType: 'trip',
      id: id,
      fromId: fromId,
      toId: toId,
    );

  } else if (pathTemplate == '/trip/:id/from/:from' && id != null) {
    return Home(
      displayType: 'trip',
      id: id,
      fromId: fromId,
      toId: toId,
    );

  } else if (pathTemplate == '/trip/:id/from/:from/to/:to' && id != null) {
    return Home(
      displayType: 'trip',
      id: id,
      fromId: fromId,
      toId: toId,
    );

  } else if (pathTemplate == '/bike/:id' && id != null) {
    return Home(
      displayType: 'bike',
      id: id
    );

  } else if (pathTemplate == '/address/:id' && id != null) {
    return Home(
      displayType: 'address',
      id: id
    );
  }
}

getPages(pathTemplate, id, routeId, {String? fromId, String? toId}) {
  if (pathTemplate == '/stops/:id' || pathTemplate == '/stops/:id/:route_id' || pathTemplate == '/bike/:id' || pathTemplate == '/address/:id' || pathTemplate.startsWith('/trip')) {
    return getHomePage(pathTemplate, id, routeId, fromId: fromId, toId: toId);

	} else if (pathTemplate.startsWith('/schedules')) {
		return const Schedules();
		
	}	else if (pathTemplate.startsWith('/routes')) {
		return const Routes();

	}	else if (pathTemplate.startsWith('/trafic')){
		return const Trafic();

	} else if (pathTemplate.startsWith('/home')){
		return const Home();

	} else {
		return Container();
	}
}

class NavikaAppScaffold extends StatelessWidget {
  final String? pathTemplate;
  final String? id;
  final String? routeId;
  final String? fromId;
  final String? toId;

  const NavikaAppScaffold({
    required this.pathTemplate,
    required this.id,
    this.routeId,
    this.fromId,
    this.toId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routeState = RouteStateScope.of(context);
    // Ces routes sont affichées sur la page racine (pas empilées dans le Navigator),
    // il faut donc intercepter le pop pour ne pas quitter l'application.
    final isDetailRoute = pathTemplate == '/stops/:id' ||
        pathTemplate == '/stops/:id/:route_id' ||
        pathTemplate == '/bike/:id' ||
        pathTemplate == '/address/:id' ||
        (pathTemplate?.startsWith('/trip') ?? false);

    void goToPreviousPath() {
      final currentPath = routeState.route.path;
      String previousPath = '/home';

      // Cherche la dernière route différente de la route actuelle et qui n'est pas une recherche
      for (int i = globals.path.length - 1; i >= 0; i--) {
        final candidate = globals.path[i];
        if (candidate != currentPath && !candidate.contains('/search')) {
          previousPath = candidate;
          globals.path = globals.path.sublist(0, i);
          break;
        }
      }

      routeState.go(previousPath);
    }

    return PopScope(
      canPop: !isDetailRoute,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        goToPreviousPath();
      },
      child: Scaffold(
        bottomNavigationBar: getNavigationBar(context),
        body: getPages(pathTemplate, id, routeId, fromId: fromId, toId: toId),
      ),
    );
  }
}
