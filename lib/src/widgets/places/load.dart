import 'package:flutter/material.dart';

class Places_Load extends StatelessWidget {

	const Places_Load({
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
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w700
            ),
          ),
        ]
      ),
    ),
  );
}
