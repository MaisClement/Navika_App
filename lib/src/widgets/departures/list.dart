import 'package:flutter/material.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/departures/message.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/bottom_sheets/terminus_trains.dart';

String getState(String departure, String expectedDeparture, String state) {
  if (state != 'ontime' && state != 'theorical') {
    return state;
  }
  if (getLate(departure, expectedDeparture) > 0) {
    return 'delayed';
  }
  return 'ontime';
}

int getLate(String departure, String expectedDeparture) {
  if (departure == '' || expectedDeparture == '') {
    return 0;
  }
  DateTime dttime = DateTime.parse(departure);
  DateTime dtexpe = DateTime.parse(expectedDeparture);
  Duration diff = dttime.difference(dtexpe);
  return diff.inMinutes;
}

Color getColorByState(state, context) {
  switch (state) {
    case 'cancelled':
      return const Color(0xffeb2031);

    case 'delayed':
      return const Color(0xfff68f53);

    case 'ontime':
      return Colors.white.withOpacity(0);

    default:
      return const Color(0xffa9a9a9);
  }
}

Color getBackColorByState(state, context) {
  switch (state) {
    case 'cancelled':
      return const Color(0xffeb2031);

    case 'delayed':
      return const Color(0xfff68f53);

    default:
      return Colors.white.withOpacity(0);
  }
}

class DepartureList extends StatelessWidget {
  final Map train;
  final Color color;
  final Function update;

  const DepartureList({
    required this.train,
    required this.color,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin:
            const EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 5.0),
        child: InkWell(
          onTap: () {
            RouteStateScope.of(context)
                .go("/trip/details/${train['informations']['id']}");
          },
          child: Container(
            padding: const EdgeInsets.only(
                left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: departureList(context, color),
              border: Border(
                top: BorderSide(
                  width: 3,
                  color: getColorByState(
                      getState(
                          train['stop_date_time']['departure_date_time'],
                          train['stop_date_time']['base_departure_date_time'],
                          train['stop_date_time']['state']),
                      context),
                ),
                bottom: BorderSide(
                  width: 3,
                  color: getColorByState(
                      getState(
                          train['stop_date_time']['departure_date_time'],
                          train['stop_date_time']['base_departure_date_time'],
                          train['stop_date_time']['state']),
                      context),
                ),
                left: BorderSide(
                  width: 3,
                  color: getColorByState(
                      getState(
                          train['stop_date_time']['departure_date_time'],
                          train['stop_date_time']['base_departure_date_time'],
                          train['stop_date_time']['state']),
                      context),
                ),
                right: BorderSide(
                  width: 3,
                  color: getColorByState(
                      getState(
                          train['stop_date_time']['departure_date_time'],
                          train['stop_date_time']['base_departure_date_time'],
                          train['stop_date_time']['state']),
                      context),
                ),
              ),
            ),
            child: Column(children: [
              Row(children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              train['informations']['direction']['name'],
                              style: train['stop_date_time']['state'] ==
                                      'cancelled'
                                  ? const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Segoe Ui',
                                      color: Color(0xff4f4f4f),
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
                      if (getState(
                              train['stop_date_time']['departure_date_time'],
                              train['stop_date_time']
                                  ['base_departure_date_time'],
                              train['stop_date_time']['state']) ==
                          'cancelled')
                        const MiniMessage(
                          message: 'Supprimé',
                          color: Colors.white,
                          backgroundColor: Color(0xffeb2031),
                        ),
                      if (getState(
                              train['stop_date_time']['departure_date_time'],
                              train['stop_date_time']
                                  ['base_departure_date_time'],
                              train['stop_date_time']['state']) ==
                          'delayed')
                        MiniMessage(
                          message:
                              '+${getLate(train["stop_date_time"]["departure_date_time"], train["stop_date_time"]["base_departure_date_time"])} min',
                          color: Colors.white,
                          backgroundColor: const Color(0xffeb2031),
                        ),
                      GestureDetector(
                          child: InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        BottomTerminusTrain(update: update));
                              },
                              child: const Message(
                                message: 'Terminus',
                              )))
                    ],
                  )
                else
                  TimeBlock(
                      time: train['stop_date_time']['departure_date_time'],
                      base: train['stop_date_time']['base_departure_date_time'],
                      state: getState(
                          train['stop_date_time']['departure_date_time'],
                          train['stop_date_time']['base_departure_date_time'],
                          train['stop_date_time']['state']),
                      late: getLate(
                          train['stop_date_time']['departure_date_time'],
                          train['stop_date_time']['base_departure_date_time']),
                      track: train['stop_date_time']['platform'],
                      update: update),
              ]),
            ]),
          ),
        ),
      );
}
