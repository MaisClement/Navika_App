import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

import '../routing.dart';
import '../widgets/icons.dart';
import '../data/global.dart' as globals;
import '../widgets/places/empty.dart';
import '../widgets/places/listbutton.dart';
import '../widgets/places/load.dart';

class SchedulesScreen extends StatefulWidget {
	const SchedulesScreen({super.key});

	@override
	State<SchedulesScreen> createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends State<SchedulesScreen> {
  final myController = TextEditingController();
	final String title = 'Arrêts';
  
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getPlaces());
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
      // centerTitle: true,
      elevation: 0,
		),
		body: Column(
      
      children: [
        Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: const EdgeInsets.only(left:20.0, top:10.0,right:20.0,bottom:20.0),
          child: Container(
            padding: const EdgeInsets.only(left:10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),            
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/search.svg',
                  color: Theme.of(context).colorScheme.secondary,
                  height: 30
                ),
                Flexible(
                  child: TextField(
                    controller: myController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Rechercher une gare, un arrêt ou une stations"
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
                  Places_ListButton(
                    isLoading: isLoading,
                    place: place,
                    onTap: () {
                      globals.stopArea = place['id'];
                      globals.stopName = place['name'];
                      RouteStateScope.of(context).go('/schedules/details');
                    },
                  )
                  
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