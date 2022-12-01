import 'package:flutter/material.dart';
import 'package:navika/src/icons/Scaffold_icon_icons.dart';
import 'package:navika/src/widgets/favorites/body.dart';

import '../routing.dart';
import '../data/global.dart' as globals;
import '../style/style.dart';

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
    backgroundColor: Colors.white,
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
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
              ),            
              child: Row(
                children: [
                  Icon(Scaffold_icon.search,
                    color: Theme.of(context).colorScheme.primary,
                    size: 25
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      child: Text('Rechercher une gare, un arrêt ou une stations',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
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