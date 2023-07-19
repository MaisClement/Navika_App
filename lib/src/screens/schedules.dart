import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/favorites/body.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/utils/search_box.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  final String title = 'Horaires';

  List favs = globals.hiveBox?.get('stopsFavorites');
  void updateFavorites() {
    setState(() {
      favs = globals.hiveBox.get('stopsFavorites');
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
        body: ListView(
          children: [
            if (favs.isEmpty)
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage(
                        'assets/img/bus_schedules.png',
                      ),
                      width: 80,
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
                      height: 10,
                    ),
                    ElevatedButton(
                      child: SizedBox(
                        width: 138,
                        child: Row(
                          children: [
                            const Icon(NavikaIcons.search, size: 25),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              child: const Text(
                                'Rechercher',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        RouteStateScope.of(context).go('/schedules/search');
                      },
                    )
                  ],
                ),
              )
            else
              for (var fav in favs)
                FavoriteBody(
                  id: fav['id'],
                  name: fav['name'],
                  modes: fav['modes'],
                  line: fav['line'],
                  update: updateFavorites,
                  removeSeparator: (favs[0] == fav),
                ),
          ],
        ),
      );
}
