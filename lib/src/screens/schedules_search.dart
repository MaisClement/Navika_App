import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:navika/src/widgets/places/load.dart';

class SchedulesSearch extends StatefulWidget {
	const SchedulesSearch({super.key});

	@override
	State<SchedulesSearch> createState() => _SchedulesSearchState();
}

class _SchedulesSearchState extends State<SchedulesSearch> {
  final myController = TextEditingController();
  
  FocusNode textFieldNode = FocusNode();
  String search = '';
  ApiStatus error = ApiStatus.ok;
  int flag = 0;
  bool isLoading = false;
  List places = [];

  Future<void> _getStops() async {
    flag++;

    setState(() {
      isLoading = true;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getStops(search, globals.locationData, flag);
    
    if (mounted) {
      setState(() {
        if (result['value']?['flag'] == flag) {
          places = result['value']?['places'];
        }
        error = result['status'];
        isLoading = false;
      });
    }
	}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
      FocusScope.of(context).requestFocus(textFieldNode),
      _getStops()
    });
  }
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(
			title: TextField(
        controller: myController,
        focusNode: textFieldNode,
        decoration: const InputDecoration(
          hintText: 'Rechercher une gare, un arrêt ou une stations'
        ),
        onChanged: (text) {
          setState(() {
            search = text;
          });
          _getStops();
        },
      ),
		),
		body: ListView(
      children: [

        if (error != ApiStatus.ok)
          ErrorBlock(
            error: error,
          )
        
        else if (places.isNotEmpty)
          for (var place in places)
            PlacesListButton(
              isLoading: isLoading,
              place: place,
              onTap: () {
                globals.schedulesStopArea = place['id'];
                globals.schedulesStopName = place['name'];
                globals.schedulesStopModes = place['modes'];
                globals.schedulesStopLines = [];
                RouteStateScope.of(context).go('/schedules/stops/${place['id']}');
              },
            )

        else if (places.isEmpty && isLoading == true)
          const PlacesLoad()
          
        else
          const PlacesEmpty(),
      ],
      
    )
  );
}