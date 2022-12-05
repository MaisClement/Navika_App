import 'package:flutter/material.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;

class HomePannel extends StatelessWidget {
  final void Function()? tooglePanel;

	const HomePannel({
    required this.tooglePanel,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Container(
          height: 15,
        ),
        Container(
          width: 40,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Container(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                globals.route['dep']['name'] = null;
                globals.route['dep']['id'] = null;
                globals.route['arr']['name'] = null;
                globals.route['arr']['id'] = null;
                RouteStateScope.of(context).go('/home/route');
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(ScaffoldIcon.search,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
                      child: Text('Où allons nous ?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary, // Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 7,
        ),
      ],
    ),
  );
}