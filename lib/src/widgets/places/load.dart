// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/style.dart';

class PlacesLoad extends StatelessWidget {

	const PlacesLoad({
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top:40.0),
    child: Center(
      child: Column(
        children: [
          const CircularProgressIndicator(),
          Text(AppLocalizations.of(context)!.loading, 
            style: TextStyle(
              color: accentColor(context),
              fontWeight: FontWeight.w700
            ),
          ),
        ]
      ),
    ),
  );
}
