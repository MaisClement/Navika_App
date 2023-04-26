import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';

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
          padding: const EdgeInsets.only(
            top: 10, bottom: 10, left: 15, right: 15
          ),
          child: Icon(NavikaIcons.walking,
              color: walkingColor(context), //Colors.grey[700],
              size: 35),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(section['from']['name'],
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                fontFamily: 'Segoe Ui',
                color: accentColor(context),
              )
            ),
            Text('${getDuration(section['duration'])} • ${getDistanceText(section['duration'])}'
            ),
          ],
        ),
        Text(section['type']),
      ]
    );
}
