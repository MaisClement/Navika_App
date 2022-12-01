// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../favorites/body.dart';
import 'fav_scroll.dart';
import 'messages.dart';

class HomeBody extends StatelessWidget {
	final ScrollController scrollController;
  final Map index;
  final List favs;
  final Function update;

	const HomeBody({
		required this.scrollController,
    required this.index,
    required this.favs,
    required this.update,
		super.key,
	});

	@override
	Widget build(BuildContext context) => ListView(
    controller: scrollController,
    padding: const EdgeInsets.only(top:110),
    children: [
      SizedBox(
        height: 85,
        child: HomeBodyFavScroll(),
      ),
      SizedBox(
        height: 10,
      ),

      // Messages de l'index
      if (index['message'] != null)
        for (var message in index['message'])
          HomeMessage(
            message: message
          ),

      if (favs.isNotEmpty)
        Container(
          padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
          child: Text('Vos Favoris',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Segoe Ui',
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        
      for (var fav in favs.sublist(0, favs.length > 2 ? 2 : favs.length))
        FavoriteBody(
          id: fav['id'],
          name: fav['name'],
          modes: fav['modes'],
          line: fav['line'],
          update: update,
        ),

      //
    ],
  );
}