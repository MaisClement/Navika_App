import 'package:flutter/material.dart';

import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

class Icones extends StatelessWidget {
	final Map line;
  final Map old_line;
  final int i;

	const Icones({
		required this.line,
    required this.old_line,
    required this.i,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Wrap(
    children: [
      
      if (old_line['mode'] != line['mode'] || i == 0)
        ModeIcones(
          line: line,
          i: i
        ),

      LinesIcones(
        line: line
      )

    ],
  );
}
