import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bottom_sheets/time.dart';
import '../../data/global.dart' as globals;

int getTimeDifference(String time){
    DateTime dttime = DateTime.parse(time);
    DateTime dtnow = DateTime.now();
    Duration diff = dttime.difference(dtnow);

    return diff.inMinutes;
  }
  String getTime(String time){
    DateTime dttime = DateTime.parse(time);

    String dthour = dttime.hour < 10 ? "0${dttime.hour}" : dttime.hour.toString();
    String dtminute = dttime.minute < 10 ? "0${dttime.minute}" : dttime.minute.toString();

    return '${dthour}h${dtminute}';
  }
  Color getColorByState(state, context) {
    switch (state) {
      case 'cancelled':
        return const Color(0xffeb2031);
      
      case 'delayed':
        return const Color(0xfff68f53);

      case 'ontime':
        return Theme.of(context).colorScheme.primary;
        // return const Color(0xfffcc900);

      default: 
        return const Color(0xffa9a9a9);
    }
  }

class TimerBlock extends StatelessWidget {
	final String time;
  final String state;
  final Function update;
  final bool disabled;

	const TimerBlock({
		required this.time,
		required this.state,
    required this.update,
    this.disabled = false,
		super.key,
	});

	@override
	Widget build(BuildContext context) => 
    getTimeDifference(time) >= 0 && time != "" 
      ? Container(
        margin: const EdgeInsets.only(left:0.0, top:5.0, right:10.0, bottom:5.0),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ]
        ),
        constraints: const BoxConstraints( minWidth: 60 ),
        child: InkWell(
          onTap: () {
            if (disabled == false){
              showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                isScrollControlled: true,
                context: context, 
                builder: (BuildContext context) => 
                  BottomSchedules(
                    update: update,
                  ));
            }
          },
          child: Container(
            padding: state == "theorical" ? const EdgeInsets.only(left:10.0, top:5.0, right:10.0, bottom:5.0) : const EdgeInsets.only(left:10.0, top:5.0, right:0.0, bottom:5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
                  child: 
                  Text((getTimeDifference(time) < 99) && globals.hiveBox?.get('displayMode') != 'hour'
                    ? '${getTimeDifference(time).toString()} min'
                    : getTime(time),
                    style: TextStyle(
                      color: getColorByState(state, context),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Segoe Ui',
                      decoration: state == "cancelled" ? TextDecoration.lineThrough : null,
                    ),
                    textAlign: TextAlign.center,
                  )
                ),
                state == "theorical"
                ? const Text('')
                : SvgPicture.asset('assets/sign_top.svg',
                    color: getColorByState(state, context),
                    height: 15
                  )
              ],
            ),
          )
        ),
      )
      : const Text('');
}