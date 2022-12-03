import 'package:flutter/material.dart';
import 'package:navika/src/widgets/bottom_sheets/time.dart';
import 'package:navika/src/widgets/departures/list.dart';
import '../../data/global.dart' as globals;

class TimeBlock extends StatelessWidget {
	final String time;
  final String base;
  final String state;
  final int late;
  final String track;
  final Function update;
  final bool disabled;

	const TimeBlock({
		required this.time,
		required this.base,
		required this.state,
		required this.late,
		required this.track,
    required this.update,
    this.disabled = false,
		super.key,
	});

  int getTimeDifference(String time){
    DateTime dttime = DateTime.parse(time);
    DateTime dtnow = DateTime.now();

    Duration diff = dttime.difference(dtnow);

    return diff.inMinutes;
  }
  String getTime(String time){
    if (time == "") {
      return "";
    }
    
    DateTime dttime = DateTime.parse(time);

    int dth = dttime.hour + 1;
    String dthour = dth < 10 ? "0$dth" : dth.toString();
    String dtminute = dttime.minute < 10 ? "0${dttime.minute}" : dttime.minute.toString();

    return '$dthour:$dtminute';
  }
  Color getColorByState(state, context) {
    if (state == 'cancelled' || state == 'delayed' || state == 'ontime'){
      return const Color(0xfffcc900);
    }

    return const Color(0xffa9a9a9);
  }


	@override
	Widget build(BuildContext context) => Wrap(
	  children: [
      
      if (state == 'cancelled' || (state == 'delayed' && late > 0))
        Container(
          margin: const EdgeInsets.only(left:0.0, top:13.0, right:0, bottom:0),
          padding: const EdgeInsets.only(left:4.0, top:2.0, right:4, bottom:3.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(7),
              bottomLeft: Radius.circular(7)
            ),
            color: getBackColorByState(state, context),
          ),
          child: Text(state == 'cancelled'
            ? 'Supprimé'
            : '+${late.toString()} min',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Segoe Ui',
              color: Colors.white,
            ),
          ),
        ),

	    Container(
        margin: const EdgeInsets.only(left:0.0, top:5.0, right:6, bottom:5.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(7),
            bottomRight: Radius.circular(7)
          ),
          color: getBackColorByState(state, context),
        ),
	      child: Container(
        padding: const EdgeInsets.only(left:3.0, top:3.0, right:3.0, bottom:3.0),
        decoration: BoxDecoration(
          color: const Color(0xff202020),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
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
                      isDeparture: true,
                      update: update,
                    ));
              }
            },
            child: Wrap(
              children: [time != "" && time.length > 1 && getTimeDifference(time) >= 0
                ? Container(
                    padding: const EdgeInsets.only(left:7.0, top:2.0, right:7.0, bottom:2.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)
                      ),
                      color: const Color(0xff202020),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        )
                      ]
                    ),
                    child: Text(globals.hiveBox?.get('displayMode') == 'minutes'
                            ? '${getTimeDifference(time).toString()} min'
                            : getTime(base),
                      style: TextStyle(
                        color: getColorByState(state, context),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Segoe Ui',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : const Text(''),

                Container(
                  padding: const EdgeInsets.only(left:7.0, top:2.0, right:7.0, bottom:2.0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topRight : Radius.circular(3),
                      bottomRight : Radius.circular(3)
                    ),
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(track,
                      style: const TextStyle(
                        color: Color(0xff202020),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Segoe Ui',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ]
	          ),
	        ),
	      ),
	    ),
	  ],
	);
}

