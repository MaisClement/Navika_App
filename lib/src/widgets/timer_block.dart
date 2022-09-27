import 'package:flutter/material.dart';

class TimerBlock extends StatelessWidget {
	final String time;
  final int id;
  final List el;

	const TimerBlock({
		required this.time,
		required this.id,
		required this.el,
		super.key,
	});

  int getTimeDifference(String time){
    DateTime dttime = DateTime.parse(time);
    DateTime dtnow = DateTime.now();

    Duration diff = dttime.difference(dtnow);

    return diff.inMinutes;
  }
  String getTime(String time, bool suiv, List el, int i){
    DateTime dttime = DateTime.parse(time);

    String dthour = dttime.hour < 10 ? "0" + dttime.hour.toString() : dttime.hour.toString();
    String dtminute = dttime.minute < 10 ? "0" + dttime.minute.toString() : dttime.minute.toString();

    if (i == 0 && el.length == 1)
      return 'Prochain passage : ${dthour}h${dtminute}${suiv ? ', ' : ''}';
    else if (i == 0)
      return 'Prochains passages : ${dthour}h${dtminute}${suiv ? ', ' : ''}';
    else
      return '${i == 0 ? 'Prochain passage : ' : ''}${dthour}h${dtminute}${suiv ? ', ' : ''}';
  }


	@override
	Widget build(BuildContext context) => 
  
  getTimeDifference(time) < 99 ?
    Container(
      padding: EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:5.0),
      margin: EdgeInsets.only(left:0.0, top:5.0,right:10.0,bottom:5.0),
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
    )
  :
    Container(
      padding: EdgeInsets.only(top:5.0,bottom:10.0),
      child: Text(
        getTime(time, (id+1 >= el.length || id +1 >= 2 ? false : true), el, id),
        style: const TextStyle(
          fontWeight: FontWeight.w700
        ),
        textAlign: TextAlign.center,
      ),
    );
}

