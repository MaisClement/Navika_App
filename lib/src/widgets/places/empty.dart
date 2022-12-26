import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';

class PlacesEmpty extends StatelessWidget {

	const PlacesEmpty({
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top:40.0),
    child: Center(
      child: Text('🔭 Nous n\'avons rien trouvé...', 
        style: TextStyle(
          color: accentColor(context),
          fontWeight: FontWeight.w700
        ),
      ),
    ),
  );
}
