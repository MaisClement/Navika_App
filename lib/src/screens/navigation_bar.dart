// 🎯 Dart imports:
import 'dart:io';

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';

Widget getNavigationBar(context) {
  final routeState = RouteStateScope.of(context);
  final selectedIndex = _getSelectedIndex(routeState.route.pathTemplate);

  onTap(idx) {
    final isReselect = idx == selectedIndex;
    if (idx == 0) routeState.go('/home');
    if (idx == 1) routeState.go(isReselect ? '/schedules/search' : '/schedules');
    if (idx == 2) routeState.go(isReselect ? '/routes/search' : '/routes');
    if (idx == 3) routeState.go('/trafic');
  }

  return Platform.isIOS
      ? CupertinoTabBar(
          height: 60,
          currentIndex: selectedIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(NavikaIcons.homeFilled),
              label: AppLocalizations.of(context)!.main,
            ),
            BottomNavigationBarItem(
              icon: const Icon(NavikaIcons.clockFilled),
              label: AppLocalizations.of(context)!.timetables,
            ),
            BottomNavigationBarItem(
              icon: const Icon(NavikaIcons.routeFilled),
              label: AppLocalizations.of(context)!.lines,
            ),
            BottomNavigationBarItem(
              icon: const Icon(NavikaIcons.coneFilled),
              label: AppLocalizations.of(context)!.traffic,
            ),
          ],
        )
      : NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: onTap,
          destinations: [
            NavigationDestination(
              label: AppLocalizations.of(context)!.main,
              icon: const Icon(NavikaIcons.home),
              selectedIcon: const Icon(NavikaIcons.homeFilled),
            ),
            NavigationDestination(
              label: AppLocalizations.of(context)!.timetables,
              icon: const Icon(NavikaIcons.clock),
              selectedIcon: const Icon(NavikaIcons.clockFilled),
            ),
            NavigationDestination(
              label: AppLocalizations.of(context)!.lines,
              icon: const Icon(NavikaIcons.route),
              selectedIcon: const Icon(NavikaIcons.routeFilled),
            ),
            NavigationDestination(
              label: AppLocalizations.of(context)!.traffic,
              icon: const Icon(NavikaIcons.cone),
              selectedIcon: const Icon(NavikaIcons.coneFilled),
            ),
          ],
        );
}

int _getSelectedIndex(String pathTemplate) {
  if (pathTemplate.startsWith('/home')) return 0;
  if (pathTemplate.startsWith('/schedules')) return 1;
  if (pathTemplate.startsWith('/routes')) return 2;
  if (pathTemplate.startsWith('/trafic')) return 3;
  return 0;
}
