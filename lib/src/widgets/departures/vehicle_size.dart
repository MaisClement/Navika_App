// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';

// 📦 Package imports:

class VehicleSize extends StatelessWidget {
  final String size;

  const VehicleSize({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          if (size == 'short')
            Container(
              decoration: BoxDecoration(
                color: const Color(0xfff68f53),
                borderRadius: BorderRadius.circular(5),
              ),
                padding: const EdgeInsets.only(left: 5, right: 5),

              child: Text(
                'Court',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Diode',
                  color: Colors.white,
                ),
              ),
            ),

          if (size == 'long')
            Text(
              'Long',
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Diode',
              ),
            ),
          Container(
            width: 10,
          ),
        ],
      );
}

/*
if (size == 'short')
            Text(
              AppLocalizations.of(context)!.train_size_short,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Diode',
              ),
            ),
          if (size == 'long')
            Text(
              AppLocalizations.of(context)!.train_size_long,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Diode',
              ),
            ),
          Container(
            width: 10,
          )
*/
