import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/departures/message.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/bottom_sheets/terminus_trains.dart';

List getState(Map train) {

  String departure = train['stop_date_time']['departure_date_time'];
  String expectedDeparture = train['stop_date_time']['base_departure_date_time'];
  String state = train['stop_date_time']['state'];

  List res = [];
  if (state == 'modified') {
    res.add('modified');
  }
  if (state != 'ontime' && state != 'theorical') {
    res.add(state);
  }
  if (getLate(train) > 0) {
    res.add('delayed');
  }
  //else {
  if (res.isEmpty) {
    res.add('ontime');
  }
  return res;
}

int getLate(Map train) {
  String departure = train['stop_date_time']['departure_date_time'];
  String expectedDeparture = train['stop_date_time']['base_departure_date_time'];
  
  if (departure == '' || expectedDeparture == '') {
    return 0;
  }
  DateTime dttime = DateTime.parse(departure);
  DateTime dtexpe = DateTime.parse(expectedDeparture);
  Duration diff = dttime.difference(dtexpe);
  return diff.inMinutes;
}

Color getColorByState(state, context) {
  if (state.contains('cancelled')) {
    return const Color(0xffeb2031);
  } else if (state.contains('delayed') || state.contains('modified')) {
    return const Color(0xfff68f53);
  } else if (state.contains('ontime')) {
    return Colors.white.withOpacity(0);
  } else {
    return const Color(0xffa9a9a9);
  }
}

Color getColorForDirectionByState(state, context) {
  if (state.contains('cancelled')) {
    return const Color(0xffeb2031);
  } else if (state.contains('modified')) {
    return const Color(0xfff68f53);
  } else {
    return accentColor(context);
  }
}

Color getBackColorByState(state, context) {
  if (state.contains('cancelled')) {
    return const Color(0xffeb2031);
  } else if (state.contains('delayed') || state.contains('modified')) {
    return const Color(0xfff68f53);
  } else {
    return Colors.white.withOpacity(0);
  }
}

class DepartureList extends StatelessWidget {
  final Map train;
  final Color color;
  final Function update;
  final String from;

  const DepartureList({
    required this.train,
    required this.color,
    required this.update,
    required this.from,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin:
            const EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 5.0),
        child: InkWell(
          onTap: () {
            if (train['informations']['id'] != null &&
                train['informations']['id'] != '') {
              RouteStateScope.of(context).go(
                  "/trip/details/${train['informations']['id']}/from/$from");
            } else {
              FloatingSnackBar(
                message: 'Les details ne sont pas disponibles pour ce trajet.',
                context: context,
                textColor: Theme.of(context).colorScheme.primary,
                textStyle: const TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: const Color(0xff272727),
              );
            }
          },
          borderRadius: BorderRadius.circular(7),
          child: Container(
            padding: const EdgeInsets.only(
                left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: color,
              border: Border(
                top: BorderSide(
                  width: 3,
                  color: getColorByState(
                      getState(train),
                      context),
                ),
                bottom: BorderSide(
                  width: 3,
                  color: getColorByState(
                      getState(train),
                      context),
                ),
                left: BorderSide(
                  width: 3,
                  color: getColorByState(
                      getState(train),
                      context),
                ),
                right: BorderSide(
                  width: 3,
                  color: getColorByState(
                      getState(train),
                      context),
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  train['informations']['direction']['name'],
                                  style: train['stop_date_time']['state'] !=
                                          'ontime'
                                      ? TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Segoe Ui',
                                          color: getColorForDirectionByState(
                                              getState(train),
                                              context),
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
                          if (train['stop_date_time']['state'] == 'cancelled')
                            const MiniMessage(
                              message: 'Supprimé',
                              color: Colors.white,
                              backgroundColor: Color(0xffeb2031),
                            ),
                          if (train['stop_date_time']['state'] == 'modified')
                            const MiniMessage(
                              message: 'Modifié',
                              color: Colors.white,
                              backgroundColor: Color.fromARGB(255, 32, 32, 235),
                            ),
                          if (getState(train)
                              .contains('delayed'))
                            MiniMessage(
                              message:
                                  '+${getLate(train)} min',
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
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      TimeBlock(
                        time: train['stop_date_time']['departure_date_time'],
                        base: train['stop_date_time']
                            ['base_departure_date_time'],
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
