import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';

class PlacesEmpty extends StatelessWidget {

	const PlacesEmpty({
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
    child: Column(
      children: [
        Icon(
          NavikaIcons.telescope,
          size: 40,
          color: accentColor(context),
        ),
        Text(
          'Nous n’avons rien trouvé...',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Segoe Ui',
            color: accentColor(context),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
