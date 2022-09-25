import 'package:flutter/material.dart';

class TimerBlock extends StatelessWidget {
	final String time;

	const TimerBlock({
		required this.time,
		super.key,
	});

  int getTimeDifference(String time){
    DateTime dttime = DateTime.parse(time);
    DateTime dtnow = DateTime.now();

    Duration diff = dttime.difference(dtnow);

    return diff.inMinutes;
  }


	@override
	Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:5.0),
    
    margin: EdgeInsets.only(left:0.0, top:0.0,right:10.0,bottom:0.0),
    width: 40,
    decoration: BoxDecoration(
      color: Color(0xff141414),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(
      getTimeDifference(time).toString() + '\'',
      style: const TextStyle(
        color: Color(0xfffcc900),
        fontWeight: FontWeight.w700
      ),
      textAlign: TextAlign.center,
    ),
  );
}

