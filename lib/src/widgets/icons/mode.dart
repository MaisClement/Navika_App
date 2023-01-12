import 'package:flutter/material.dart';
import 'package:navika/src/data.dart';


class ModeIcones extends StatelessWidget {
	final Map line;
  final int i;
  final bool isDark;
  final double size;

	const ModeIcones({
		required this.line,
		required this.i,
		this.isDark = true,
    this.size = 20,
		super.key,
	});
  
	@override
	Widget build(BuildContext context) => Stack(
    children: [

    if (LINES.isLineById(line['id']))
      if (line['id'] == 'TER')
          const Text('')
      else
        Container(
        width: size,
        height: size,
        margin: i == 0 ? const EdgeInsets.only(left:5.0, top:5.0,right:0.0,bottom:5.0) : const EdgeInsets.only(left:20.0, top:5.0,right:0.0,bottom:5.0),
        child: 
          isDark ?
            Image(image: AssetImage(LINES.getLinesById(line['id']).imageModeDark))
          :
            Image(image: AssetImage(LINES.getLinesById(line['id']).imageModeWhite)),
      )
    else 
      Container(
        width: size,
        height: size,
        margin: i == 0 ? const EdgeInsets.only(left:5.0, top:5.0,right:0.0,bottom:5.0) : const EdgeInsets.only(left:20.0, top:5.0,right:0.0,bottom:5.0),
        child:
          isDark ?
            const Image(image: AssetImage('assets/icons/BUS_dark.png'))
          :
            const Image(image: AssetImage('assets/icons/BUS_white.png')),
      )
    ],
  );
}
