// 🐦 Flutter imports:
import 'package:navika/l10n/app_localizations.dart';import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/journey/lines.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';

class BottomRecurrentJourney extends StatefulWidget {
  final Map journey;
  final bool isExisting;

  const BottomRecurrentJourney({
    required this.journey,
    this.isExisting = false,
    super.key,
  });

  @override
  State<BottomRecurrentJourney> createState() => _BottomRecurrentJourneyState();
}

class _BottomRecurrentJourneyState extends State<BottomRecurrentJourney> with SingleTickerProviderStateMixin {
  
  String type = 'same'; // default, fastest, same
  bool isLoading = false;

  void setType(value) {
    setState(() {
      type = value;
    });
  }

  void add() {
    List recurrentJourneys = List.from(globals.hiveBox.get('recurrentJourneys') ?? []);
    recurrentJourneys.add({
      'from' : {
        'name': globals.route['from']['name'],
        'id':   globals.route['from']['name'] == AppLocalizations.of(context)!.your_position
                ? 'position'
                : globals.route['from']['id'],
      },
      'to' : {
        'name': globals.route['to']['name'],
        'id':   globals.route['to']['name'] == AppLocalizations.of(context)!.your_position
                ? 'position'
                : globals.route['to']['id'],
      },
      'type': type,
      'lines' : getLineByJourney(widget.journey),
    });
    globals.hiveBox.put('recurrentJourneys', recurrentJourneys);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: accentColor(context).withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2),
              )
            ]),
        child: Column(
          children: [
            const SizedBox(height: 10),
            if (isLoading)
              const LinearProgressIndicator(backgroundColor: Colors.transparent)
            else
              const SizedBox(height: 4),
            const SizedBox(height: 10),
            Opacity(
              opacity: isLoading ? 0.4 : 1,
              child: Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.isExisting
                            ? AppLocalizations.of(context)!.edit_route
                            : AppLocalizations.of(context)!.save_regular_trip,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: fontFamily,
                          color: accentColor(context),
                        ),
                      ),
                      Divider(
                        color: accentColor(context),
                      ),

                      Text(globals.route['from']['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          fontFamily: fontFamily,
                          color: accentColor(context),
                        ),
                      ),
                      Text('➜ ${globals.route['to']['name']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          fontFamily: fontFamily,
                          color: accentColor(context),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            RouteLines(
                              sections: filterSection(widget.journey['sections']),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 5),
                        child: Text(
                          AppLocalizations.of(context)!.select_trip,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: fontFamily,
                            color: accentColor(context),
                          ),
                        ),
                      ),
                      RadioTiles(
                        tiles: [
                          {
                            'name': AppLocalizations.of(context)!.same,
                            'value': 'same',
                            'icon': NavikaIcons.futur
                          },
                          {
                            'name': AppLocalizations.of(context)!.best,
                            'value': 'default',
                            'icon': NavikaIcons.stars
                          },
                          {
                            'name': AppLocalizations.of(context)!.fastest,
                            'value': 'fastest',
                            'icon': NavikaIcons.avance
                          },
                        ],
                        value: type,
                        onTileChange: (value) {
                          setType(value);
                        },
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      
                      Center(
                        child: IconElevatedButton(
                          icon: NavikaIcons.plus,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: const Color(0xffffffff),
                          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                          text: AppLocalizations.of(context)!.save,
                          onPressed: () async {
                            add();
                          }
                        ),
                      ),
                      
                      Center(
                        child: IconElevatedButton(
                          icon: NavikaIcons.cancel,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: const Color(0xffffffff),
                          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                          text: AppLocalizations.of(context)!.cancel,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
  );
}
