// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animated_flip_counter/animated_flip_counter.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/bottom_sheets/time.dart';
import 'package:navika/src/widgets/utils/real_time.dart';

class TimerBlock extends StatelessWidget {
  final String time;
  final Color color;
  final String state;
  final Function update;
  final bool disabled;

  const TimerBlock({
    required this.time,
    required this.color,
    required this.state,
    required this.update,
    this.disabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => getTimeDifference(time) >= 0 && time != ''
      ? Container(
          margin: const EdgeInsets.only(left: 0.0, top: 5.0, right: 10.0, bottom: 5.0),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
          constraints: const BoxConstraints(minWidth: 60),
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
                          update: update,
                        ));
              }
            },
            child: Container(
              padding: state == 'theorical'
                  ? const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0)
                  : const EdgeInsets.only(left: 10.0, top: 5.0, right: 0.0, bottom: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (getTimeDifference(time) < 99) && globals.hiveBox?.get('displayMode') != 'hour'
                      ? AnimatedFlipCounter(
                          duration: const Duration(milliseconds: 500),
                          value: getTimeDifference(time),
                          suffix: ' min',
                          textStyle: TextStyle(
                            color: getSchedulesColorByState(state, context),
                            fontWeight: FontWeight.w700,
                            fontFamily: fontFamily,
                            decoration: state == 'cancelled' ? TextDecoration.lineThrough : null,
                            decorationColor: const Color(0xffeb2031),
                          ),
                        )
                      : Text(
                          getTime(time),
                          style: TextStyle(
                            color: getSchedulesColorByState(state, context),
                            fontWeight: FontWeight.w700,
                            fontFamily: fontFamily,
                            decoration: state == 'cancelled' ? TextDecoration.lineThrough : null,
                            decorationColor: const Color(0xffeb2031),
                          ),
                          textAlign: TextAlign.center,
                        ),
                  if (state != 'theorical')
                    RealTime(
                      color: getSchedulesColorByState(state, context),
                      height: 15,
                    ),
                ],
              ),
            ),
          ),
        )
      : const Text('');
}
