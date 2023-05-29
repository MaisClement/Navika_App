import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';

class SectionStreetNetwork extends StatelessWidget {
  final Map section;
  final Function zoomTo;

  const SectionStreetNetwork({
    required this.section,
    required this.zoomTo,
    super.key,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () {
      zoomTo(
        section['geojson']['coordinates'][0][1],
        section['geojson']['coordinates'][0][0]
      );
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  top: 10, left: 20, right: 20
                ),
                child: Icon(NavikaIcons.walking,
                    color: Color(0xff616161),
                    size: 25),
              ),
              DottedLine(
                direction: Axis.vertical,
                lineLength: 30,
                lineThickness: 4.0,
                dashColor: Color(0xff616161),
                dashLength: 4.0,
                dashRadius: 999,
                dashGapLength: 4.0,
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(section['from']['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                  )
                ),
                Text('${getDistanceText(section['geojson']['length'])} • ${getDuration(section['duration'])}'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15, top: 10),
            color: backgroundColor(context),
            child: Row(
              children: [
                Text(getStringTime(section['departure_date_time']),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                  ))
              ],
            ),
          ),
        ]
      ),
  );
}
