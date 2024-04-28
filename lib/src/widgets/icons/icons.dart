// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

class Icones extends StatelessWidget {
	final Map line;
  final Map? prevLine;
  final int i;
  final Brightness? brightness;
  final double size;

	const Icones({
		required this.line,
    this.prevLine,
    required this.i,
    this.brightness,
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
          brightness: brightness
        ),

      LinesIcones(
        line: line,
        size: size,
        brightness: brightness
      )

    ],
  );
}
