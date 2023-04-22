import 'package:flutter/material.dart';

import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/routing.dart';

NavigationBar getNavigationBar(context) {
  final routeState = RouteStateScope.of(context);
  final selectedIndex = _getSelectedIndex(routeState.route.pathTemplate);

  return NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (idx) {
          if (idx == 0) routeState.go('/home');
          if (idx == 1) routeState.go('/schedules');
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
          NavigationDestination(
            label: 'Trafic',
            icon: Icon(ScaffoldIcon.cone_regular),
            selectedIcon: Icon(ScaffoldIcon.cone),
          ),
        ],
      );
}

int _getSelectedIndex(String pathTemplate) {
  if (pathTemplate.startsWith('/home')) return 0;
  if (pathTemplate.startsWith('/schedules')) return 1;
  if (pathTemplate.startsWith('/trafic')) return 2;
  return 0;
}
