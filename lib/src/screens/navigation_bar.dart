import 'package:flutter/material.dart';

import 'package:navika/src/icons/navika_icons_icons.dart';
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
            icon: Icon(NavikaIcons.home),
            selectedIcon: Icon(NavikaIcons.home_filled),
          ),
          NavigationDestination(
            label: 'Horaires',
            icon: Icon(NavikaIcons.clock),
            selectedIcon: Icon(NavikaIcons.clock_filled),
          ),
          NavigationDestination(
            label: 'Trafic',
            icon: Icon(NavikaIcons.cone),
            selectedIcon: Icon(NavikaIcons.cone_filled),
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
