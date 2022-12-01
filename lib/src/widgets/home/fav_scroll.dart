import 'package:flutter/material.dart';
import 'package:navika/src/widgets/home/fav_button.dart';

import '../../routing.dart';
import '../../data/global.dart' as globals;

class HomeBodyFavScroll extends StatelessWidget {

	const HomeBodyFavScroll({
		super.key,
	});

	@override
	Widget build(BuildContext context) => ListView(
    scrollDirection: Axis.horizontal,
    children: [

      // Maison
      FavButton(
        name: 'Ajouter',
        img: 'assets/plus.svg',
        onTap: () {
          globals.route['dep']['name'] = null;
          globals.route['dep']['id'] = null;
          globals.route['arr']['name'] = null;
          globals.route['arr']['id'] = null;
          RouteStateScope.of(context).go('/home/search');
        }
      ),

      FavButton(
        name: 'Ajouter',
        img: 'assets/plus.svg',
        onTap: () {
          globals.route['dep']['name'] = null;
          globals.route['dep']['id'] = null;
          globals.route['arr']['name'] = null;
          globals.route['arr']['id'] = null;
          RouteStateScope.of(context).go('/home/search');
        }
      ),

      FavButton(
        name: 'Ajouter',
        img: 'assets/plus.svg',
        onTap: () {
          globals.route['dep']['name'] = null;
          globals.route['dep']['id'] = null;
          globals.route['arr']['name'] = null;
          globals.route['arr']['id'] = null;
          RouteStateScope.of(context).go('/home/search');
        }
      ),

    ],
  );
}