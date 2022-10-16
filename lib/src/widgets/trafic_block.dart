import 'package:flutter/material.dart';

import '../routing.dart';

import '../data/lines.dart';

import '../data/global.dart' as globals;

Map getTraficLines(String name){
  for(var lines in globals.trafic){
    if (lines['name'] == name){
      return lines;
    }
  }
  return {};
}

Color getSlug(name, [type]){
  if (getTraficLines(name)['severity'] == 0 && (type == null || type == 0)){
    return Colors.transparent;
  } else if (getTraficLines(name)['severity'] == 0 && type != null && type == 1){
    return Color(0xff008b5b);
  } else if (getTraficLines(name)['severity'] == 5){
    return Color(0xffeb2031);
  } else if (getTraficLines(name)['severity'] == 4){
    return Color(0xfff68f53);
  } else if (getTraficLines(name)['severity'] == 3){
    return Colors.transparent;
  } else if (getTraficLines(name)['severity'] == 2){
    return Colors.transparent;
  } else if (getTraficLines(name)['severity'] == 1){
    return Colors.transparent;
  } else {
    return Color(0xffa9a9a9);
  }
}

AssetImage getSlugImage(name, [type]){
  if (getTraficLines(name)['severity'] == 0 && (type == null || type == 0)){
    return const AssetImage('assets/null.png');
  } else if (getTraficLines(name)['severity'] == 0 && type != null && type == 1){
    return const AssetImage('assets/modal/valid_small.png');
  } else if (getTraficLines(name)['severity'] == 5){
    return const AssetImage('assets/modal/error_small.png');
  } else if (getTraficLines(name)['severity'] == 4){
    return const AssetImage('assets/modal/warning.png');
  } else if (getTraficLines(name)['severity'] == 3){
    return const AssetImage('assets/modal/work_small.png');
  } else if (getTraficLines(name)['severity'] == 2){
    return const AssetImage('assets/modal/futur_work_small.png');
  } else if (getTraficLines(name)['severity'] == 1){
    return const AssetImage('assets/modal/information_small.png');
  } else {
    return const AssetImage('assets/modal/interogation_grey_small.png');
  } 
}

String getSlugTitle(name){
  if (getTraficLines(name)['severity'] == 0){
    return "Trafic fluide";
  } else if (getTraficLines(name)['severity'] == 5){
    return "Trafic fortement perturbé";
  } else if (getTraficLines(name)['severity'] == 4){
    return "Trafic perturbé";
  } else if (getTraficLines(name)['severity'] == 3){
    return "Travaux";
  } else if (getTraficLines(name)['severity'] == 2){
    return "Travaux à venir";
  } else if (getTraficLines(name)['severity'] == 1){
    return "Information";
  } else {
    return "Unknown";
  }
}

class TraficBlock extends StatelessWidget {
	final String name;

	const TraficBlock({
		required this.name,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Stack(
    children: [

      InkWell(                        
        child: Container(
          padding: EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
          margin: EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Color(0xffeeeeee),
            borderRadius: BorderRadius.circular(10), //border corner radius
            border: Border.all(
              width: 3.0,
              // assign the color to the border color
              color: getSlug(name),
            ),
          ),

          child: Image(image: LINES.getLines(name).image),

        ),
        onTap: () {
          RouteStateScope.of(context).go('/trafic/${name}');
        },                   
      ),
      
      Positioned(
        width: 20,
        height: 20,
        top: 33,
        left: 33,
        child: Image(image: getSlugImage(name)),
      )
    ],
  );
}
