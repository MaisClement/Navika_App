// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/journey/favorites.dart';

class HomeWidgetJourneys extends StatefulWidget {

  const HomeWidgetJourneys({
    super.key,
  });

  @override
  State<HomeWidgetJourneys> createState() => _HomeWidgetJourneysState();
}

class _HomeWidgetJourneysState extends State<HomeWidgetJourneys> {
  List journeys =  [];

  void getJourneys() {
    setState(() {
      journeys = sortJourneys(getFutureJourneys(globals.hiveBox?.get('journeys')));
    });
  }

  @override
  void initState() {
    super.initState();
    getJourneys();
  }

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
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: fontFamily,
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
                update: getJourneys
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
