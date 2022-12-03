import 'package:flutter/material.dart';

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
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700
            ),
          ),
        ]
      ),
    ),
  );
}
