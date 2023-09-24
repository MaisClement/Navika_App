import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/favorites/body.dart';
import 'package:navika/src/widgets/home/fav_scroll.dart';
import 'package:navika/src/widgets/home/messages.dart';
import 'package:navika/src/widgets/trafic/block.dart';

class HomeBody extends StatelessWidget {
  final ScrollController scrollController;
  final Map index;
  final List address;
  final List favs;
  final List lines;
  final List trafic;
  final Function update;

  const HomeBody({
    required this.scrollController,
    required this.index,
    required this.address,
    required this.favs,
    required this.lines,
    required this.trafic,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView(
        controller: scrollController,
        padding: const EdgeInsets.only(top: 90),
        children: [
          SizedBox(
            height: 85,
            child: HomeBodyFavScroll(
              address: address,
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          // Messages de l'index
          if (index['message'] != null)
            for (var message in index['message']) HomeMessage(message: message),

          // Lines
          if (lines.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'Etat du trafic',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: accentColor(context),
                    ),
                  ),
                ),
              ],
            ),

            if (lines.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Wrap(
                  children: [
                    for (var line in lines)
                      TraficBlock(
                        line: line,
                        trafic: trafic,
                      ),
                  ],
                ),
              ),

          // Favorites
          if (favs.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'Vos horaires',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: accentColor(context),
                    ),
                  ),
                ),
              ],
            ),
          for (var fav in favs.sublist(0, getMaxLength(2, favs) ))
            FavoriteBody(
              id: fav['id'],
              key: ValueKey(fav['id']),
              name: fav['name'],
              line: fav['line'],
              update: update,
              removeSeparator: true,
            ),

          //
        ],
      );
}
