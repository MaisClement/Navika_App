import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class SectionCrowFly extends StatelessWidget {

  const SectionCrowFly({super.key});

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 30, right: 35
              ),
              child: const DottedLine(
                direction: Axis.vertical,
                lineLength: 55,
                lineThickness: 4.0,
                dashColor: Color(0xff616161),
                dashLength: 4.0,
                dashRadius: 999,
                dashGapLength: 4.0,
              ),
            ),
          ],
        ),
      ]
    );
}
