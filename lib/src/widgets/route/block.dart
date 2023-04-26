import 'package:flutter/material.dart';
import 'package:navika/src/data/lines.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/route/sections/street_network.dart';

class RouteBlock extends StatelessWidget {
  final Map journey;
  final Map section;

  const RouteBlock({
    required this.journey,
    required this.section,
    super.key,
  });
  

  @override
  Widget build(BuildContext context) => Column(
      children: [
        if (section['type'] == 'street_network')
          SectionStreetNetwork(
            section: section,
          ),
        Row(
          children: [
            if (section['type'] == 'crow_fly')
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(NavikaIcons.walking,
                    color: walkingColor(context), //Colors.grey[700],
                    size: 35),
              ),
            if (section['type'] == 'public_transport')
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image(
                  height: 35,
                  image: AssetImage(
                    getIconLine(context, LINES.getLinesById(section['informations']['line']['id'])),
                  ),
                ),
              ),
            Text(section['from']['name'], 
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                fontFamily: 'Segoe Ui',
                color: accentColor(context),
              )
            ),
            Text(section['type']),
            ]
          )
        ]
      );
}
