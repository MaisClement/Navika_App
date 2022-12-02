import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navika/src/icons/Scaffold_icon_icons.dart';

import '../routing.dart';
import '../style/style.dart';
import '../widgets/places/empty.dart';
import '../widgets/places/load.dart';
import '../widgets/places/listbutton.dart';
import '../data/global.dart' as globals;

class RouteSearch extends StatefulWidget {
	const RouteSearch({super.key});

	@override
	State<RouteSearch> createState() => _RouteSearchState();
}

class _RouteSearchState extends State<RouteSearch> {
	final String title = 'Itinéraires';
  final String yourPos = 'Votre position';
  
  String search = '';
  bool isLoading = false;
  bool posUsed = false;
  List places = [];

  String currentTextInput = 'dep';
  Map textController = {
    'dep' : TextEditingController(),
    'arr' : TextEditingController(),
  };
  Map textNode = {
    'dep' : FocusNode(),
    'arr' : FocusNode(),
  };

  Future<void> _getPlaces() async {
    String url = '';

    if ((globals.locationData?.latitude != null || globals.locationData?.longitude != null) && search != '') {
      url = '${globals.API_PLACES}?q=$search&lat=${globals.locationData?.latitude}&lon=${globals.locationData?.longitude}';

    } else if (search != '') {
      url = '${globals.API_PLACES}?q=$search';
      
    } else if (globals.locationData?.latitude != null && globals.locationData?.longitude != null){
      url = '${globals.API_PLACES}?lat=${globals.locationData?.latitude}&lon=${globals.locationData?.longitude}';

    } else {
      url = '${globals.API_PLACES}?q=';

    }

    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (mounted) {
      setState(() {
        places = data['places'];
        isLoading = false;
      });
    }
	}

  void _initSearch() {
    // Arrivée + départ
    if ((globals.locationData != null || globals.route['dep']['id'] != null) && globals.route['arr']['id'] != null ){
      if (globals.route['dep']['id'] != null) {
        textController['dep'].text = globals.route['dep']['name'];
      } else {
        textController['dep'].text = yourPos;
        globals.route['dep']['name'] = yourPos;
        globals.route['dep']['id'] = '${globals.locationData?.latitude};${globals.locationData?.longitude}';
        setState(() {
          posUsed = true;
        });
      }
      textController['arr'].text = globals.route['arr']['name'];
      // Result
    } 
    
    else if (globals.route['dep']['id'] != null) { // On a un départ
      textController['dep'].text = globals.route['dep']['name'];
      setState(() {
        currentTextInput = 'arr';
      });
      _getPlaces();
      FocusScope.of(context).requestFocus(textNode['arr']);
    } 
    
    else if (globals.locationData != null) { // On a un GPS
      textController['dep'].text = yourPos;
      globals.route['dep']['name'] = yourPos;
      globals.route['dep']['id'] = '${globals.locationData?.latitude};${globals.locationData?.longitude}';
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
      });
      FocusScope.of(context).requestFocus(textNode['dep']);
      
    } else if (globals.route['arr']['id'] == null) {
      setState(() {
        currentTextInput = 'arr';
      });
      FocusScope.of(context).requestFocus(textNode['arr']);
      
    } else {
      if (!FocusScope.of(context).hasPrimaryFocus) {
        FocusScope.of(context).unfocus();
      }
    } 
  }

  void _onTapText(current) {
  //   if (current != 'dep' && current != 'arr') {
  //     throw Exception ('Invalid current value: $current');
  //   }
  //   setState(() {
  //     currentTextInput = current;
  //   });
  // 
  //   if (textController[current].text == yourPos) {
  //     textController[current].text = '';
  //     setState(() {
  //       posUsed = false;
  //     });
  //     globals.route[current]['id'] = null;
  //     globals.route[current]['name'] = null;
  //   }
  }

  void _onChangeText(current, value){
    if (current != 'dep' && current != 'arr') {
      throw Exception ('Invalid current value: $current');
    }
    setState(() {
      currentTextInput = current;
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
	Widget build(BuildContext context) => Scaffold(
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
                    Icon(Scaffold_icon.marker,
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
                          hintText: "Départ"
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
                    Icon(Scaffold_icon.finish_flag,
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
                          hintText: "Arrivée"
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
              )
            ],
          ),
        )
        ,
        
        if (places.isNotEmpty)
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
                                Icon(Scaffold_icon.location_indicator,
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
                          ]
                        )
                      ),
                    ),
                    onTap: () {
                      // RouteStateScope.of(context).go('/schedules/details');
                    },                
                  ),

                for (var place in places)
                  Places_ListButton(
                    isLoading: isLoading,
                    place: place,
                    onTap: () {
                      _handleClick(place['name'], place['id']);
                      // RouteStateScope.of(context).go('/schedules/details');
                    },
                  ),
              ]
            )
          ),

        if (places.isEmpty && isLoading == true)
          const Places_Load(),
          
        if (places.isEmpty && isLoading == false)
          const Places_Empty(),
      ],
      
    )
  );
}