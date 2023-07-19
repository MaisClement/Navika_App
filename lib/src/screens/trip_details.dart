import 'dart:async';

import 'package:flutter/material.dart';  
import 'package:navika/src/api.dart';

import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/error_message.dart';
import 'package:navika/src/widgets/trip/block.dart';
import 'package:navika/src/widgets/trip/disruptions.dart';

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
  String title = 'Trajet';
  ApiStatus error = ApiStatus.ok;
  Map? vehicleJourney;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getVehicleJourneys();
    });
  }

  Future<void> _getVehicleJourneys() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getVehicleJourney(widget.tripId);
    
    if (mounted) {
      setState(() {
        if (result['value']?['vehicle_journey'] != null) {
          vehicleJourney = result['value']?['vehicle_journey'];
          error = result['status'];
        } else {
          error = ApiStatus.unknownException;
        }
      });
    }
  }

  Widget _makeTripWidgets() {
    List<Widget> res = [];

    TripBlockStatus status = TripBlockStatus.inactive;

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

      String time = getTime(stop['stop_time']['arrival_time']);
      String newtime = '';

      if (stop['disruption'] != null) {
        if (stop['disruption']['departure_state'] == 'delayed' || stop['disruption']['arrival_state'] == 'delayed') {
          if (status == TripBlockStatus.origin) {
            time = getTime(stop['disruption']['base_departure_time']);
            newtime = getTime(stop['disruption']['departure_time']);
          } else {
            time = getTime(stop['disruption']['base_arrival_time']);
            newtime = getTime(stop['disruption']['arrival_time']);
          }
        }
      }

      res.add(
        TripBlock(
          time: time,
          newtime: newtime,
          name: stop['name'],
          type: stop['type'],
          message: stop['disruption']?['message'],
          departureState: stop['disruption']?['departure_state'],
          arrivalState: stop['disruption']?['arrival_state'],
          status: status,
        ),
      );
    }

    return Column(
      children: res,
    );
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
                    'N°${vehicleJourney?['informations']['name']} - ${vehicleJourney?['informations']['direction']['name']}',
                    style: appBarSubtitle),
            ],
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            if (error != ApiStatus.ok)
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
                  TripDisruptions(
                    disruptions: vehicleJourney?['reports'],
                  ),
                  _makeTripWidgets(),
                  const SizedBox(
                    height: 50,
                  )
                ],
              )
          ],
        ),
      );
}
