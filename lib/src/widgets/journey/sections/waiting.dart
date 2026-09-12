// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:dotted_line/dotted_line.dart';

// 🌎 Project imports:
import 'package:navika/src/utils.dart';

class SectionWaiting extends StatelessWidget {
  final Map section;

  const SectionWaiting({
    required this.section,
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
                left: 30, right: 26
              ),
              child: const DottedLine(
                direction: Axis.vertical,
                lineLength: 65,
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
          padding: const EdgeInsets.only(bottom: 15),
          child: Text('Attente • ${getDuration(section['duration'])}'),
        ),
      ]
    );
}
