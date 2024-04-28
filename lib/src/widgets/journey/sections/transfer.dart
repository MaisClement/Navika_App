// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/utils.dart';

class SectionTransfer extends StatelessWidget {
  final Map section;
  final Function zoomTo;

  const SectionTransfer({
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
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 10, left: 20, right: 14
                ),
                child: Icon(NavikaIcons.walking,
                    color: Color(0xff616161),
                    size: 25),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(section['from']['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                        )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 15, top: 0),
                      color: Theme.of(context).colorScheme.surface,
                      child: Row(
                        children: [
                          Text(getStringTime(section['departure_date_time']),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Segoe Ui',
                              fontSize: 16,
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Text('${getDistanceText(section['geojson']['properties'][0]['length'])} • ${getDuration(section['duration'])}'),
              ],
            ),
          ),
        ]
      ),
  );
}
