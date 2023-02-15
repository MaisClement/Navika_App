import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:navika/src/extensions/datetime.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/route/listbutton.dart';

import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/load.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:flutter/foundation.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/routing.dart';

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
  bool posUsed = false;
  List places = [];
  List journeys = [];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  String currentTextInput = 'dep';
  bool displayJourneys = true;
  Map textController = {
    'dep' : TextEditingController(),
    'arr' : TextEditingController(),
  };
  Map textNode = {
    'dep' : FocusNode(),
    'arr' : FocusNode(),
  };

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

  Future<void> _getPlaces() async {
    String url = '';

    bool allowGps = await globals.hiveBox.get('allowGps') ?? false;
    if (allowGps && (globals.locationData?.latitude != null || globals.locationData?.longitude != null) && search != '') {
      url = '${globals.API_PLACES}?q=$search&lat=${globals.locationData?.latitude}&lon=${globals.locationData?.longitude}';

    } else if (search != '') {
      url = '${globals.API_PLACES}?q=$search';
      
    } else if (allowGps && globals.locationData?.latitude != null && globals.locationData?.longitude != null){
      url = '${globals.API_PLACES}?lat=${globals.locationData?.latitude}&lon=${globals.locationData?.longitude}';

    } else {
      url = '${globals.API_PLACES}?q=';

    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (mounted) {
          setState(() {
            places = data['places'];
            isLoading = false;
            error = '';
          });
        }
      } else {
        setState(() {
          error = 'Récupération des lieux impossible.';
        });
      }
    } catch (e) {
      setState(() {
        error = "Une erreur s'est produite.";
      });
    }
	}

  Future<void> _getJourneys() async {
    if (kDebugMode) {
      print({'INFO_', globals.route['dep']['id'], globals.route['arr']['id']});
    }
    String url = '${globals.API_JOURNEYS}?from=${globals.route["dep"]["id"]}&to=${globals.route["arr"]["id"]}';

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (mounted) {
          setState(() {
            journeys = data['journeys'];
            isLoading = false;
            error = '';
          });
        }
      } else {
        setState(() {
          error = 'Récupération des trajets impossible.';
        });
      }
    } catch (e) {
      setState(() {
        error = "Une erreur s'est produite.";
      });
    }
  }

  void _initSearch() async {
    // Arrivée + départ
    bool allowGps = await globals.hiveBox.get('allowGps') ?? false;
    if (allowGps && (globals.locationData != null || globals.route['dep']['id'] != null) && globals.route['arr']['id'] != null ){
      if (globals.route['dep']['id'] != null) {
        textController['dep'].text = globals.route['dep']['name'];
      } else {
        textController['dep'].text = yourPos;
        globals.route['dep']['name'] = yourPos;
        globals.route['dep']['id'] = '${globals.locationData?.longitude};${globals.locationData?.latitude}';
        setState(() {
          posUsed = true;
        });
      }
      textController['arr'].text = globals.route['arr']['name'];
      // Result
      setState(() {
        displayJourneys = false;
      });
      _getJourneys();
    } 
    
    else if (globals.route['dep']['id'] != null) { // On a un départ
      textController['dep'].text = globals.route['dep']['name'];
      setState(() {
        currentTextInput = 'arr';
      });
      _getPlaces();
      FocusScope.of(context).requestFocus(textNode['arr']);
    } 
    
    else if (allowGps && globals.locationData != null) { // On a un GPS
      textController['dep'].text = yourPos;
      globals.route['dep']['name'] = yourPos;
      globals.route['dep']['id'] = '${globals.locationData?.longitude};${globals.locationData?.latitude}';
      setState(() {
        posUsed = true;
        currentTextInput = 'arr';
      });
      _getPlaces();
      FocusScope.of(context).requestFocus(textNode['arr']);
    } 
    
    else if (globals.route['arr']['id'] != null) { // On a une arrivée
      textController['arr'].text = globals.route['arr']['name'];

      setState(() {
        currentTextInput = 'dep';
      });
      _getPlaces();
      FocusScope.of(context).requestFocus(textNode['dep']);
    }
    
    else { // On a rien
      setState(() {
        currentTextInput = 'dep';
      });
      _getPlaces();
      FocusScope.of(context).requestFocus(textNode['dep']);
    }
  }

  void _handleClick(name, id) {
    globals.route[currentTextInput]['id'] = id;
    globals.route[currentTextInput]['name'] = name;
    textController[currentTextInput].text = name;

    if (globals.route['dep']['id'] == null) {
      setState(() {
        currentTextInput = 'dep';
        search = '';
      });
      FocusScope.of(context).requestFocus(textNode['dep']);
      _getPlaces();
      
    } else if (globals.route['arr']['id'] == null) {
      setState(() {
        currentTextInput = 'arr';
        search = '';
      });
      FocusScope.of(context).requestFocus(textNode['arr']);
      _getPlaces();
      
    } else {
      if (!FocusScope.of(context).hasPrimaryFocus) {
        FocusScope.of(context).unfocus();
      }
      setState(() {
        displayJourneys = false;
      });
      _getJourneys();
    } 
  }

  void _onTapText(current) {
    displayJourneys = true;
    if (current != 'dep' && current != 'arr') {
      throw Exception ('Invalid current value: $current');
    }
    setState(() {
      currentTextInput = current;
      search = '';
    });
  
    if (textController[current].text == yourPos) {
      setState(() {
        posUsed = false;
      });
    }
    textController[current].text = '';
    globals.route[current]['id'] = null;
    globals.route[current]['name'] = null;
    _getPlaces();
  }

  void _onChangeText(current, value){
    if (current != 'dep' && current != 'arr') {
      throw Exception ('Invalid current value: $current');
    }
    setState(() {
      currentTextInput = current;
      displayJourneys = true;
      search = value;
    });
    _getPlaces();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
      _initSearch()
    });
  }

  @override
  void dispose() {
    textController['dep'].dispose();
    textController['arr'].dispose();
    super.dispose();
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
	  	appBar: AppBar(
	  		title: Text(title,
        style: appBarTitle
      ),
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1),
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
                    Expanded(
                      child: TextField(
                        controller: textController['dep'],
                        focusNode: textNode['dep'],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Départ'
                        ),
                        onChanged: (value) {
                          _onChangeText('dep', value);
                        },
                        onTap: () {
                          _onTapText('dep');
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:20.0, top:5.0,right:20.0,bottom:10.0),
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
                    Expanded(
                      child: TextField(
                        controller: textController['arr'],
                        focusNode: textNode['arr'],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Arrivée'
                        ),
                        onChanged: (value) {
                          _onChangeText('arr', value);
                        },
                        onTap: () {
                          _onTapText('arr');
                        },
                      ),
                    )
                  ],
                ),
              ),

              if (displayJourneys == false)
                Container(
                  margin: const EdgeInsets.only(left:20.0, right:20.0, top:5.0),
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
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
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
            ],
          ),
        ),

        if (error != '')
          ErrorBlock(
            error: error,
          )
        
        else if (displayJourneys == true && places.isNotEmpty)
          Expanded(
            child: ListView(
              children: [

                if (posUsed == false && search == '' && globals.locationData != null)
                  InkWell(                        
                    child: Opacity(
                      opacity: isLoading ? 0.4 : 1,
                      child: Container(
                        padding: const EdgeInsets.only(left:20.0, top:15.0,right:20.0,bottom:15.0),
                        height: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(ScaffoldIcon.location_indicator,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 30
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(yourPos,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Segoe Ui',
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      _handleClick(
                        '${globals.locationData?.longitude};${globals.locationData?.latitude}',
                        yourPos
                      );
                      setState(() {
                        posUsed = true;
                      });
                    },                
                  ),

                for (var place in places)
                  PlacesListButton(
                    isLoading: isLoading,
                    place: place,
                    onTap: () {
                      _handleClick(place['name'], place['id']);
                    },
                  ),
              ],
            ),
          )

        else if (displayJourneys == false && journeys.isNotEmpty && isLoading == false)
          Expanded(
            child: ListView(
              children: [

              for (var journey in journeys)
                RouteListButton(
                  journey: journey,
                  onTap: () {
                    globals.journey = journey;
                    RouteStateScope.of(context).go('/home/journeys/details');
                  },
                ),

              ]
            )
          )

        else if (displayJourneys == true && isLoading == true)
          const PlacesLoad()

        else if (displayJourneys == false && journeys.isEmpty && isLoading == true)
          const PlacesLoad()

        else if (displayJourneys == true && places.isEmpty && isLoading == false)
          const PlacesEmpty()
          
        else if (displayJourneys == false && journeys.isEmpty && isLoading == false)
          const PlacesEmpty()

        else
          const PlacesLoad()
          
      ],
      
    )
  ),
	);
}