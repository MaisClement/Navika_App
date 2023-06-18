import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/bottom_sheets/time.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/departures/time_message.dart';

class TimeBlock extends StatelessWidget {
  final String time;
  final String base;
  final List state;
  final int late;
  final String track;
  final Function update;
  final bool disabled;

  const TimeBlock({
    required this.time,
    required this.base,
    required this.state,
    required this.late,
    required this.track,
    required this.update,
    this.disabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Wrap(
        children: [
          if (state.contains('cancelled'))
            TimerMessage(
                message: 'Supprimé',
                backgroundColor: getBackColorByState(state, context),
                color: Colors.white,
                allround: state.length > 1),
          if (state.contains('modified'))
            TimerMessage(
                message: 'Terminus ex.',
                backgroundColor: getBackColorByState(state, context),
                color: Colors.white,
                allround: state.length > 1),
          if (state.contains('delayed') && late > 0)
            TimerMessage(
              message: '+${late.toString()} min',
              backgroundColor: getBackColorByState(state, context),
              color: Colors.white,
            ),
          Container(
            margin: const EdgeInsets.only(
                left: 0.0, top: 5.0, right: 6, bottom: 5.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                  bottomRight: Radius.circular(7)),
              color: getBackColorByState(state, context),
            ),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 3.0, top: 3.0, right: 3.0, bottom: 3.0),
              decoration: BoxDecoration(
                color: const Color(0xff000000), // const Color(0xff272727),
                boxShadow: [
                  BoxShadow(
                    color: accentColor(context).withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ],
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: InkWell(
                onTap: () {
                  if (disabled == false) {
                    showModalBottomSheet<void>(
                      shape: const RoundedRectangleBorder(
                        borderRadius: bottomSheetBorder,
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) => BottomSchedules(
                        isDeparture: true,
                        update: update,
                      ),
                    );
                  }
                },
                child: Wrap(
                  children: [
                    time != '' && time.length > 1
                        ? Container(
                            padding: const EdgeInsets.only(
                                left: 7.0, top: 2.0, right: 7.0, bottom: 2.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                              color: const Color(0xff000000), // const Color(0xff272727),
                              boxShadow: [
                                BoxShadow(
                                  color: accentColor(context).withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text( globals.hiveBox?.get('displayMode') == 'minutes'
                                  ? '${getTimeDifference(time).toString()} min'
                                  : getTime(base),
                              style: TextStyle(
                                color: getDeparturesColorByState(
                                    getTimeDifference(time) >= 0
                                        ? state
                                        : 'theorical',
                                    context),
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Segoe Ui',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : const Text(''),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 7.0, top: 2.0, right: 7.0, bottom: 2.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(3),
                            bottomRight: Radius.circular(3)),
                      ),
                      width: 30,
                      height: 24,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          track,
                          style: const TextStyle(
                            color: Color(0xff202020),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Segoe Ui',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
