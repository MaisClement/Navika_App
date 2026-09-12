// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/bottom_sheets/terminus_trains.dart';
import 'package:navika/src/widgets/departures/message.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/departures/vehicle_size.dart';

class DepartureLines extends StatelessWidget {
  final Map train;
  final Color color;
  final Function update;
  final String from;

  const DepartureLines({
    required this.train,
    required this.color,
    required this.update,
    required this.from,
    super.key,
  });

  handleTapDetails(context) {
    if (train['informations']['id'] != null && train['informations']['id'] != '') {
      final currentRoute = RouteStateScope.of(context).route.path;
      
      if (currentRoute.startsWith('/schedules')) {
        RouteStateScope.of(context).go('/schedules/trip/${train['informations']['id']}/from/$from');
      
      } else {
        RouteStateScope.of(context).go('/trip/${train['informations']['id']}/from/$from');
      }
      
    } else {
      floatingSnackBar(
        message: AppLocalizations.of(context)!.trip_details_unavailable,
        context: context,
        textStyle: TextStyle(
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w800,
          fontFamily: fontFamily,
        ),
        duration: const Duration(milliseconds: 4000),
        backgroundColor: mainColor(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: InkWell(
          onTap: () {
            handleTapDetails(context);
          },
          borderRadius: BorderRadius.circular(7),
          child: Container(
            padding: const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: color,
              border: Border(
                top: BorderSide(
                  width: 3,
                  color: getColorByState(getState(train), context),
                ),
                bottom: BorderSide(
                  width: 3,
                  color: getColorByState(getState(train), context),
                ),
                left: BorderSide(
                  width: 3,
                  color: getColorByState(getState(train), context),
                ),
                right: BorderSide(
                  width: 3,
                  color: getColorByState(getState(train), context),
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          if (train['informations']['original_direction'] != null)
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        train['informations']['original_direction']['name'],
                                        style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: fontFamily,
                                                color: const Color(0xffeb2031),
                                                decoration: TextDecoration.lineThrough,
                                                decorationColor: const Color(0xffeb2031),
                                              ),
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ],
                                ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  train['informations']['direction']['name'],
                                  style: train['stop_date_time']['state'] != 'ontime'
                                      ? TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: fontFamily,
                                          color: getColorForDirectionByState(getState(train), context),
                                        )
                                      : TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: fontFamily,
                                          color: accentColor(context),
                                        ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              if (train['informations']['vehicle_size'] != null)
                                VehicleSize(
                                  size: train['informations']['vehicle_size'],
                                ),
                              Container(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  train['informations']['headsign'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Diode',
                                  ),
                                ),
                              ),
                              Text(train['informations']['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Diode',
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (train['informations']['message'] == 'terminus')
                      Wrap(
                        children: [
                          if (train['stop_date_time']['state'] == 'cancelled')
                            MiniMessage(
                              message: AppLocalizations.of(context)!.deleted,
                              color: Colors.white,
                              backgroundColor: const Color(0xffeb2031),
                            ),
                          if (train['stop_date_time']['state'] == 'modified')
                            MiniMessage(
                              message: AppLocalizations.of(context)!.modified,
                              color: Colors.white,
                              backgroundColor: const Color.fromARGB(255, 32, 32, 235),
                            ),
                          if (getState(train).contains('delayed'))
                            MiniMessage(
                              message: '+${getLate(train)} min',
                              color: Colors.white,
                              backgroundColor: const Color(0xffeb2031),
                            ),
                          GestureDetector(
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: bottomSheetBorder,
                                    ),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) => BottomTerminusTrain(update: update));
                              },
                              child: Message(
                                message: AppLocalizations.of(context)!.settings_terminus,
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      TimeBlock(
                        time: train['stop_date_time']['departure_date_time'],
                        base: train['stop_date_time']['base_departure_date_time'],
                        state: getState(train),
                        late: getLate(train),
                        track: train['stop_date_time']['platform'],
                        update: update,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
