import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/error_message.dart';
import 'package:navika/src/widgets/trip/block.dart';
import 'package:navika/src/widgets/trip/disruptions.dart';
import 'package:navika/src/widgets/departures/time_block.dart';

enum TripBlockStatus { origin, terminus, active, inactive }

enum TripBlockEffect { none, added, deleted, delayed, unchanged }

class TripDetails extends StatefulWidget {
  final String tripId;
  final String? fromId;
  final String? toId;

  const TripDetails({required this.tripId, this.fromId, this.toId, super.key});

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails>
    with SingleTickerProviderStateMixin {
  String error = '';
  String title = 'Trajet';

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
        } else {
          setState(() {
            error = 'Détails du trajet non disponible';
          });
        }
      }
    } catch (e) {
      setState(() {
        error = "Une erreur s'est produite.";
      });
    }
  }

  Widget _makeTripWidgets() {
    List<Widget> res = [];

    try {
      TripBlockStatus status = TripBlockStatus.inactive;

      int i = 0;
      for (var stop in vehicleJourney?['stop_times']) {
        if (status == TripBlockStatus.terminus) {
          status = TripBlockStatus.inactive;
        } else if (status == TripBlockStatus.origin) {
          status = TripBlockStatus.active;
        }

        if (widget.fromId != null && stop['id'].contains(widget.fromId)) {
          status = TripBlockStatus.origin;
        } else if (widget.toId != null && stop['id'].contains(widget.toId)) {
          status = TripBlockStatus.terminus;
        }

        TripBlockEffect effect = TripBlockEffect.none;
        String time = getTime(stop['stop_time']['arrival_time']);
        String newtime = '';
        try {
          for (var disruption in vehicleJourney!['disruptions']) {
            if (disruption != null && disruption.length > 0) {
              if (disruption['effect'] == 'NO_SERVICE') {
                effect = TripBlockEffect.deleted;
                status = TripBlockStatus.inactive;
              } else if (disruption['impacted_stops'] != null &&
                  disruption['impacted_stops'][i] != null) {
                if (disruption['impacted_stops'][i]['stop_time_effect'] ==
                    'added') {
                  effect = TripBlockEffect.added;
                } else if (disruption['impacted_stops'][i]
                        ['stop_time_effect'] ==
                    'deleted') {
                  effect = TripBlockEffect.deleted;
                } else if (disruption['impacted_stops'][i]
                        ['stop_time_effect'] ==
                    'delayed') {
                  effect = TripBlockEffect.delayed;
                  //newtime = getTime(disruption['impacted_stops'][i]['amended_arrival_time']);
                  time = makeTime(
                      disruption['impacted_stops'][i]['base_arrival_time']);
                  newtime = makeTime(
                      disruption['impacted_stops'][i]['amended_arrival_time']);
                }
              }
            }
          }
        } catch (e) {
          effect = TripBlockEffect.none;
        }

        res.add(
          TripBlock(
            time: time,
            newtime: newtime,
            name: stop['name'],
            type: stop['type'],
            effect: effect,
            status: status,
          ),
        );
        i++;
      }

      return Column(
        children: res,
      );
    } catch (e) {
      return const ErrorMessage(error: 'Une erreur est survenue');
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
                    "N°${vehicleJourney?['informations']['name']} - ${vehicleJourney?['informations']['direction']['name']}",
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
              )
            else if (vehicleJourney == null)
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
              Column(
                children: [
                  if (vehicleJourney?['disruptions'].length > 0)
                    TripDisruptions(
                      disruptions: vehicleJourney?['disruptions'],
                    ),
                  _makeTripWidgets(),
                ],
              )
          ],
        ),
      );
}
