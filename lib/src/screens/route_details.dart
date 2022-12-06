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

class RouteDetails extends StatefulWidget {
  final String dep;
  final String arr;

	const RouteDetails({
    required this.dep,
    required this.arr,
    super.key
  });

	@override
	State<RouteDetails> createState() => _RouteDetailsState();
}

class _RouteDetailsState extends State<RouteDetails> {
	final String title = 'Itinéraires';
  final String yourPos = 'Votre position';
  
  String error = '';
  List journeys = [];

  Future<void> _getPlaces() async {
    String url = '${globals.API_JOURNEYS}?from=${widget.dep}&to=${widget.arr}';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (mounted) {
          setState(() {
            journeys = data['journeys'];
            error = '';
          });
        }
      } else {
        setState(() {
          error = 'Récupération des informations impossible.';
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
              Text(globals.route['dep']['name']),
              Text(globals.route['arr']['name']),
            ],
          ),
        ),

        if (error != '')
          ErrorBlock(
            error: error,
          )
        
        else 
          Text(':)')
      ],
      
    )
  );
}