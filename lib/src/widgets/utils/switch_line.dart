// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/icons/icons.dart';

class SwitchLine extends StatelessWidget {
  final Map line;
  final bool value;
  final Function(bool) function;

  SwitchLine({
    required this.line,
    required this.value,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icones(
                    line: line,
                    prevLine: line,
                    i: 0,
                    size: 30,
                    brightness: Theme.of(context).colorScheme.brightness,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Text(
                      line['name'],
                      style: TextStyle(
                        color: accentColor(context),
                        fontWeight: FontWeight.w600,
                        fontFamily: fontFamily,
                        fontSize: 19,
                      ),
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              thumbIcon: thumbIcon,
              trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                if (!states.contains(MaterialState.selected)) {
                  return mainColor(context);
                }
                return null;
              }),
              inactiveThumbColor: mainColor(context),
              value: value,
              onChanged: (bool value) {
                function(value);
              },
            ),
          ],
        ),
      );
}
