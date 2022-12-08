import 'package:flutter/material.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';

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
        for(var section in sections)
          if (section['mode'] == 'public_transport')
            Text(section['informations']['line']['code'])

          else if (section['mode'] == 'walking')
            const Icon(ScaffoldIcon.walking,
              color: Colors.grey,
              size: 25
            )
      ],
    ),
  );
}
