import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/utils.dart';

class SectionArrival extends StatelessWidget {
  final Map section;
  final Function zoomTo;

  const SectionArrival({
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
                  top: 10, left: 20, right: 20
                ),
                child: Icon(NavikaIcons.finish_flag,
                    color: Color(0xff616161),
                    size: 25),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 25),
              child: Text(section['to']['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                )
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15, top: 10),
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              children: [
                Text(getStringTime(section['arrival_date_time']),
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
