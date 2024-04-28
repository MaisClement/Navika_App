// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
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
                    Text(AppLocalizations.of(context)!.no_routes_planned,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe Ui',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text(AppLocalizations.of(context)!.all_your_routes),
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
                  child: Text(AppLocalizations.of(context)!.all_your_routes),
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
