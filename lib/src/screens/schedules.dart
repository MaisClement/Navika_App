import 'package:flutter/material.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/widgets/favorites/body.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';

class Schedules extends StatefulWidget {
	const Schedules({
    super.key
  });

	@override
	State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
	final String title = 'Arrêts';

  List favs = globals.hiveBox.get('stopsFavorites');
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
			    Text(title,
            style: appBarTitle
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              RouteStateScope.of(context).go('/schedules/search');
            },
            borderRadius: BorderRadius.circular(500),
            child: Container(
              padding: const EdgeInsets.only(left:15.0),
              decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(500),
      color: boxColor(context),
    ),            
              child: Row(
                children: [
                  Icon(ScaffoldIcon.search,
                    color: boxContentColor(context),
                    size: 25
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      child: Text('Rechercher une gare, un arrêt ou une stations',
                        style: TextStyle(
                          color: boxContentColor(context),
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
			  ],
			),
		),
		body: ListView(
      children: [
        for (var fav in favs)
          FavoriteBody(
            id: fav['id'],
            name: fav['name'],
            modes: fav['modes'],
            line: fav['line'],
            update: updateFavorites,
          ),
      ],
    ),
  );
}