import 'package:flutter/material.dart';

import '../routing.dart';

import '../data/trafic.dart';
import '../data/lines.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class LinesIcones extends StatelessWidget {
	final Map line;
  final double size;

	const LinesIcones({
		required this.line,
    this.size = 20,
		super.key,
	});

	@override
	Widget build(BuildContext context) => 
    LINES.isLineById(line['id'].replaceAll('line:IDFM:', '')) ?
      Container(
        width: size,
        height: size,
        margin: EdgeInsets.only(left:5.0, top:5.0,right:0.0,bottom:5.0),
        child: Image(image: LINES.getLinesById(line['id'].replaceAll('line:IDFM:', '')).image),
      )
    :
      Container(
        width: size,
        height: size * 0.64,
        margin: EdgeInsets.only(left:5.0, top:9.0,right:0.0,bottom:9.0),
        color: HexColor.fromHex(line['color']),

        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(line['code'],
            style: TextStyle(
              color:  HexColor.fromHex(line['text_color']),
              fontWeight: FontWeight.w800,
              fontFamily: 'Parisine'
            ),
          ),
        )
      );
}
