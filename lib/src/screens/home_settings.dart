// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/style.dart';

String getBlockName(BuildContext context, id) {
  switch (id) {
    case 'message':
      return AppLocalizations.of(context)!.news_messages;

    case 'sponsor':
      return AppLocalizations.of(context)!.support_navika;

    case 'trafic':
      return AppLocalizations.of(context)!.traffic_status;

    case 'recurrentJourneys':
      return AppLocalizations.of(context)!.regular_trips;

    case 'punctualJourneys':
      return AppLocalizations.of(context)!.your_routes;

    case 'schedules':
      return AppLocalizations.of(context)!.your_timetables;

    case 'map':
      return AppLocalizations.of(context)!.network_maps;

    default:
      return '';
  }
}

void handleSwitch(bool value, id) {
  List blocks = globals.hiveBox?.get('homepageOrder');
    for (var block in blocks) {
      if (block['id'] == id) {
        block['enabled'] = value;
      }
    }
    globals.hiveBox.put('homepageOrder', blocks);
}

class HomeSettings extends StatefulWidget {
  const HomeSettings({super.key});

  @override
  State<HomeSettings> createState() => _HomeSettingsState();
}

class _HomeSettingsState extends State<HomeSettings> with SingleTickerProviderStateMixin {
  List blocks = globals.hiveBox?.get('homepageOrder');

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final fav = blocks.removeAt(oldindex);
      blocks.insert(newindex, fav);
      globals.hiveBox.put('homepageOrder', blocks);
    });
  }

  void update() {
    setState(() {
      blocks = globals.hiveBox?.get('homepageOrder');
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      bottomNavigationBar: getNavigationBar(context),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.reorganize_home, style: appBarTitle),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ReorderableListView(
        onReorder: reorderData,
        children: [
          for (var block in blocks)
            Container(
              key: ValueKey(block['id']),
              color: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
                bottom: 5,
              ),
              margin: const EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                children: [
                  Icon(
                    NavikaIcons.slide,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(getBlockName(context, block['id']),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ),
                  Switch(
                    thumbIcon: thumbIcon,
                    trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                      if (!states.contains(MaterialState.selected)) {
                        return mainColor(context);
                      }
                      return null;
                    }),
                    inactiveThumbColor: mainColor(context),
                    value: block['enabled'],
                    onChanged: (bool value) {
                      handleSwitch(value, block['id']);
                      update();
                    },
                  ),
                ],
              ),
            )
        ],
      ),
    );
}
