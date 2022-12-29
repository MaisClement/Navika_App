import 'package:flutter/material.dart';

import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

class Icones extends StatelessWidget {
	final Map line;
  final Map oldLine;
  final int i;
  final bool isDark;
  final double size;

	const Icones({
		required this.line,
    required this.oldLine,
    required this.i,
    this.isDark = true,
    this.size = 20,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Wrap(
    children: [
      
      if (oldLine['mode'] != line['mode'] || i == 0)
        ModeIcones(
          line: line,
          i: i,
          size: size,
          isDark: isDark,
        ),

      LinesIcones(
        line: line,
        size: size,
      )

    ],
  );
}
