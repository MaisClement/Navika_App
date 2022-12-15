import 'package:flutter/material.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

class RouteLines extends StatelessWidget {
  final List sections;

	const RouteLines({
    required this.sections,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Expanded(
    child: Row(
      children: [
        for(var i = 0; i < sections.length; i++)
          if (sections[i]['mode'] == 'public_transport')
            Wrap(
              children: [
                ModeIcones(
                  line: sections[i]['informations']['line'],
                  i: 0,
                  size: 25,
                  isDark: true,
                ),
                LinesIcones(
                  line: sections[i]['informations']['line'],
                  size: 25
                ),

                if (i != sections.length -1)
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 8, right: 2),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(500)
                    ),
                  )
              ],
            )

          else if (sections[i]['mode'] == 'walking')
            Wrap(
              children: [
                Icon(ScaffoldIcon.walking,
                  color: Colors.grey[700],
                  size: 25
                ),

                if (i != sections.length -1)
                  Container(
                    margin: const EdgeInsets.only(top: 9, left: 2, right: 2),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(500)
                    ),
                  )
              ],
            ),
          
        ],
      )
  );
}
