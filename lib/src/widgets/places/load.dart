import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';

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
          Text('Chargement...', 
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
