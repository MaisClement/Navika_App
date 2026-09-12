// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';
import 'package:navika/src/widgets/departures/vehicle_size.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/trip/panel.dart';
import 'package:navika/src/widgets/error_message.dart';
import 'package:navika/src/widgets/journey/vehicule_details.dart';
import 'package:navika/src/widgets/trip/disruptions.dart';

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

      if (widget.fromId != '' && widget.fromId != null) {
        int i = 0;
        print(vehicleJourney?['stop_date_time'][0]);
        for (var stop in vehicleJourney?['stop_date_time']) {
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
          title: vehicleJourney != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vehicleJourney?['informations']['direction']['name'], style: appBarTitle),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            vehicleJourney?['informations']['headsign'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Diode',
                            ),
                          ),
                        ),
                        Text(vehicleJourney?['informations']['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Diode',
                            )),
                      ],
                    ),
                  ],
                )
              : Text(AppLocalizations.of(context)!.trip, style: appBarTitle),
        ),
        //appBar: AppBar(
        //  title: Column(
        //    crossAxisAlignment: preferredCrossAxisAlignment,
        //    children: [
        //      Text(AppLocalizations.of(context)!.trip, style: appBarTitle),
        //      if (vehicleJourney != null) Text('N°${vehicleJourney?['informations']['name']} - ${vehicleJourney?['informations']['direction']['name']}', style: appBarSubtitle),
        //    ],
        //  ),
        //),
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
            else if (vehicleJourney != null)
              Column(
                children: [
                  if (vehicleJourney?['informations']['line']['details'] != null)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        color: HexColor.fromHex(vehicleJourney?['informations']['line']['color']).withOpacity(0.2),
                      ),
                      child: VehiculeDetails(
                        informations: vehicleJourney?['informations'],
                        details: vehicleJourney?['informations']['line'],
                      ),
                    ),
                  if (vehicleJourney?['informations']['vehicle_size'] != null)
                    Container(
                      padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15.0, bottom: 0.0),
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: vehicleJourney?['informations']['vehicle_size'] == 'long'
                            ? Color(0xff005bbc).withOpacity(0.2)
                            : Color(0xfff68f53).withOpacity(0.2),
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
                                        vehicleJourney?['informations']['vehicle_size'] == 'long' ? 'Train Long': 'Train Court',
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
                          ),],
                      ),
                    ),
                  TripDisruptions(disruptions: vehicleJourney?['reports']),
                  makeTripWidgets(vehicleJourney, _scrollController, widget.fromId, widget.toId, HexColor.fromHex(vehicleJourney?['informations']['line']['color'])),
                  const SizedBox(height: 50),
                ],
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      );
}
