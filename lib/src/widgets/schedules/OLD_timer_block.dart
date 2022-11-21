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
  String getTime(String time){
    DateTime dttime = DateTime.parse(time);

    String dthour = dttime.hour < 10 ? "0" + dttime.hour.toString() : dttime.hour.toString();
    String dtminute = dttime.minute < 10 ? "0" + dttime.minute.toString() : dttime.minute.toString();

    return '${dthour}h${dtminute}';
  }


	@override
	Widget build(BuildContext context) => 

  getTimeDifference(time) > 0
    ? getTimeDifference(time) < 99
      ? Container(
          padding: EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:5.0),
          margin: EdgeInsets.only(left:0.0, top:5.0,right:10.0,bottom:5.0),
          constraints: BoxConstraints( minWidth: 50 ),
          decoration: BoxDecoration(
            color: Color(0xff141414),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            getTimeDifference(time).toString() + '\'',
            style: const TextStyle(
              color: Color(0xfffcc900),
              fontWeight: FontWeight.w700,
              fontFamily: 'Segoe Ui',
            ),
            textAlign: TextAlign.center,
          ),
        )
      : Container(
          padding: EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:5.0),
          margin: EdgeInsets.only(left:0.0, top:5.0,right:10.0,bottom:5.0),
          decoration: BoxDecoration(
            color: Color(0xff141414),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            getTime(time),
            style: const TextStyle(
              color: Color(0xfffcc900),
              fontWeight: FontWeight.w700,
              fontFamily: 'Segoe Ui',
            ),
            textAlign: TextAlign.center,
          ),
        )
    : Container();
}

