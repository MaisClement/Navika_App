import 'package:flutter/material.dart';

import '../routing.dart';

import '../data/trafic.dart';
import '../data/lines.dart';

import '../widgets/lines_icons.dart';
import '../widgets/mode_icons.dart';

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
      
      (old_line['commercial_mode']['id'] != line['commercial_mode']['id'] || i == 0) ?
        ModeIcones(
          line: line,
          i: i
        )
        :
        Text(''),

      LinesIcones(
        line: line
      )

    ],
  );
}
