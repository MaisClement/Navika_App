import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/extensions/datetime.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/widgets/bottom_sheets/route_options.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/route/listbutton.dart';

import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/routing.dart';
import 'package:navika/src/widgets/route/skelton.dart';
import 'package:navika/src/widgets/utils/search_box.dart';
import 'package:navika/src/widgets/bottom_sheets/time_settings.dart';

const shortMonth = {
  1: 'jan.',
  2: 'fev.',
  3: 'mar.',
  4: 'avr.',
  5: 'mai',
  6: 'juin',
  7: 'juil.',
  8: 'août',
  9: 'sep.',
  10: 'oct.',
  11: 'nov.',
  12: 'dec.'
};

const longMonth = {
  1: 'janvier',
  2: 'fevrier',
  3: 'mars',
  4: 'avril',
  5: 'mai',
  6: 'juin',
  7: 'juillet',
  8: 'août',
  9: 'septembre',
  10: 'octobre',
  11: 'novembre',
  12: 'decembre',
};

String getDateTitle(String type, DateTime dt, TimeOfDay tod) {
  String d = '';

  if (type == 'departure') {
    d = 'Départ';
  } else {
    d = 'Arrivée';
  }

  if (dt.isToday()) {
    d = '$d aujourd’hui';
  } else if (dt.isTomorrow()) {
    d = '$d demain';
  }
  else {
    d = '$d le ${dt.day} ${shortMonth[dt.month]}';
  }

  String dthour = tod.hour < 10 ? '0${tod.hour}' : tod.hour.toString();
  String dtminute = tod.minute < 10 ? '0${tod.minute}' : tod.minute.toString();

  return '$d à ${dthour}h$dtminute ';
}

String getDate(DateTime dt) {
  if (dt.isToday()) {
    return 'Aujourd’hui';
  }
  if (dt.isTomorrow()) {
    return 'Demain';
  }
  return '${dt.day} ${longMonth[dt.month]}';
}

String getTodTime(TimeOfDay tod) {
  String dthour = tod.hour < 10 ? '0${tod.hour}' : tod.hour.toString();
  String dtminute = tod.minute < 10 ? '0${tod.minute}' : tod.minute.toString();

  return '${dthour}h$dtminute ';
}

void initJourney(Map? from, Map? to, context) async {    
  bool allowGps = await globals.hiveBox.get('allowGps');

  globals.selectedDate = DateTime.now();
  globals.selectedTime = TimeOfDay.now();
  globals.timeType = 'departure';

  // Arrivé et départ -> Affichage
  if (from!= null && to!= null) {
    globals.route['from'] = from;
    globals.route['to'] = to;
    RouteStateScope.of(context).go('/home/journeys'); 
  }

  // GPS et arrivé -> Affichage
  else if (allowGps && globals.locationData != null && to!= null) {
    globals.route['from']['id'] = '${globals.locationData?.longitude};${globals.locationData?.latitude}';
    globals.route['from']['name'] = 'Votre position';
    globals.route['to'] = to;
    RouteStateScope.of(context).go('/home/journeys'); 
  }

  // Arrivé -> Recherche du départ
  else if (to != null) {
    globals.route['to'] = to;
    RouteStateScope.of(context).go('/home/journeys/search/from');
  }

  // Départ -> Recherche de l'arrivée
  else if (from!= null) {
    globals.route['from'] = from;
    RouteStateScope.of(context).go('/home/journeys/search/to');
  }

  // Gps -> Recherche de l'arrivée
  else if (allowGps && globals.locationData != null) {
    globals.route['from']['id'] = '${globals.locationData?.longitude};${globals.locationData?.latitude}';
    globals.route['from']['name'] = 'Votre position';
    RouteStateScope.of(context).go('/home/journeys/search/to');
  }

  // On a rien
  else {
    RouteStateScope.of(context).go('/home/journeys');
  }
}

void addToHistory (Map place) {
  List history = globals.hiveBox.get('historyPlaces');

  if (history.any((element) => element['id'] == place['id']) ) {
    return;
  }

  place['type'] = 'history';
  if (place['lines'] != null) {
    place['lines'] = [];
  }

  history = [place, ...history];
  history = history.slice(0, history.length > 15 ? 15 : history.length);

  globals.hiveBox.put('historyPlaces', history);
}

class JourneysList extends StatefulWidget {
  const JourneysList({super.key});

  @override
  State<JourneysList> createState() => _JourneysListState();
}

class _JourneysListState extends State<JourneysList> {
  final String title = 'Itinéraires';
  final String yourPos = 'Votre position';

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  String search = '';
  ApiStatus error = ApiStatus.ok;
  bool isLoading = false;
  List journeys = [];
  double turn = 0;

  String currentTextInput = 'from';

  setTimeType(String type) {
    setState(() {
      globals.timeType = type;
    });
  }

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: globals.selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (picked != null && picked != globals.selectedDate) {
      setState(() {
        globals.selectedDate = picked;
      });
    }
  }

  selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null && picked != globals.selectedTime) {
      setState(() {
        globals.selectedTime = picked;
      });
    }
  }

  Future<void> _getJourneys() async {
    if (globals.route['from']['id'] == null || globals.route['to']['id'] == null) {
      return;
    }
    DateTime dt = DateTime(globals.selectedDate.year, globals.selectedDate.month, globals.selectedDate.day, globals.selectedTime.hour, globals.selectedTime.minute);
    String travelerType = globals.hiveBox.get('travelerType');

    setState(() {
      isLoading = true;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getJourneys(globals.route['from']['id'], globals.route['to']['id'], dt, travelerType, globals.timeType);

    if (mounted) {
      setState(() {
        error = result['status'];
      });
      
      if (result['value']?['journeys'] != null) {
        setState(() {
          journeys = result['value']?['journeys'];
          isLoading = false;
        });
      }
    }
  }

  void invert() {
    setState(() {
      var temp = globals.route['to'];
      globals.route['to'] = globals.route['from'];
      globals.route['from'] = temp;
      turn++;
    });
    update();
  }

  void update() {
    _refreshIndicatorKey.currentState?.show();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getJourneys());
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              Theme.of(context).colorScheme.brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark,
        ),
        child: Scaffold(
            bottomNavigationBar: getNavigationBar(context),
            appBar: AppBar(
              title: Text(title, style: appBarTitle),
              actions: [
                IconButton(
                  icon: const Icon(
                    NavikaIcons.options,
                  ),
                  tooltip: 'Options',
                  onPressed: () {
                    showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: bottomSheetBorder,
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) =>
                            const BottomRouteSettings());
                  },
                ),
              ],
              scrolledUnderElevation: 0,
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.5),
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0),
                            child: SearchBox(
                              text: globals.route['from']['name'] ?? 'Départ',
                              icon: NavikaIcons.marker,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              onTap: () {
                                globals.route['from']['name'] = null;
                                globals.route['from']['id'] = null;
                                RouteStateScope.of(context).go('/home/journeys/search/from');
                              },
                              //style: const TextStyle(
                              //  fontWeight: FontWeight.w400,
                              //  fontSize: 16,
                              //  color: Colors.grey
                              //),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0, bottom: 10.0),
                            child: SearchBox(
                              text: globals.route['to']['name'] ?? 'Arrivée',
                              icon: NavikaIcons.finish_flag,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                              ),
                              onTap: () {
                                globals.route['to']['name'] = null;
                                globals.route['to']['id'] = null;
                                RouteStateScope.of(context).go('/home/journeys/search/to');
                              },
                              // style: const TextStyle(
                              //   fontWeight: FontWeight.w400,
                              //   fontSize: 16,
                              //   color: Colors.grey
                              // ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0, bottom: 10.0),
                            child: SearchBox(
                              text: getDateTitle(globals.timeType, globals.selectedDate, globals.selectedTime),
                              icon: NavikaIcons.clock,
                              onTap: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: bottomSheetBorder,
                                  ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
                                      return TimeSettings(
                                        setState: setState,
                                        setTimeType: setTimeType,
                                        timeType: globals.timeType,
                                        selectedDate: globals.selectedDate,
                                        selectedTime: globals.selectedTime,
                                        selectDate: selectDate,
                                        selectTime: selectTime,
                                        update: update,
                                      );
                                    }
                                  );
                                  }
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: RefreshIndicator(
                        key: _refreshIndicatorKey,
                        onRefresh: _getJourneys,
                        child: ListView(
                          children: [
                            
                            if (error != ApiStatus.ok)
                              ErrorBlock(
                                error: error,
                              )
                            
                            else if (journeys.isNotEmpty)
                              for (var journey in journeys)
                                RouteListButton(
                                  journey: journey,
                                  onTap: () {
                                    globals.journey = journey;
                                    RouteStateScope.of(context)
                                        .go('/home/journeys/details');
                                  },
                                )
                            
                            else if (journeys.isEmpty && isLoading == false)
                              const PlacesEmpty()
                            
                            else
                              for (var i = 0; i < (Random().nextInt(4) + 4).toDouble() ; i++)
                                const RouteListSkelton()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 25,
                  right: 20,
                  width: 45,
                  height: 55,
                  child: Material(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50)
                    ),
                    color: getJourneysColor(context),
                    child: InkWell(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      onTap: () => invert(),
                      child: AnimatedRotation(
                          turns: turn / 2,
                          duration: const Duration(milliseconds: 300),
                        child: Icon(NavikaIcons.order, 
                          color: accentColor(context),
                        ),
                      ),
                    ),
                  ),
                ),
                
              ],
            )),
      );
}
