import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/routes.dart';
import 'package:navika/src/screens/trafic.dart';
import 'package:navika/src/widgets/fade_transition_page.dart';
import 'package:navika/src/screens/schedules.dart';
import 'package:navika/src/screens/scaffold.dart';
import 'package:navika/src/screens/home.dart';
import 'package:navika/src/data/global.dart' as globals;

/// Displays the contents of the body of [NavikaAppScaffold]
class NavikaAppScaffoldBody extends StatelessWidget {
	static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

	const NavikaAppScaffoldBody({
		super.key,
	});

	@override
	Widget build(BuildContext context) {
		final routeState = RouteStateScope.of(context);
		final pathTemplate = routeState.route.pathTemplate;

    globals.path.add(routeState.route.path);

		if (kDebugMode) {
		  print({'INFO_route', pathTemplate});
		}
    
		return Navigator(
			key: navigatorKey,
			onPopPage: (route, dynamic result) {
				if (pathTemplate == '/stops/:id') {
          routeState.go('/home');
        }

        if (pathTemplate.startsWith('/home/journeys')) {
          routeState.go('/home');
        }

				return route.didPop(result);
			},
			pages: [
				if (pathTemplate.startsWith('/home'))
					const FadeTransitionPage<void>(
						key: ValueKey('home'),
						child: Home(),
					)
				else if (pathTemplate == '/stops/:id')
					const FadeTransitionPage<void>(
						key: ValueKey('home'),
						child: Home(
							displayType: 'stops',
						),
					)
				else if (pathTemplate == '/bike/:id')
					const FadeTransitionPage<void>(
						key: ValueKey('home'),
						child: Home(
							displayType: 'bike',
						),
					)
				else if (pathTemplate.startsWith('/schedules'))
					const FadeTransitionPage<void>(
						key: ValueKey('schedules'),
						child: Schedules(),
					)
				
				else if (pathTemplate.startsWith('/routes'))
					const FadeTransitionPage<void>(
						key: ValueKey('routes'),
						child: Routes(),
					)

				else if (pathTemplate.startsWith('/trafic'))
					const FadeTransitionPage<void>(
						key: ValueKey('trafic'),
						child: Trafic(),
					)

				// Avoid building a Navigator with an empty `pages` list when the
				// RouteState is set to an unexpected path, such as /signin.
				//
				// Since RouteStateScope is an InheritedNotifier, any change to the
				// route will result in a call to this build method, even though this
				// widget isn't built when those routes are active.
				else
					FadeTransitionPage<void>(
						key: const ValueKey('empty'),
						child: Container(),
					),
			],
		);
	}
}
