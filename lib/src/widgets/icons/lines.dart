import 'package:flutter/material.dart';

import 'package:navika/src/data.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/style/style.dart';

class LinesIcones extends StatelessWidget {
	final Map line;
  final double size;
  final bool removeMargin;

	const LinesIcones({
		required this.line,
    this.size = 20,
    this.removeMargin = false,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Stack(
    children: [
      if (line['code'] == 'TER')
        Container(
          width: size,
          height: size,
          margin: removeMargin
            ? const EdgeInsets.all(0)
            : const EdgeInsets.only(left:3, right:3, top: 5, bottom: 5),
          child: Image(
            image: AssetImage( getIconLine(context, LINES.getLinesById(line['code'])) )
          ),
        )
      else if (LINES.isLineById(line['id']))
        Container(
          width: size,
          height: size,
          margin: removeMargin
            ? const EdgeInsets.all(0)
            : const EdgeInsets.only(left:3, right:3, top: 5, bottom: 5),
          child: Image(
            image: AssetImage( getIconLine(context, LINES.getLinesById(line['id'])) )
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
