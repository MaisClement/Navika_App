import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';

class SectionWaiting extends StatelessWidget {
  final Map section;
  final Map nextSection;

  const SectionWaiting({
    required this.section,
    required this.nextSection,
    super.key,
  });

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
        Padding(
          padding: const EdgeInsets.only(top: 13, left: 10),
          child: Text('Correspondance • ${getDuration(section['duration'])}'),
        ),
        
      ]
    );
}
