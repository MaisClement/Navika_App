import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../routing.dart';
import '../data/global.dart' as globals;
import '../widgets/places/empty.dart';
import '../widgets/places/listbutton.dart';
import 'package:flutter/foundation.dart';
import '../widgets/places/load.dart';

class SchedulesSearch extends StatefulWidget {
	const SchedulesSearch({super.key});

	@override
	State<SchedulesSearch> createState() => _SchedulesSearchState();
}

class _SchedulesSearchState extends State<SchedulesSearch> {
  final myController = TextEditingController();
	final String title = 'Arrêts';
  
  FocusNode textFieldNode = FocusNode();
  String search = '';
  String error = '';
  bool isLoading = false;
  List places = [];

  Future<void> _getPlaces() async {
    if (kDebugMode) {
      print({'INFO_', 'getPlaces'});
    }
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

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (mounted) {
          setState(() {
            places = data['places'];
            isLoading = false;
          });
        }
      } else {
        setState(() {
          error = "Récupération des informations impossible.";
        });
      }
    } catch (e) {
      setState(() {
        error = "Une erreur s'est produite.";
      });
    }
	}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
      FocusScope.of(context).requestFocus(textFieldNode),
      _getPlaces()
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
          hintText: "Rechercher une gare, un arrêt ou une stations"
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

        if (error != '')
          Column(
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 15),
                  SvgPicture.asset(
                    'assets/cancel.svg',
                    color: Colors.grey[600],
                    height: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      error,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Segoe Ui',
                      ),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
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
                globals.schedulesStopLines = place['lines'];
                RouteStateScope.of(context).go('/schedules/stops/${place["id"]}');
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