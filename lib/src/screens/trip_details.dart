import 'dart:async';

import 'package:flutter/material.dart';  
import 'package:navika/src/api.dart';

import 'package:navika/src/style.dart'; 
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
        error = result['status'];
      });
      
      if (result['value']?['vehicle_journey'] != null) {
        setState(() {
          vehicleJourney = result['value']?['vehicle_journey'];
        });
      }
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

      String time = stop['stop_time']['departure_time'];
      String arrivaltime = stop['stop_time']['arrival_time'];
      String newtime = '';
      String newarrivaltime = '';

      if (stop['disruption'] != null) {
        if (stop['disruption']['departure_state'] == 'delayed' || stop['disruption']['arrival_state'] == 'delayed') {
          if (status == TripBlockStatus.terminus) {
            time = stop['disruption']['base_arrival_time'];
            newtime = stop['disruption']['arrival_time'];
            arrivaltime = stop['disruption']['base_arrival_time'];
            newarrivaltime = stop['disruption']['arrival_time'];
          } else {
            time = stop['disruption']['base_departure_time'];
            newtime = stop['disruption']['departure_time'];
            arrivaltime = stop['disruption']['base_arrival_time'];
            newarrivaltime = stop['disruption']['arrival_time'];
          }
        }
      }

      res.add(
        TripBlock(
          time: time,
          arrivaltime: arrivaltime,
          newtime: newtime,
          newarrivaltime: newarrivaltime,
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
              const LinearProgressIndicator()
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
