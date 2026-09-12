import 'package:flutter/material.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/widgets/journey/vehicule_details.dart';
import 'package:navika/src/widgets/trip/block.dart';
import 'package:navika/src/widgets/trip/disruptions.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

enum TripBlockStatus { origin, terminus, active, inactive }

enum TripBlockEffect { none, added, deleted, delayed, unchanged }

// The states of a stop are given aside its times, older payloads carried them
// inside `stop_date_time`.
Map getStopDisruption(stop) => stop['disruption'] ?? stop['stop_date_time'] ?? {};

// The stop is not served anymore : its theorical times are the ones to
// display, struck through.
bool isStopDeleted(stop) {
  Map disruption = getStopDisruption(stop);

  return stop['state'] == 'deleted' || (disruption['departure_state'] == 'deleted' && disruption['arrival_state'] == 'deleted');
}

Widget makeTripWidgets(vehicleJourney, scrollController, fromId, toId, color) {
  List<Widget> res = [];

  List stops = vehicleJourney?['stop_date_time'] ?? [];

  int originIndex = stops.indexWhere((stop) => stop['type'] == 'origin');
  int terminusIndex = stops.lastIndexWhere((stop) => stop['type'] == 'terminus');

  bool isCancelled = stops.isNotEmpty && stops.every(isStopDeleted);

  TripBlockStatus status = TripBlockStatus.inactive;

  int i = 0;

  for (var stop in stops) {
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

    // if (i == 0) {
    //   status = TripBlockStatus.origin;
    // }

    String time = stop['stop_date_time']['departure_date_time'];
    String arrivaltime = stop['stop_date_time']['arrival_date_time'];
    String newtime = '';
    String newarrivaltime = '';

    if (stop['stop_date_time']['base_departure_date_time'] == '') {
      time = stop['stop_date_time']['base_arrival_date_time'];
      newtime = stop['stop_date_time']['arrival_date_time'];
    } else {
      time = stop['stop_date_time']['base_departure_date_time'];
      newtime = stop['stop_date_time']['departure_date_time'];
    }
    arrivaltime = stop['stop_date_time']['base_arrival_date_time'];
    newarrivaltime = stop['stop_date_time']['arrival_date_time'];

    Map disruption = getStopDisruption(stop);

    res.add(
      TripBlock(
        id: i,
        length: stops.length,
        controller: scrollController,
        time: time,
        arrivaltime: arrivaltime,
        newtime: newtime,
        newarrivaltime: newarrivaltime,
        name: stop['name'],
        message: disruption['message'],
        departureState: disruption['departure_state'],
        arrivalState: disruption['arrival_state'],
        state: stop['state'],
        isOffRoute: isCancelled || (originIndex > -1 && i < originIndex) || (terminusIndex > -1 && i > terminusIndex),
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

class TripPanel extends StatefulWidget {
  final String tripId;
  final String? fromId;
  final String? toId;
  final dynamic data;
  final Function setData;

  const TripPanel({required this.tripId, this.fromId, this.toId, required this.data, required this.setData, super.key});

  @override
  State<TripPanel> createState() => _TripPanelState();
}

class _TripPanelState extends State<TripPanel> {
  final AutoScrollController _scrollController = AutoScrollController(suggestedRowHeight: 50);

  @override
  Widget build(BuildContext context) {
    final vehicleJourney = widget.data;

    if (vehicleJourney != null) {
      return Column(
        children: [
          if (vehicleJourney['informations']['line']['details'] != null)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: HexColor.fromHex(vehicleJourney['informations']['line']['color']).withOpacity(0.2),
              ),
              child: VehiculeDetails(
                informations: vehicleJourney['informations'],
                details: vehicleJourney['informations']['line'],
              ),
            ),
          if (vehicleJourney?['informations']['vehicle_size'] != null)
            Container(
              padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15.0, bottom: 0.0),
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: vehicleJourney?['informations']['vehicle_size'] == 'long' ? Color(0xff005bbc).withOpacity(0.2) : Color(0xfff68f53).withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Image(
                            image: vehicleJourney?['informations']['vehicle_size'] == 'long'
                                ? AssetImage('assets/img/modal/information.png')
                                : AssetImage('assets/img/modal/warning.png'),
                            height: 25,
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            children: [
                              Text(
                                vehicleJourney?['informations']['vehicle_size'] == 'long' ? 'Train Long' : 'Train Court',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          TripDisruptions(disruptions: vehicleJourney['reports']),
          makeTripWidgets(vehicleJourney, _scrollController, widget.fromId, widget.toId, HexColor.fromHex(vehicleJourney['informations']['line']['color'])),
          const SizedBox(height: 50),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
