import 'package:flutter/material.dart';
import 'package:navika/src/data/lines.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';

class SectionStreetNetwork extends StatelessWidget {
  final Map section;

  const SectionStreetNetwork({
    required this.section,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(NavikaIcons.walking,
              color: walkingColor(context), //Colors.grey[700],
              size: 35),
        ),
        Column(
          children: [
            Text(section['from']['name'],
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                fontFamily: 'Segoe Ui',
                color: accentColor(context),
              )
            ),
            Text(section['duration'].toString()
            ),
          ],
        ),
        Text(section['type']),
      ]
    );
}
