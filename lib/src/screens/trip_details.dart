import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/widgets/departures/list.dart';
import 'package:navika/src/widgets/departures/block.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/error_message.dart';
import 'package:navika/src/widgets/trip/block.dart';

class TripDetails extends StatefulWidget {
  final String? tripId;

  const TripDetails({required this.tripId, super.key});

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails>
    with SingleTickerProviderStateMixin {
  String error = '';
  String title = 'Trajets';

  Map? vehicleJourney;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getVehicleJourneys();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getVehicleJourneys() async {
    if (kDebugMode) {
      print({'INFO_', widget.tripId});
    }
    try {
      if (mounted) {
        final response = await http.get(
            Uri.parse('${globals.API_VEHICLE_JOURNEY}?v=${widget.tripId}'));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          if (mounted) {
            setState(() {
              if (data['vehicle_journey'] != null) {
                vehicleJourney = data['vehicle_journey'];
              } else {
                error = 'Récupération des informations impossible.';
              }
            });
          }
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: appBarTitle),
              if (vehicleJourney != null)
                Text(
                    "Train n°${vehicleJourney?['informations']['name']} - ${vehicleJourney?['informations']['direction']['name']}",
                    style: appBarSubtitle),
            ],
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            if (error != '')
              ErrorMessage(
                error: error,
              ),
            if (vehicleJourney == null)
              Column(
                children: [
                  const SizedBox(height: 25),
                  const CircularProgressIndicator(),
                  Text(
                    'Chargement...',
                    style: TextStyle(
                        color: accentColor(context),
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20)
                ],
              )
            else
              for (var stop in vehicleJourney?['stop_times'])
                TripBlock(
                  stopTime: stop,
                )
          ],
        ),
      );
}
