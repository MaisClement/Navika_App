// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/data.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/style.dart';

class LinesIcones extends StatelessWidget {
	final Map line;
  final double size;
  final Brightness? brightness;
  final bool removeMargin;

	const LinesIcones({
		required this.line,
    this.size = 20,
    this.brightness,
    this.removeMargin = false,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Stack(
    children: [
      if (line['agency'] != null && line['agency']['name'] == 'Noctilien')
        Container(
          width: size,
          height: size * 0.64,
          margin: removeMargin
            ? EdgeInsets.only(top: (size - size * 0.64) / 2, bottom: (size - size * 0.64) / 2)
            : EdgeInsets.only(left:3, right:3, top: ((size - size * 0.64) / 2) + 5, bottom: ((size - size * 0.64) / 2) + 5),
          padding: const EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: const Color(0xff0a0082),
            border: Border(
              bottom: BorderSide(
                width: size * 0.1,
                color: HexColor.fromHex(line['color']),
              )
            ),
          ),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(line['code'],
              style: const TextStyle(
                color:  Color(0xffffffff),
                fontWeight: FontWeight.w800,
                fontFamily: 'Segoe Ui'
              ),
            ),
          )
        )
        
      else if (LINES.getLines(line) != null && LINES.getLines(line)!['logo'] != null)
        Container(
          width: size,
          height: size,
          margin: removeMargin
            ? const EdgeInsets.all(0)
            : const EdgeInsets.only(left:3, right:3, top: 5, bottom: 5),
          child: Image(
            image: AssetImage( getIconLine(brightness ?? Theme.of(context).colorScheme.brightness, LINES.getLines(line)) )
          ),
        )
        
      else if (line['code'] != '')
        Container(
          width: size,
          height: size * 0.64,
          margin: removeMargin
            ? EdgeInsets.only(top: (size - size * 0.64) / 2, bottom: (size - size * 0.64) / 2)
            : EdgeInsets.only(left:3, right:3, top: ((size - size * 0.64) / 2) + 5, bottom: ((size - size * 0.64) / 2) + 5),
          padding: const EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: HexColor.fromHex(line['color']),
          ), 

          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(line['code'],
              style: TextStyle(
                color:  HexColor.fromHex(line['text_color']),
                fontWeight: FontWeight.w800,
                fontFamily: 'Segoe Ui'
              ),
            ),
          )
        )
    ],
  );
}
