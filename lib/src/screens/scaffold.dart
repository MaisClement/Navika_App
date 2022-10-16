import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';

import '../icons/scaffold_icon_icons.dart';

import '../routing.dart';
import 'scaffold_body.dart';

class BookstoreScaffold extends StatelessWidget {
	const BookstoreScaffold({
		super.key,
	});

	@override
	Widget build(BuildContext context) {
		final routeState = RouteStateScope.of(context);
		final selectedIndex = _getSelectedIndex(routeState.route.pathTemplate);

		return Scaffold(
			body: AdaptiveNavigationScaffold(
				selectedIndex: selectedIndex,
				body: const BookstoreScaffoldBody(),
				onDestinationSelected: (idx) {
					if (idx == 0) routeState.go('/home');
					if (idx == 1) routeState.go('/schedules');
					if (idx == 2) routeState.go('/books/popular');
					if (idx == 3) routeState.go('/trafic');
				},
				destinations: const [
					AdaptiveScaffoldDestination(
						title: 'Accueil',
						icon: Scaffold_icon.clock,
					),
					AdaptiveScaffoldDestination(
						title: 'Horaires',
						icon: Scaffold_icon.clock,
					),
					AdaptiveScaffoldDestination(
						title: 'Books',
						icon: Icons.book,
					),
					AdaptiveScaffoldDestination(
						title: 'Trafic',
						icon: Scaffold_icon.cone,
					),
				],
			),
		);
	}

	int _getSelectedIndex(String pathTemplate) {
		if (pathTemplate.startsWith('/home')) return 0;
		if (pathTemplate.startsWith('/schedules')) return 1;
		if (pathTemplate.startsWith('/books')) return 2;
		if (pathTemplate == '/trafic') return 3;
		return 0;
	}
}
