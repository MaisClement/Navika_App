import 'package:flutter/material.dart';

import '../routing.dart';
import 'trafic.dart';
import '../widgets/fade_transition_page.dart';
import 'schedules.dart';
import 'scaffold.dart';
import 'home.dart';

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
		print({'INFO_route', pathTemplate});

		// A nested Router isn't necessary because the back button behavior doesn't
		// need to be customized.
		return Navigator(
			key: navigatorKey,
			onPopPage: (route, dynamic result) {
				// When a page that is stacked on top of the scaffold is popped, display
				// the /books or /schedules tab in NavikaAppScaffold.
				if (pathTemplate == '/stops/:stop_area') {
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
				else if (pathTemplate == '/stops/:stop_area')
					const FadeTransitionPage<void>(
						key: ValueKey('home'),
						child: Home(
							displaySchedules: true,
						),
					)
				else if (pathTemplate.startsWith('/schedules'))
					const FadeTransitionPage<void>(
						key: ValueKey('schedules'),
						child: Schedules(),
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
