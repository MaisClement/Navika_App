import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/favorites/body.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/utils/icon_elevated.dart';
import 'package:navika/src/widgets/utils/search_box.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  final String title = 'Horaires';
  bool isReorder = true;

  List favs = globals.hiveBox?.get('stopsFavorites');
  void updateFavorites() {
    setState(() {
      favs = globals.hiveBox.get('stopsFavorites');
    });
  }

  setIsReorder(show) {
    setState(() {
      isReorder = show;
    });
  }

  void reorderData(int oldindex, int newindex){
    setState(() {
      if(newindex > oldindex){
        newindex -= 1;
      }
      final fav = favs.removeAt(oldindex);
      favs.insert(newindex, fav);
      globals.hiveBox.put('stopsFavorites', favs);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: appBarTitle),
              const SizedBox(
                height: 10,
              ),
              SearchBox(
                  onTap: () {
                    RouteStateScope.of(context).go('/schedules/search');
                  },
                  icon: NavikaIcons.search,
                  text: 'Rechercher une gare, un arrêt ou une stations'),
            ],
          ),
        ),
        body: ReorderableListView(
          onReorder: reorderData,
          children: [
            if (favs.isEmpty)
              Container(
                key: const ValueKey('nothing'),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage(
                        'assets/img/bus_schedules.png',
                      ),
                      width: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Ajoutez un arrêt à vos favoris pour accéder à vos horaires plus rapidement.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe Ui',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IconElevatedButton(
                      icon: NavikaIcons.search,
                      text: 'Rechercher',
                      onPressed: () {
                        RouteStateScope.of(context).go('/schedules/search');
                      },
                    ),
                  ],
                ),
              )
            else
              for (var fav in favs)
                FavoriteBody(
                  key: ValueKey(fav['id'] + fav['line']),
                  id: fav['id'],
                  name: fav['name'],
                  line: fav['line'],
                  update: updateFavorites,
                  removeSeparator: (isReorder == true),
                ),
          ],
        ),
      );
}
