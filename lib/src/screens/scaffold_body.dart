import 'package:flutter/material.dart';

import '../routing.dart';
import 'trafic.dart';
import '../widgets/fade_transition_page.dart';
import 'schedules.dart';
import 'books.dart';
import 'scaffold.dart';

/// Displays the contents of the body of [BookstoreScaffold]
class BookstoreScaffoldBody extends StatelessWidget {
	static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

	const BookstoreScaffoldBody({
		super.key,
	});

	@override
	Widget build(BuildContext context) {
		var currentRoute = RouteStateScope.of(context).route;

		// A nested Router isn't necessary because the back button behavior doesn't
		// need to be customized.
		return Navigator(
			key: navigatorKey,
			onPopPage: (route, dynamic result) => route.didPop(result),
			pages: [
				if (currentRoute.pathTemplate.startsWith('/schedules'))
					const FadeTransitionPage<void>(
						key: ValueKey('schedules'),
						child: SchedulesScreen(),
					)
				else if (currentRoute.pathTemplate.startsWith('/trafic'))
					const FadeTransitionPage<void>(
						key: ValueKey('trafic'),
						child: TraficScreen(),
					)
				else if (currentRoute.pathTemplate.startsWith('/books') ||
						currentRoute.pathTemplate == '/')
					const FadeTransitionPage<void>(
						key: ValueKey('books'),
						child: BooksScreen(),
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
