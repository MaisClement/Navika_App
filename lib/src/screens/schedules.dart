import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

import 'dart:convert';

import '../routing.dart';
import '../widgets/icons.dart';

import '../data/global.dart' as globals;

class SchedulesScreen extends StatefulWidget {
	const SchedulesScreen({super.key});

	@override
	State<SchedulesScreen> createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends State<SchedulesScreen> {
  final myController = TextEditingController();
	final String title = 'Horaires';
  
  String search = '';
  List places = [];

  Future<void> _getPlaces() async {
    if (search != ''){
			final response = await http.get(Uri.parse('${globals.API_PLACES}?q=$search'));
			final data = json.decode(response.body);

      if (mounted) {
        setState(() {
          places = data;
        });
      }
		} else {
      //places nearby
    }
	}

  @override
  void dispose() {
    myController.dispose();
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
          padding: EdgeInsets.only(left:20.0, top:20.0,right:20.0,bottom:20.0),
          child: Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            
            child: TextField(
              controller: myController,
              decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Où allons nous ?"),
              onChanged: (text) {
                setState(() {
                  search = text;
                });
                _getPlaces();
              },
            ),
            
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              for (var place in places)
                InkWell(                        
                  child: Container(
                    padding: EdgeInsets.only(left:20.0, top:5.0,right:20.0,bottom:5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(place['stop_area']['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Parisine',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:5.0, top:4.0),
                          child: Text('${place['stop_area']['administrative_regions']['zip_code']}, ${place['stop_area']['administrative_regions']['name']}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Parisine',
                            ),
                          ),
                        ),
                        Wrap( 
                          children: [
                            for (var i = 0; i < place['stop_area']['lines'].length; i++)
                            
                              Icones(
                                line: place['stop_area']['lines'][i],
                                old_line: i > 0 ? place['stop_area']['lines'][i - 1] : place['stop_area']['lines'][i],
                                i: i,
                              )
                            
                          ]
                        )
                      ]
                    )
                  ),
                  onTap: () {
                    globals.stopArea = place['stop_area']['id'];
                    globals.stopName = place['stop_area']['name'];
                    RouteStateScope.of(context).go('/schedules/details');
                  },                
                ),
              ]
            )
        )
      ],
      
    )
  );
}