import 'package:flutter/material.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/lines.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';

Map getTraficLines(String name){
  for(var lines in globals.trafic){
    if (lines['id'] == name){
      return lines;
    }
  }
  return {};
}

Color getSlug(severity, [type]){
  if (severity == 0 && (type == null || type == 0)){
    return Colors.transparent;
  } else if (severity == 0 && type != null && type == 1){
    return const Color(0xff008b5b);
  } else if (severity == 5){
    return const Color(0xffeb2031);
  } else if (severity == 4){
    return const Color(0xfff68f53);
  } else if (severity == 3){
    return Colors.transparent;
  } else if (severity == 2){
    return Colors.transparent;
  } else if (severity == 1){
    return Colors.transparent;
  } else if (type != null && type == 1) {
    return const Color(0xff008b5b);
  } else {
    return Colors.transparent;
  }
}

Color getSlugBack(severity, [type]){
  if (severity == 0 && (type == null || type == 0)){
    return Colors.transparent;
  } else if (severity == 0 && type != null && type == 1){
    return const Color(0xff008b5b).withOpacity(0.2);
  } else if (severity == 5){
    return const Color(0xffeb2031).withOpacity(0.2);
  } else if (severity == 4){
    return const Color(0xfff68f53).withOpacity(0.2);
  } else if (severity == 3){
    return const Color(0xfff68f53).withOpacity(0.2);
  } else if (severity == 2){
    return const Color(0xfff68f53).withOpacity(0.2);
  } else if (severity == 1){
    return const Color(0xff005bbc).withOpacity(0.2);
  } else if (type != null && type == 1) {
    return const Color(0xff008b5b).withOpacity(0.2);
  } else {
    return Colors.transparent;
  }
}

AssetImage getSlugImage(severity, [type]){
  if (severity == 0 && (type == null || type == 0)){
    return const AssetImage('assets/img/null.png');
  } else if (severity == 0 && type != null && type == 1){
    return const AssetImage('assets/img/modal/valid.png');
  } else if (severity == 5){
    return const AssetImage('assets/img/modal/error.png');
  } else if (severity == 4){
    return const AssetImage('assets/img/modal/warning.png');
  } else if (severity == 3){
    return const AssetImage('assets/img/modal/work.png');
  } else if (severity == 2){
    return const AssetImage('assets/img/modal/futur_work.png');
  } else if (severity == 1){
    return const AssetImage('assets/img/modal/information.png');
  } else if (type != null && type == 1) {
    return const AssetImage('assets/img/modal/valid.png');
  } else {
    return const AssetImage('assets/img/null.png');
    // return const AssetImage('assets/img/modal/interogation_grey.png');
  } 
}

String getSlugTitle(severity){
  if (severity == 0){
    return 'Trafic fluide';
  } else if (severity == 5){
    return 'Trafic fortement perturbé';
  } else if (severity == 4){
    return 'Trafic perturbé';
  } else if (severity == 3){
    return 'Travaux';
  } else if (severity == 2){
    return 'Travaux à venir';
  } else if (severity == 1){
    return 'Information';
  } else {
    return 'Trafic fluide';
    //return "Unknown";
  }
}

class TraficBlock extends StatelessWidget {
	final String name;
  final List trafic;

	const TraficBlock({
		required this.name,
		required this.trafic,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Stack(
    children: [

      InkWell(                        
        child: Container(
          padding: const EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
          margin: const EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: traficBlockColor(context),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 3.0,
              color: getSlug(getTraficLines(LINES.getLines(name).id)['severity']),
            ),
          ),
          child: Image(image: AssetImage(LINES.getLines(name).image)),
        ),
        onTap: () {
          RouteStateScope.of(context).go('/trafic/$name');
        },                   
      ),
      
      Positioned(
        width: 20,
        height: 20,
        top: 33,
        left: 33,
        child: Image(image: getSlugImage(getTraficLines(LINES.getLines(name).id)['severity'])),
      )
    ],
  );
}
