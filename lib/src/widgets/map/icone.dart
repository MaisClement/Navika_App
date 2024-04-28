// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

Color getMapWidgetColor(Brightness brightness) {
  if (Brightness.dark == brightness) {
    return const Color(0xffe4e4e4);
  }
  return const Color(0xff0a0082);
}

class MapIcone extends StatelessWidget {
  final Map stop;
  final Brightness brightness;
  final Function update;

  const MapIcone({
    required this.stop,
    required this.brightness,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: 5,
          left: ((33 + (stop['lines'].length * 22) - 40) / 2).toDouble()
        ),
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(0.125),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: getMapWidgetColor(brightness),
            ),
            width: 20,
            height: 20,
          )
        ),
      ),
      Material(
        borderRadius: BorderRadius.circular(8),
        color: getMapWidgetColor(brightness),
        child: Container(
          padding: const EdgeInsets.only(
            left: 3,
            right: 5,
            top: 0,
            bottom: 0,
          ),
          width: (33 + (stop['lines'].length * 22)).toDouble() ,
          child: Row(
            children: [
              ModeIcones(
                line: stop['lines'][0],
                i: 0,
                brightness: brightness == Brightness.dark ? Brightness.light : Brightness.dark,
              ),
              for (var line in stop['lines'])
                Container(
                  padding: const EdgeInsets.only(
                    left: 1,
                    right: 1,
                    top: 0,
                    bottom: 0,
                  ),
                  child: LinesIcones(
                    line: line,
                    size: 20,
                    brightness: brightness == Brightness.dark ? Brightness.light : Brightness.dark,
                    removeMargin: true,
                  ),
                )
            ],
          ),
        ),
      ),
    ],
  );
}
