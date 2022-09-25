import 'package:flutter/material.dart';

import '../routing.dart';

import '../data/trafic.dart';
import '../data/lines.dart';

class ModeIcones extends StatelessWidget {
	final Map line;
  final int i;
  final double size;

	const ModeIcones({
		required this.line,
		required this.i,
    this.size = 20,
		super.key,
	});

	@override
	Widget build(BuildContext context) => 
    LINES.isLineById(line['id'].replaceAll('line:IDFM:', '')) ?

      Container(
        width: size,
        height: size,
        margin: i == 0 ? EdgeInsets.only(left:5.0, top:5.0,right:0.0,bottom:5.0) : EdgeInsets.only(left:20.0, top:5.0,right:0.0,bottom:5.0),
        child: Image(image: LINES.getLinesById(line['id'].replaceAll('line:IDFM:', '')).image_mode),
      )
    :
      Container(
        width: size,
        height: size,
        margin: i == 0 ? EdgeInsets.only(left:5.0, top:5.0,right:0.0,bottom:5.0) : EdgeInsets.only(left:20.0, top:5.0,right:0.0,bottom:5.0),
        child: Image(image: AssetImage('assets/idfm/BUS_dark.png')),
      );
}
