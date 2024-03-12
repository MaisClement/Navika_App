import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/style.dart';

import 'package:navika/src/data/global.dart' as globals;

String getBlockName(id) {
  switch (id) {
    case 'message':
      return 'Messages d’actualités';

    case 'sponsor':
      return 'Soutenir Navika';

    case 'trafic':
      return 'État du trafic';

    case 'recurrentJourneys':
      return 'Vos trajets réguliers';

    case 'punctualJourneys':
      return 'Vos itinéraires';

    case 'schedules':
      return 'Vos horaires';

    case 'map':
      return 'Plans du réseau';

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
  final String title = 'Réorganiser l’accueil';

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

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) => Scaffold(
      bottomNavigationBar: getNavigationBar(context),
      appBar: AppBar(
        title: Text(title, style: appBarTitle),
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
                    child: Text(getBlockName(block['id']),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe Ui',
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
