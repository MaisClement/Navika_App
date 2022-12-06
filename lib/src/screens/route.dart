import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navika/src/icons/scaffold_icon_icons.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/load.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:navika/src/data/global.dart' as globals;

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

  void _initSearch() {
    // Arrivée + départ
    if ((globals.locationData != null || globals.route['dep']['id'] != null) && globals.route['arr']['id'] != null ){
      if (globals.route['dep']['id'] == null) {
        globals.route['dep']['name'] = yourPos;
        globals.route['dep']['id'] = '${globals.locationData?.latitude};${globals.locationData?.longitude}';
        setState(() {
          posUsed = true;
        });
      }
      // Result
    } 
    
    // On a un GPS
    else if (globals.locationData != null) { 
      globals.route['dep']['name'] = yourPos;
      globals.route['dep']['id'] = '${globals.locationData?.latitude};${globals.locationData?.longitude}';
      setState(() {
        posUsed = true;
      });
    }
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
                child: InkWell(
                  onTap: () {
                    RouteStateScope.of(context).go('/journeys/search/dep/');
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
              )
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