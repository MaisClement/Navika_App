import 'package:flutter/material.dart';

class TimeBlock extends StatelessWidget {
	final String time;
  final String state;

	const TimeBlock({
		required this.time,
		required this.state,
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

    return '${dthour}:${dtminute}';
  }
  Color getColorByState(state, context) {
    switch (state) {
      case 'cancelled':
        return const Color(0xffeb2031);
      
      case 'delayed':
        return const Color(0xfff68f53);

      case 'ontime':
        return Theme.of(context).colorScheme.secondary;

      default: 
        return const Color(0xffa9a9a9);
    }
  }

	@override
	Widget build(BuildContext context) => 

  time != "" && time.length > 1 && getTimeDifference(time) >= 0
    ? Container(
        padding: const EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:5.0),
        margin: const EdgeInsets.only(left:0.0, top:5.0,right:7.5,bottom:5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ]
        ),
        child: Text(
          getTime(time),
          style: TextStyle(
            color: getColorByState(state, context),
            fontWeight: FontWeight.w700,
            fontFamily: 'Segoe Ui',
            decoration: state == "cancelled" ? TextDecoration.lineThrough : null,
          ),
          textAlign: TextAlign.center,
        ),
      )
    : const Text('');
}

