import 'package:flutter/material.dart';

import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

class Icones extends StatelessWidget {
	final Map line;
  final Map? prevLine;
  final int i;
  final bool isDark;
  final double size;

	const Icones({
		required this.line,
    this.prevLine,
    required this.i,
    this.isDark = true,
    this.size = 20,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Wrap(
    children: [
      
      if (prevLine != null && prevLine?['mode'] != line['mode'] || i == 0)
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
