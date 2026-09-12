// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/style.dart';

class SwitchMode extends StatelessWidget {
  final String name;
  final bool value;
  final Function(bool) function;
  final IconData? icon;

  const SwitchMode({
    required this.name,
    required this.value,
    required this.function,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 20,
                    color: accentColor(context),
                  ),
                if (icon != null)
                  const SizedBox(
                    width: 7,
                  ),
                Text(
                  name,
                  style: TextStyle(
                    color: accentColor(context),
                    fontWeight: FontWeight.w800,
                    fontFamily: fontFamily,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            Switch(
              thumbIcon: thumbIcon,
              trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                if (!states.contains(WidgetState.selected)) {
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
