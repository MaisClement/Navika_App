import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

import '../routing.dart';
import '../widgets/icons.dart';
import '../data/global.dart' as globals;

class RouteSearch extends StatefulWidget {
	const RouteSearch({super.key});

	@override
	State<RouteSearch> createState() => _RouteSearchState();
}

class _RouteSearchState extends State<RouteSearch> {
  final textControllerDepart = TextEditingController();
  final textControllerArrivee = TextEditingController();
  FocusNode textNodeDepart = FocusNode();
  FocusNode textNodeArrivee = FocusNode();

	final String title = 'Itinéraires';
  final String yourPos = 'Votre position';
  
  String search = '';
  bool isLoading = false;
  List places = [];

  Future<void> _getPlaces() async {
    String url = '';

    if ((globals.locationData?.latitude != null || globals.locationData?.longitude != null) && search != '') {
      url = '${globals.API_STOP_AREA}?q=$search&lat=${globals.locationData?.latitude}&lon=${globals.locationData?.longitude}';

    } else if (search != '') {
      url = '${globals.API_STOP_AREA}?q=$search';
      
    } else if (globals.locationData?.latitude != null && globals.locationData?.longitude != null){
      url = '${globals.API_STOP_AREA}?lat=${globals.locationData?.latitude}&lon=${globals.locationData?.longitude}';

    } else {
      url = '${globals.API_STOP_AREA}?q=';

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
    // Cas 1 - Rien de saisie
    // Cas 2 - Juste un GPS
    // Cas 3 - GPS + Une arrivée
    // Cas 4 - Juste une arrivée

    // Arrivée + départ
    if ((globals.locationData != null || globals.route['dep_id'] != null) && globals.route['arr_id'] != null ){
      if (globals.route['dep_id'] != null) {
        textControllerDepart.text = globals.route['dep_name'];
      } else {
        textControllerDepart.text = yourPos;
      }
      textControllerArrivee.text = globals.route['arr_name'];
      // Result
    } 
    // On a un départ
    else if (globals.route['dep_id'] != null) {
      textControllerDepart.text = globals.route['dep_name'];
      FocusScope.of(context).requestFocus(textNodeArrivee);
      _getPlaces();
    } 
    // On a un GPS
    else if (globals.locationData != null) {
      textControllerDepart.text = yourPos;
      FocusScope.of(context).requestFocus(textNodeArrivee);
      _getPlaces();
    } 
    // On a une arrivée
    else if (globals.route['arr_id'] != null) {
      textControllerArrivee.text = globals.route['arr_name'];
      FocusScope.of(context).requestFocus(textNodeDepart);
      _getPlaces();
    }
    // On a rien
    else {
      FocusScope.of(context).requestFocus(textNodeDepart);
      _getPlaces();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initSearch());
  }
  @override
  void dispose() {
    textControllerDepart.dispose();
    textControllerArrivee.dispose();
    super.dispose();
  }

  @override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(
			title: Text(title),
      centerTitle: true,
      elevation: 0,
		),
		body: Column(
      
      children: [
        Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.only(left:20.0, top: 10.0,right: 20.0),
          child: Container(
            padding: EdgeInsets.only(left:10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/marker.svg',
                  color: Theme.of(context).colorScheme.secondary,
                  height: 30
                ),
                Flexible(
                  child: TextField(
                    controller: textControllerDepart,
                    focusNode: textNodeDepart,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Départ"
                    ),
                    onChanged: (text) {
                      setState(() {
                        search = text;
                      });
                      _getPlaces();
                    },
                  ),
                )
              ],
            ),
          )
        ),
        Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.only(left:20.0, top:10.0,right:20.0,bottom:20.0),
          child: Container(
            padding: EdgeInsets.only(left:10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/finish-flag.svg',
                  color: Theme.of(context).colorScheme.secondary,
                  height: 30
                ),
                Flexible(
                  child: TextField(
                    controller: textControllerArrivee,
                    focusNode: textNodeArrivee,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Arrivée"
                    ),
                    onChanged: (text) {
                      setState(() {
                        search = text;
                      });
                      _getPlaces();
                    },
                  ),
                )
              ],
            ),
          )
        ),
        
        if (!places.isEmpty)
          Expanded(
            child: ListView(
              children: [
                for (var place in places)
                  InkWell(                        
                    child: Opacity(
                      opacity: isLoading ? 0.4 : 1,
                      child: Container(
                        padding: EdgeInsets.only(left:20.0, top:5.0,right:20.0,bottom:5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(place['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Parisine',
                                ),
                              ),
                            ),
                            
                            if (place['distance'] == 0)
                              Container(
                                margin: EdgeInsets.only(left:5.0, top:4.0),
                                child: Text('${place['zip_code']}, ${place['town']}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Parisine',
                                  ),
                                ),
                              ),
                            if (place['distance'] != 0)
                              Container(
                                margin: EdgeInsets.only(left:5.0, top:4.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/walking.svg',
                                      color: Colors.grey,
                                      height: 15
                                    ),
                                    
                                    Text('${place['distance']}m',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Parisine',
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                    ),
                                    Text('${place['zip_code']}, ${place['town']}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Parisine',
                                      ),
                                    ),
                                  ],
                                )
                              ),

                            Wrap( 
                              children: [
                                for (var i = 0; i < place['lines'].length; i++)
                                
                                  Icones(
                                    line: place['lines'][i],
                                    old_line: i > 0 ? place['lines'][i - 1] : place['lines'][i],
                                    i: i,
                                  )
                                
                              ]
                            )
                          ]
                        )
                      ),
                    ),
                    onTap: () {
                      globals.stopArea = place['id'];
                      globals.stopName = place['name'];
                      RouteStateScope.of(context).go('/schedules/details');
                    },                
                  ),
              ]
            )
          ),

        if (places.isEmpty && isLoading == true)
          Container(
            margin: EdgeInsets.only(top:40.0),
            child: Center(
              child: Column(
                children: [
                  const CircularProgressIndicator(),
                  Text('Chargement...', 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ]
              ),
            ),
          ),
          

        if (places.isEmpty && isLoading == false)
          Container(
            margin: EdgeInsets.only(top:40.0),
            child: Center(
              child: Text('🔭 Nous n\'avons rien trouvé...', 
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
      ],
      
    )
  );
}