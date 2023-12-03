import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/favorites/body.dart';
import 'package:navika/src/widgets/home/fav_scroll.dart';
import 'package:navika/src/widgets/home/messages.dart';
import 'package:navika/src/widgets/route/favorites.dart';
import 'package:navika/src/widgets/trafic/block.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

class HomeBody extends StatelessWidget {
  final ScrollController scrollController;
  final Map index;
  final List address;
  final List favs;
  final List lines;
  final List trafic;
  final List journeys;
  final List blocks;
  final Function update;

  const HomeBody({
    required this.scrollController,
    required this.index,
    required this.address,
    required this.favs,
    required this.lines,
    required this.trafic,
    required this.journeys,
    required this.blocks,
    required this.update,
    super.key,
  });
  

  List<Widget> _buildHome(context) {
    List<Widget> res = [];

    for (var block in blocks) {
      // HomeMessage
      if (block['id'] == 'message' && block['enabled'] == true && index['message'] != null) {
        for (var message in index['message']) {
          res.add(
            HomeMessage(message: message)
          );
        }
      }

      // Itinéraires
      if (block['id'] == 'journeys' && block['enabled'] == true) {
        res.add(
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(
                      'Vos itinéraires',
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
              ...[
                if (journeys.isEmpty)
                  Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          const Image(
                            image: AssetImage(
                              'assets/img/journeys.png',
                            ),
                            width: 80,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  'Vous n’avez pas d’itinéraires prévu.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Segoe Ui',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Center(
                                  child: ElevatedButton(
                                    child: const Text('Tous vos itinéraires ➜'),
                                    onPressed: () {
                                      RouteStateScope.of(context).go('/home/journeys/list');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RouteFavorites(
                        journeys: journeys.sublist(0, getMaxLength(2, journeys)),
                        update: update
                      ),
                      Center(
                        child: ElevatedButton(
                          child: const Text('Tous vos itinéraires ➜'),
                          onPressed: () {
                            RouteStateScope.of(context).go('/home/journeys/list');
                          },
                        ),
                      ),
                    ],
                  ),
              ]
            ],
          ),
        );
      }

      // Trafic
      if (block['id'] == 'trafic' && block['enabled'] == true && lines.isNotEmpty) {
        res.add(
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
        );
        res.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Wrap(
              children: [
                for (var line in lines)
                  TraficBlock(
                    line: line,
                    trafic: trafic,
                    isLoading: trafic.isEmpty,
                  ),
              ],
            ),
          ),
        );
      }


      // Trafic
      if (block['id'] == 'schedules' && block['enabled'] == true && favs.isNotEmpty) {
        res.add(
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
              for (var fav in favs.sublist(0, getMaxLength(2, favs) ))
                FavoriteBody(
                  id: fav['id'],
                  key: ValueKey(fav['id']),
                  name: fav['name'],
                  line: fav['line'],
                  update: update,
                  removeSeparator: true,
                ),
            ],
          ),
        );
      }
    }

    return res;
  }

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

          ..._buildHome(context),

          const Divider(
            color: Color(0xff808080),
            thickness: 1.5,
            indent: 20,
            endIndent: 20,
          ),
        
          Center(
            child: IconElevatedButton(
              icon: NavikaIcons.settings,
              width: 240,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surface,
                foregroundColor: accentColor(context),
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              text: 'Réorganiser cette page',
              onPressed: () {
                RouteStateScope.of(context).go('/home/settings');
              },
            ),
          ),
        ],
      );
}
