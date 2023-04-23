import 'package:flutter/material.dart';

import 'package:navika/src/data.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/style/style.dart';

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
        Container(
          width: size,
          height: size,
          margin: const EdgeInsets.only(left:5.0, top:5.0,right:0.0,bottom:5.0),
          child: Image(
            image: AssetImage( getIconLine(context, LINES.getLinesById(line['id'])) )
          ),
        )
      else if (line['code'] != '')
        Container(
          width: size,
          height: size * 0.64,
          margin: const EdgeInsets.only(left:5.0, top:9.0,right:0.0,bottom:9.0),
          
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
