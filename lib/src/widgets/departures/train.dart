
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/bottom_sheets/terminus_trains.dart';
import 'package:navika/src/widgets/departures/message.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/icons/icons.dart';

class DepartureTrain extends StatelessWidget {
  final Map train;
  final String color;
  final Function update;
  final String from;

  const DepartureTrain({
    required this.train,
    required this.color,
    required this.update,
    required this.from,
    super.key,
  });

  handleTapDetails(context) {
    if (train['informations']['id'] != null &&
        train['informations']['id'] != '') {
      RouteStateScope.of(context)
          .go('/trip/details/${train['informations']['id']}/from/$from');
    } else {
      FloatingSnackBar(
        message: 'Les details ne sont pas disponibles pour ce trajet.',
        context: context,
        textColor: mainColor(context),
        textStyle: const TextStyle(
          color: Color(0xffffffff),
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe Ui',
        ),
        duration: const Duration(milliseconds: 4000),
        backgroundColor: const Color(0xff272727),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 7.0),
        child: InkWell(
          onTap: () {
            handleTapDetails(context);
          },
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 3, top: 3),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  color: HexColor.fromHex(color).withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icones(
                          line: train['informations']['line'],
                          prevLine: train['informations']['line'],
                          i: 0,
                          size: 25,
                          isDark: Brightness.dark != Theme.of(context).colorScheme.brightness
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      train['informations']['direction']
                                          ['name'],
                                      style: train['stop_date_time']['state'] !=
                                              'ontime'
                                          ? TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Segoe Ui',
                                              color: getColorForDirectionByState( getState(train), context),
                                            )
                                          : TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Segoe Ui',
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
                                  Text(train['informations']['headsign'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Diode',
                                      )),
                                  if (train['informations']['headsign'] != '')
                                    Container(
                                      width: 10,
                                    ),
                                  Text(train['informations']['trip_name'],
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
                              if (train['stop_date_time']['state'] ==
                                  'cancelled')
                                const MiniMessage(
                                  message: 'Supprimé',
                                  color: Colors.white,
                                  backgroundColor: Color(0xffeb2031),
                                ),
                              if (train['stop_date_time']['state'] ==
                                  'modified')
                                const MiniMessage(
                                  message: 'Modifié',
                                  color: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(255, 32, 32, 235),
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
                                          borderRadius:
                                              bottomSheetBorder,
                                        ),
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            BottomTerminusTrain(
                                                update: update));
                                  },
                                  child: const Message(
                                    message: 'Terminus',
                                  ),
                                ),
                              ),
                            ],
                          )
                        else
                          TimeBlock(
                            time: train['stop_date_time']
                                ['departure_date_time'],
                            base: train['stop_date_time']
                                ['base_departure_date_time'],
                            state: getState(train),
                            late: getLate(train),
                            track: train['stop_date_time']['platform'],
                            update: update,
                          ),

                          // TimerBlock(
                          //   time: train['stop_date_time']['departure_date_time'],
                          //   state: train['stop_date_time']['state'],
                          //   update: update,
                          // )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: HexColor.fromHex(color),
                  ))
            ],
          ),
        ),
      );
}
