import 'package:flutter/material.dart';

class Places_Empty extends StatelessWidget {

	const Places_Empty({
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top:40.0),
    child: Center(
      child: Text('🔭 Nous n\'avons rien trouvé...', 
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w700
        ),
      ),
    ),
  );
}
