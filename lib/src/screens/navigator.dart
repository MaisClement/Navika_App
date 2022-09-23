import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import '../routing.dart';
import '../widgets/fade_transition_page.dart';
import 'book_details.dart';
import 'trafic_details.dart';
import 'schedules_details.dart';
import 'scaffold.dart';

/// Builds the top-level navigator for the app. The pages to display are based
/// on the `routeState` that was parsed by the TemplateRouteParser.
class BookstoreNavigator extends StatefulWidget {
	final GlobalKey<NavigatorState> navigatorKey;

	const BookstoreNavigator({
		required this.navigatorKey,
		super.key,
	});

	@override
	State<BookstoreNavigator> createState() => _BookstoreNavigatorState();
}

class _BookstoreNavigatorState extends State<BookstoreNavigator> {
	final _scaffoldKey = const ValueKey('App scaffold');
	final _bookDetailsKey = const ValueKey('Book details screen');
	final _authorDetailsKey = const ValueKey('Author details screen');

	@override
	Widget build(BuildContext context) {
		final routeState = RouteStateScope.of(context);
		final pathTemplate = routeState.route.pathTemplate;

		Book? selectedBook;
		if (pathTemplate == '/book/:bookId') {
			selectedBook = libraryInstance.allBooks.firstWhereOrNull(
					(b) => b.id.toString() == routeState.route.parameters['bookId']);
		}

    String? selectedLine;
		if (pathTemplate == '/trafic/:lineId') {
			selectedLine = routeState.route.parameters['lineId'];
		}

    String? selectedNavPos;
		if (pathTemplate == '/schedules/:navpos') {
			selectedNavPos = routeState.route.parameters['navpos'];
		}

		return Navigator(
			key: widget.navigatorKey,
			onPopPage: (route, dynamic result) {
				// When a page that is stacked on top of the scaffold is popped, display
				// the /books or /schedules tab in BookstoreScaffold.
				if (pathTemplate == '/book/:bookId') {
					routeState.go('/books/popular');
				}

				if (pathTemplate == '/author/:authorId') {
					routeState.go('/schedules');
				}

        if (pathTemplate == '/trafic/:lineId') {
					routeState.go('/trafic');
				}

        if (pathTemplate == '/schedules/:navpos') {
          routeState.go('/schedules');
        }

				return route.didPop(result);
			},
			pages: [
				// Display the app
					FadeTransitionPage<void>(
						key: _scaffoldKey,
						child: const BookstoreScaffold(),
					),
					// Add an additional page to the stack if the user is viewing a book
					// or an author
					if (selectedBook != null)
						MaterialPage<void>(
							key: _bookDetailsKey,
							child: BookDetailsScreen(
								book: selectedBook,
							),
						)
					else if (selectedLine != null)
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
						),
			],
		);
	}
}
