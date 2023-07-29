import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';

class SwitchMode extends StatelessWidget {
  final String name;
  final bool value;
  final Function(bool) function;
  final IconData? icon;

  SwitchMode({
    required this.name,
    required this.value,
    required this.function,
    this.icon,
    super.key,
  });

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

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
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            Switch(
              thumbIcon: thumbIcon,
              // trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
              //   if (!states.contains(MaterialState.selected)) {
              //     return mainColor(context);
              //   }
              //   return null;
              // }),
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
