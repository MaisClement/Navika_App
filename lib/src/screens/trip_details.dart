// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/error_message.dart';
import 'package:navika/src/widgets/journey/vehicule_details.dart';
import 'package:navika/src/widgets/trip/block.dart';
import 'package:navika/src/widgets/trip/disruptions.dart';

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

enum TripBlockStatus { origin, terminus, active, inactive }

enum TripBlockEffect { none, added, deleted, delayed, unchanged }

Widget makeTripWidgets(vehicleJourney, scrollController, fromId, toId, color) {
  List<Widget> res = [];

  TripBlockStatus status = TripBlockStatus.inactive;

  int i = 0;

  for (var stop in vehicleJourney?['stop_times']) {
    if (status == TripBlockStatus.terminus) {
      status = TripBlockStatus.inactive;
    } else if (status == TripBlockStatus.origin) {
      status = TripBlockStatus.active;
    }

    if (fromId != null && stop['id'].contains(fromId)) {
      status = TripBlockStatus.origin;
    } else if (toId != null && stop['id'].contains(toId)) {
      status = TripBlockStatus.terminus;
    }

    String time = stop['stop_time']['departure_date_time'];
    String arrivaltime = stop['stop_time']['arrival_date_time'];
    String newtime = '';
    String newarrivaltime = '';

    if (stop['disruption'] != null) {
      if (stop['disruption']['departure_state'] == 'delayed' || stop['disruption']['arrival_state'] == 'delayed') {
        if (status == TripBlockStatus.terminus) {
          time = stop['disruption']['base_arrival_date_time'];
          newtime = stop['disruption']['arrival_date_time'];
          arrivaltime = stop['disruption']['base_arrival_date_time'];
          newarrivaltime = stop['disruption']['arrival_date_time'];
        } else {
          time = stop['disruption']['base_departure_date_time'];
          newtime = stop['disruption']['departure_date_time'];
          arrivaltime = stop['disruption']['base_arrival_date_time'];
          newarrivaltime = stop['disruption']['arrival_date_time'];
        }
      }
    }

    res.add(
      TripBlock(
        id: i,
        controller: scrollController,
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
        color: color,
      ),
    );
    i++;
  }

  return Column(
    children: res,
  );
}

class TripDetails extends StatefulWidget {
  final String tripId;
  final String? fromId;
  final String? toId;

  const TripDetails({required this.tripId, this.fromId, this.toId, super.key});

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> with SingleTickerProviderStateMixin {
  final AutoScrollController _scrollController = AutoScrollController(suggestedRowHeight: 50);
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

      if (widget.fromId != '') {
        int i = 0;
        for (var stop in vehicleJourney?['stop_times']) {
          if (stop['id'] == widget.fromId) {
            _scrollController.scrollToIndex(i, preferPosition: AutoScrollPosition.begin);
          }
          i++;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: preferredCrossAxisAlignment,
            children: [
              Text(AppLocalizations.of(context)!.trip, style: appBarTitle),
              if (vehicleJourney != null) Text('N°${vehicleJourney?['informations']['name']} - ${vehicleJourney?['informations']['direction']['name']}', style: appBarSubtitle),
            ],
          ),
        ),
        body: ListView(
          controller: _scrollController,
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
                  if (vehicleJourney != null && vehicleJourney?['informations']['line']['details'] != null)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: HexColor.fromHex(vehicleJourney?['informations']['line']['color']).withOpacity(0.2),
                      ),
                      child: VehiculeDetails(details: vehicleJourney?['informations']['line']),
                    ),
                  TripDisruptions(
                    disruptions: vehicleJourney?['reports'],
                  ),
                  makeTripWidgets(vehicleJourney, _scrollController, widget.fromId, widget.toId, HexColor.fromHex(vehicleJourney?['informations']['line']['color'])),
                  const SizedBox(
                    height: 50,
                  )
                ],
              )
          ],
        ),
      );
}
