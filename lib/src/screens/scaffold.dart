import 'package:flutter/material.dart';

import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/scaffold_body.dart';

class NavikaAppScaffold extends StatelessWidget {
  const NavikaAppScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routeState = RouteStateScope.of(context);
    final selectedIndex = _getSelectedIndex(routeState.route.pathTemplate);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (idx) {
          if (idx == 0) routeState.go('/home');
          if (idx == 1) routeState.go('/schedules');
          // SCAFFOLD if (idx == 2) routeState.go('/books/popular');
          if (idx == 2) routeState.go('/trafic');
        },
        destinations: const [
          NavigationDestination(
            label: 'Accueil',
            icon: Icon(ScaffoldIcon.home_regular),
            selectedIcon: Icon(ScaffoldIcon.home),
          ),
          NavigationDestination(
            label: 'Arrêts',
            icon: Icon(ScaffoldIcon.clock_regular),
            selectedIcon: Icon(ScaffoldIcon.clock),
          ),
          // SCAFFOLD NavigationDestination(
          // SCAFFOLD 	label: 'Books',
          // SCAFFOLD 	icon: Icon(Icons.book),
          // SCAFFOLD ),
          NavigationDestination(
            label: 'Trafic',
            icon: Icon(ScaffoldIcon.cone_regular),
            selectedIcon: Icon(ScaffoldIcon.cone),
          ),
        ],
      ),
      body: const NavikaAppScaffoldBody(),
    );
  }

  int _getSelectedIndex(String pathTemplate) {
    if (pathTemplate.startsWith('/home')) return 0;
    if (pathTemplate.startsWith('/schedules')) return 1;
    // SCAFFOLD if (pathTemplate.startsWith('/books')) return 2;
    if (pathTemplate == '/trafic') return 2;
    return 0;
  }
}
