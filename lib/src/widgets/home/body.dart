// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/favorites/body.dart';
import 'package:navika/src/widgets/home/fav_scroll.dart';
import 'package:navika/src/widgets/home/messages.dart';

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
        padding: const EdgeInsets.only(top: 100),
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
            for (var message in index['message']) HomeMessage(message: message),

// Favorites
          if (favs.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 5,
                  thickness: 5,
                  color: dividerColor(context),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'Vos Favoris',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          for (var fav in favs.sublist(0, favs.length > 2 ? 2 : favs.length))
            FavoriteBody(
              id: fav['id'],
              name: fav['name'],
              modes: fav['modes'],
              line: fav['line'],
              update: update,
              removeSeparator: favs.indexOf(fav) == 0,
            ),

          //
        ],
      );
}
