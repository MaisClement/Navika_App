import 'package:flutter/material.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';

import 'package:navika/src/widgets/icons/icons.dart';
import 'package:navika/src/widgets/route/lines.dart';

String getTime(String time){    
  DateTime dttime = DateTime.parse(time);
  String dthour = dttime.hour < 10 ? '0${dttime.hour}' : dttime.hour.toString();
  String dtminute = dttime.minute < 10 ? '0${dttime.minute}' : dttime.minute.toString();
  return '$dthour:$dtminute';
}

String getDuration (int d) {
  Duration duration = Duration(seconds: d);
  String res = '';

  if (duration.inMinutes > 60){
    res = '${duration.inHours.remainder(60).toString()}h${duration.inMinutes.remainder(60).toString()}';
  } else {
    res = '${duration.inMinutes.remainder(60).toString()}mn';
  }

  return res;
}

class RouteListButton extends StatelessWidget {
  final Map journey;
  final void Function() onTap;

	const RouteListButton({
    required this.journey,
    required this.onTap,
		super.key,
	});

	@override
	Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.only(left:20.0, top:5.0,right:5.0,bottom:5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(getTime( journey['departure_date_time'] ),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    ),
                  ),
                  Text(getTime( journey['arrival_date_time'] ),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),

              RouteLines(
                sections: journey['sections'],
              ),

              const SizedBox(
                width: 10,
              ),
              Column(
                children: [

                  const SizedBox(
                    height: 30,
                  ),

                  Text( getDuration(journey['duration']) ,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                ]
              ),
              
            ],
          ),
          
        ]
      )
    ),                
  );
}
