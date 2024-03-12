import 'package:flutter/material.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/journey/favorites.dart';

class HomeWidgetJourneys extends StatelessWidget {
  final List journeys;
  final Function update;

  const HomeWidgetJourneys({
    required this.journeys,
    required this.update,
    super.key,
  });
  

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ...[
        if (journeys.isEmpty)
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
                    const Text('Vous n’avez pas d’itinéraires prévu.',
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
  );
}
