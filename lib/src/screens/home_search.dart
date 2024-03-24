import 'dart:async';

import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:navika/src/api.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/screens/home.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:navika/src/widgets/places/load.dart';

class HomeSearch extends StatefulWidget {
	const HomeSearch({super.key});

	@override
	State<HomeSearch> createState() => _SchedulesSearchState();
}

class _SchedulesSearchState extends State<HomeSearch> {
  final myController = TextEditingController();
  
  FocusNode textFieldNode = FocusNode();
  String search = '';
  ApiStatus error = ApiStatus.ok;
  int flag = 0;
  bool isLoading = false;
  List places = [];

  Future<void> _getPlaces() async {
    flag++;

    if (globals.query != null) {
      myController.text = globals.query!;
      search = globals.query!;
      globals.query = null;
    }

    setState(() {
      isLoading = true;
      flag = flag;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getPlaces(search, globals.locationData, flag);

    if (mounted) {
      setState(() {
        error = result['status'];
      });
      
      if (result['value']?['flag'] == flag && result['value']?['places'] != null) {
        setState(() {
          places = result['value']?['places'];
          isLoading = false;
        });
      }
    }
	}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(textFieldNode);
      _getPlaces();
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
          hintText: 'Rechercher un lieu sur la carte'
        ),
        onChanged: (text) {
          setState(() {
            search = text;
          });
          _getPlaces();
        },
      ),
		),
		body: ListView(
      children: [

        if (error != ApiStatus.ok)
          ErrorBlock(
            error: error,
            retry: _getPlaces,
          )
        
        else if (places.isNotEmpty)
          for (var place in places)
            PlacesListButton(
              isLoading: isLoading,
              place: place,
              onTap: () {
                globals.schedulesStopName = place['name'];
                GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(place['coord']['lat'] ?? 0, place['coord']['lon'] ?? 0);
                globals.hereMapController?.zoomTo(geoCoords, true);
                globals.panelController?.animatePanelToSnapPoint();
                if (place['type'] == 'stop_area' || place['type'] == 'stop_point')  {
                  RouteStateScope.of(context).go('/stops/${place['id']}');
                } else {
                  GeoCoordinates geoCoordinates = GeoCoordinates(place['coord']['lat'], place['coord']['lon']);
                  MapMarker? pointMarker = globals.hereMapController?.addMapMarker(
                    geoCoordinates,
                    'assets/img/marker/marker.png',
                    Metadata(),
                    100,
                  );
                  Home.setPointMarker(context, pointMarker);
                  RouteStateScope.of(context).go('/address/${place['coord']['lat']};${place['coord']['lon']}');
                }
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