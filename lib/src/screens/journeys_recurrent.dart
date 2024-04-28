// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/journey/favorites.dart';

class RecurrentJourneysList extends StatefulWidget {
  const RecurrentJourneysList({super.key});

  @override
  State<RecurrentJourneysList> createState() => _RecurrentJourneysListState();
}

class _RecurrentJourneysListState extends State<RecurrentJourneysList> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  List journeys = globals.hiveBox?.get('journeys');
  void update() {
    setState(() {
      journeys = globals.hiveBox?.get('journeys');
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      bottomNavigationBar: getNavigationBar(context),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.saved_routes, style: appBarTitle),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: AppLocalizations.of(context)!.upcoming,
                iconMargin: const EdgeInsets.only(bottom: 5, top: 5)),
              Tab(
                text: AppLocalizations.of(context)!.past,
                iconMargin: const EdgeInsets.only(bottom: 5, top: 5)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  children: [
                    RouteFavorites(
                      journeys: getFutureJourneys(journeys),
                      update: update,
                    ),
                  ],
                ),
                ListView(
                  children: [
                    RouteFavorites(
                      journeys: getPastJourneys(journeys),
                      update: update,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ));
}
