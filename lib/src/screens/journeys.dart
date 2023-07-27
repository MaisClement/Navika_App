import 'dart:async';

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
import 'package:navika/src/widgets/places/load.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/routing.dart';
import 'package:navika/src/widgets/utils/search_box.dart';

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

String getDateTitle(DateTime dt, TimeOfDay tod) {
  String d = '';
  if (dt.isToday()) {
    d = 'Aujourd’hui';
  }
  if (dt.isTomorrow()) {
    d = 'Demain';
  }
  d = '${dt.day} ${shortMonth[dt.month]}';

  String dthour = tod.hour < 10 ? '0${tod.hour}' : tod.hour.toString();
  String dtminute = tod.minute < 10 ? '0${tod.minute}' : tod.minute.toString();

  return '$d • ${dthour}h$dtminute ';
}

void initJourney(Map? from, Map? to, context) async {    
  bool allowGps = await globals.hiveBox.get('allowGps');

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
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  String currentTextInput = 'from';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    _selectTime(context);
  }

  Future<void> _selectTime(BuildContext context) async {
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
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
    _getJourneys();
  }

  Future<void> _getJourneys() async {
    if (globals.route['from']['id'] == null || globals.route['to']['id'] == null) {
      return;
    }
    DateTime dt = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, selectedTime.hour, selectedTime.minute);
    String travelerType = globals.hiveBox.get('travelerType');

    setState(() {
      isLoading = true;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getJourneys(globals.route['from']['id'], globals.route['to']['id'], dt, travelerType);

    setState(() {
      error = result['status'];
    });


    if (mounted) {
      setState(() {
        journeys = result['value']?['journeys'];
        isLoading = false;
      });
    }
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
            body: Column(
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
                        margin: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0, bottom: 10.0),
                        child: SearchBox(
                          text: globals.route['from']['name'] ?? 'Départ',
                          icon: NavikaIcons.marker,
                          onTap: () {
                            globals.route['from']['name'] = null;
                            globals.route['from']['id'] = null;
                            RouteStateScope.of(context).go('/home/journeys/search/from');
                          }
                          //TODO style si vide !
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0, bottom: 10.0),
                        child: SearchBox(
                          text: globals.route['to']['name'] ?? 'Arrivée',
                          icon: NavikaIcons.finish_flag,
                          onTap: () {
                            globals.route['to']['name'] = null;
                            globals.route['to']['id'] = null;
                            RouteStateScope.of(context).go('/home/journeys/search/to');
                          }
                          //TODO style si vide !
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0, bottom: 10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500),
                          ),
                          child: InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            borderRadius: BorderRadius.circular(500),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    NavikaIcons.clock,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    size: 25,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      child: Text(
                                        getDateTitle(selectedDate, selectedTime),
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer),
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (error != ApiStatus.ok)
                  ErrorBlock(
                    error: error,
                  )
                else if (journeys.isNotEmpty)
                  Expanded(
                    child: RefreshIndicator(
                      key: _refreshIndicatorKey,
                      onRefresh: _getJourneys,
                      child: ListView(
                        children: [
                          for (var journey in journeys)
                            RouteListButton(
                              journey: journey,
                              onTap: () {
                                globals.journey = journey;
                                RouteStateScope.of(context)
                                    .go('/home/journeys/details');
                              },
                            ),
                        ],
                      ),
                    ),
                  )
                else if (journeys.isEmpty && isLoading == false)
                  const PlacesEmpty()
                else
                  const PlacesLoad()
              ],
            )),
      );
}
