import 'package:flutter/material.dart';
import 'package:navika/src/extensions/datetime.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/bottom_sheets/remove_favorite.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/load.dart';
import 'package:navika/src/data/global.dart' as globals;

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

String getDateTitle (DateTime dt, TimeOfDay tod) {
  String d = '';
  if (dt.isToday()) {
      d = 'Aujourd\'hui';
  }
  if (dt.isTomorrow()) {
      d = 'Demain';
  }
  d = '${dt.day} ${shortMonth[dt.month]}';

  String dthour = tod.hour      < 10 ? '0${tod.hour}'   : tod.hour.toString();
  String dtminute = tod.minute  < 10 ? '0${tod.minute}' : tod.minute.toString();

  return '$d • ${dthour}h$dtminute ';
}

class RouteHome extends StatefulWidget {
	const RouteHome({super.key});

	@override
	State<RouteHome> createState() => _RouteHomeState();
}

class _RouteHomeState extends State<RouteHome> {
	final String title = 'Itinéraires';
  final String yourPos = 'Votre position';
  
  String search = '';
  String error = '';
  bool isLoading = false;
  List places = [];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      _selectTime(context);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 47),
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
  }

  void _initSearch() {
    setState(() {
      globals.routePosUsed = false;
    });
    // Arrivée + départ
    if ((globals.locationData != null || globals.route['dep']['id'] != null) && globals.route['arr']['id'] != null ){
      if (globals.route['dep']['id'] == null) {
        globals.route['dep']['name'] = yourPos;
        globals.route['dep']['id'] = '${globals.locationData?.latitude};${globals.locationData?.longitude}';
        setState(() {
          globals.routePosUsed = true;
        });
      }
      // Result
    } 
    
    // On a un GPS
    else if (globals.locationData != null) { 
      globals.route['dep']['name'] = yourPos;
      globals.route['dep']['id'] = '${globals.locationData?.latitude};${globals.locationData?.longitude}';
      setState(() {
        globals.routePosUsed = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initSearch();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(
			title: Text(title,
        style: appBarTitle
      ),
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1),

      actions: [
        IconButton(
          icon: const Icon(Icons.more_horiz),
          tooltip: 'Supprimer ce favori',
          onPressed: () {
            showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) =>
                  BottomRemoveFavorite(
                    id: '1',
                    name: 'name',
                    line: 'line',
                    update: () {} )
                  );
          },
        ),
      ]
      
		),
		body: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom:20.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1),
          ),            
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left:20.0, top:5.0,right:20.0,bottom:10.0),
                child: InkWell(
                  onTap: () {
                    if (globals.route['dep']['name'] == yourPos) {
                      setState(() {
                        globals.routePosUsed = false;
                      });
                    }
                    RouteStateScope.of(context).go('/journeys/search/dep');
                  },
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                    padding: const EdgeInsets.only(left:15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
                    ),            
                    child: Row(
                      children: [
                        Icon(ScaffoldIcon.marker,
                          color: Theme.of(context).colorScheme.primary,
                          size: 25
                        ),
                        if (globals.route['dep']['name'] == null)
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              child: Text('Départ',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          )

                        else
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              child: Text(globals.route['dep']['name'],
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:20.0, top:5.0,right:20.0,bottom:10.0),
                child: InkWell(
                  onTap: () {
                    if (globals.route['arr']['name'] == yourPos) {
                      setState(() {
                        globals.routePosUsed = false;
                      });
                    }
                    RouteStateScope.of(context).go('/journeys/search/arr');
                  },
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                    padding: const EdgeInsets.only(left:15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
                    ),            
                    child: Row(
                      children: [
                        Icon(ScaffoldIcon.finish_flag,
                          color: Theme.of(context).colorScheme.primary,
                          size: 25
                        ),
                        
                        if (globals.route['arr']['name'] == null)
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              child: Text('Arrivée',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          )

                        else
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              child: Text(globals.route['arr']['name'],
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left:20.0, top:5.0,right:20.0,bottom:10.0),
                width: 190,
                child: InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                    padding: const EdgeInsets.only(left:15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
                    ),            
                    child: Row(
                      children: [
                        Icon(ScaffoldIcon.clock_regular,
                          color: Theme.of(context).colorScheme.primary,
                          size: 25
                        ),
                        
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                            child: Text( getDateTitle(selectedDate, selectedTime),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        if (error != '')
          ErrorBlock(
            error: error,
          )

        else if (places.isEmpty && isLoading == true)
          const PlacesLoad(),
          
        if (places.isEmpty && isLoading == false)
          const PlacesEmpty(),
      ],
      
    )
  );
}