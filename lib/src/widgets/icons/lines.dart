import 'package:flutter/material.dart';

import 'package:navika/src/data.dart';
import 'package:navika/src/extensions/hexcolor.dart';


class LinesIcones extends StatelessWidget {
	final Map line;
  final double size;

	const LinesIcones({
		required this.line,
    this.size = 20,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Stack(
    children: [
      if (LINES.isLineById(line['id']))
        if (LINES.getLinesById(line['id']).name == 'TER')
          const Text('')
        else
          Container(
            width: size,
            height: size,
            margin: const EdgeInsets.only(left:5.0, top:5.0,right:0.0,bottom:5.0),
            child: Image(image: LINES.getLinesById(line['id']).image),
          )
      else if (line['code'] != '')
        Container(
          width: size,
          height: size * 0.64,
          margin: const EdgeInsets.only(left:5.0, top:9.0,right:0.0,bottom:9.0),
          color: HexColor.fromHex(line['color']),

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
