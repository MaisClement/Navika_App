// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';

class Emission extends StatelessWidget {
  final Map journey;

  const Emission({
    required this.journey,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only( left: 15.0, top: 10, right: 15.0, bottom: 10.0),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10.0),
        decoration: BoxDecoration(
          color: const Color(0xff008b5b).withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5, left: 5),
              child: const Icon(
                NavikaIcons.leaf,
                color: Color(0xff008b5b),
                size: 25,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        'En faisant ce trajet en transport plutôt qu’en voiture, vous polluez ${(journey['car_co2_emission'] / journey['co2_emission']).toStringAsFixed(0)}× moins. Merci !',
                        style: const TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        'CO₂ emis pour ce trajet : ${journey['co2_emission'].toStringAsFixed(2)}g',
                        style: const TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
