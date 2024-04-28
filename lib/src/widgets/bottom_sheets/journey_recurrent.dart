// 🐦 Flutter imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/journey/lines.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';

final MaterialStateProperty<Icon?> thumbIcon =
    MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  },
);

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

  // String? id;
  // bool sendAlert = false;
  // 
  // Map days = {
  //   'monday': true, // true, false
  //   'tuesday': true,
  //   'wednesday': true,
  //   'thursday': true,
  //   'friday': true,
  //   'saturday': false,
  //   'sunday': false,
  // };
  // 
  // Map times = {
  //   'start_time': TimeOfDay(hour: 7, minute: 0),
  //   'end_time': TimeOfDay(hour: 18, minute: 0),
  // };

  void setType(value) {
    setState(() {
      type = value;
    });
  }

  // void setAlertMode(value) {
  //   setState(() {
  //     sendAlert = value;
  //   });
  // }
  // 
  // void setDays(key, value) {
  //   setState(() {
  //     days[key] = value;
  //   });
  // }

  void add() {
    List recurrentJourneys = globals.hiveBox.get('recurrentJourneys');
    recurrentJourneys.add({
      'from' : {
        'name': widget.journey['sections'][0]['from']['name'],
        'id':   widget.journey['sections'][0]['from']['id'],
      },
      'to' : {
        'name': widget.journey['sections'][widget.journey['sections'].length - 1]['to']['name'],
        'id':   widget.journey['sections'][widget.journey['sections'].length - 1]['to']['id'],
      },
      'type': type,
      'lines' : getLineByJourney(widget.journey),
    });
    globals.hiveBox.put('recurrentJourneys', recurrentJourneys);
    Navigator.pop(context);
  }

  // selectTime(String type, BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: times[type],
  //     builder: (BuildContext context, Widget? child) {
  //       return MediaQuery(
  //         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
  //         child: child!,
  //       );
  //     },
  //   );
  //   if (picked != null && picked != times[type]) {
  //     setState(() {
  //       times[type] = picked;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await getAlert();
    });
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
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          color: accentColor(context),
                        ),
                      ),
                      Divider(
                        color: accentColor(context),
                      ),

                      Text(widget.journey['sections'][0]['from']['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          color: accentColor(context),
                        ),
                      ),

                      Text('➜ ${widget.journey['sections'][widget.journey['sections'].length - 1]['to']['name']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
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
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Segoe Ui',
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

                      //if (type == 'same')
                      //  Column(
                      //    crossAxisAlignment: CrossAxisAlignment.start,
                      //    children: [
                      //      SizedBox(height: 20),
                      //      Row(
                      //        children: [
                      //          Expanded(
                      //            child: Text('Etre prévenu en cas de perturbations',
                      //              style: TextStyle(
                      //                fontSize: 16,
                      //                fontWeight: FontWeight.w600,
                      //                fontFamily: 'Segoe Ui',
                      //                color: accentColor(context),
                      //              ),
                      //            ),
                      //          ),
                      //          Switch(
                      //            thumbIcon: thumbIcon,
                      //            trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                      //              if (!states.contains(MaterialState.selected)) {
                      //                return mainColor(context);
                      //              }
                      //              return null;
                      //            }),
                      //            inactiveThumbColor: mainColor(context),
                      //            value: sendAlert,
                      //            onChanged: (bool value) {
                      //              setAlertMode(value);
                      //            },
                      //          ),
                      //        ],
                      //      ),
                      //      Container(
                      //        margin: EdgeInsets.only(top: 10, bottom: 5),
                      //        child: Text(
                      //          AppLocalizations.of(context)!.alert_days,
                      //          style: TextStyle(
                      //            fontWeight: FontWeight.w600,
                      //            fontFamily: 'Segoe Ui',
                      //            color: accentColor(context),
                      //          ),
                      //        ),
                      //      ),
                      //      MiniSelectTiles(
                      //        tiles: [
                      //          {
                      //            'name': 'L',
                      //            'value': 'monday',
                      //          },
                      //          {
                      //            'name': 'M',
                      //            'value': 'tuesday',
                      //          },
                      //          {
                      //            'name': 'M',
                      //            'value': 'wednesday',
                      //          },
                      //          {
                      //            'name': 'J',
                      //            'value': 'thursday',
                      //          },
                      //          {
                      //            'name': 'V',
                      //            'value': 'friday',
                      //          },
                      //          {
                      //            'name': 'S',
                      //            'value': 'saturday',
                      //          },
                      //          {
                      //            'name': 'D',
                      //            'value': 'sunday',
                      //          }
                      //        ],
                      //        value: days,
                      //        onTileChange: (key, value) {
                      //          setDays(key, value);
                      //        },
                      //      ),
                      //      Container(
                      //        margin: EdgeInsets.only(top: 20, bottom: 5),
                      //        child: Text(
                      //          AppLocalizations.of(context)!.time_range,
                      //          style: TextStyle(
                      //            fontWeight: FontWeight.w600,
                      //            fontFamily: 'Segoe Ui',
                      //            color: accentColor(context),
                      //          ),
                      //        ),
                      //      ),
                      //      Row(
                      //        mainAxisAlignment: MainAxisAlignment.center,
                      //        children: [
                      //          TimeBox(
                      //            text: getTodTime(times['start_time']),
                      //            icon: NavikaIcons.clock,
                      //            onTap: () async {
                      //              await selectTime('start_time', context);
                      //              setState(() {});
                      //            },
                      //          ),
                      //          Padding(
                      //            padding: EdgeInsets.only(left: 15, right: 15),
                      //            child: Icon(
                      //              NavikaIcons.avance,
                      //              color: Theme.of(context).colorScheme.onSurface,
                      //            ),
                      //          ),
                      //          TimeBox(
                      //            text: getTodTime(times['end_time']),
                      //            icon: NavikaIcons.clock,
                      //            onTap: () async {
                      //              await selectTime('end_time', context);
                      //              setState(() {});
                      //            },
                      //          )
                      //        ],
                      //      ),
                      //    ],
                      //  ),

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
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
  );
}
