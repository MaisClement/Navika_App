import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

List filterSection(sections) {
  return sections.where((section) {
    if (section['mode'] == 'public_transport') {
      return true;
    }
    if (section['type'] == 'street_network' && section['mode'] == 'walking' && section['duration'] > 300) {
      return true;
    }
    return false;
  }).toList();
}

class RouteLines extends StatelessWidget {
  final List sections;

	const RouteLines({
    required this.sections,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Expanded (
    child: Row(
      children: [
        for(var i = 0; i < sections.length; i++)
          if (sections[i]['mode'] == 'public_transport')
            Wrap(
              children: [
                ModeIcones(
                  line: sections[i]['informations']['line'],
                  i: 0,
                  size: 20,
                  isDark: schedulesIsDark(context, 'ffffff'),
                ),
                LinesIcones(
                  line: sections[i]['informations']['line'],
                  size: 20
                ),

                if (i != sections.length -1)
                  Container(
                    margin: const EdgeInsets.only(left: 3, right: 2, top: 12, ),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xff808080),
                      borderRadius: BorderRadius.circular(500)
                    ),
                  ),
                
              ],
            )
          else if (sections[i]['type'] == 'street_network' && sections[i]['mode'] == 'walking')
            Wrap(
              children: [

                Icon(NavikaIcons.walking,
                  color: walkingColor(context),
                  size: 25
                ),

                if (i != sections.length -1)
                  Container(
                    margin: const EdgeInsets.only(left: 3, right: 2, top: 12, ),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xff808080),
                      borderRadius: BorderRadius.circular(500)
                    ),
                  ),
                

              ],
            ),
          
        ],
      )
  );
}
