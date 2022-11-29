import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bottom_sheet_details.dart';
import '../../data/global.dart' as globals;

class TimerBlock extends StatelessWidget {
	final String time;
  final String state;
  final bool disabled;

	const TimerBlock({
		required this.time,
		required this.state,
    this.disabled = false,
		super.key,
	});

  int getTimeDifference(String time){
    DateTime dttime = DateTime.parse(time);
    DateTime dtnow = DateTime.now();
    
    if (dtnow.isAfter(dttime)){
      return -1;
    }

    Duration diff = dttime.difference(dtnow);
    // int diff = dttime.minute - dtnow.minute;
    // print({'INFO_', dttime, dtnow, diff});

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
        // return Color.fromARGB(255, 126, 179, 204);
        return const Color(0xfffcc900);

      default: 
        return const Color(0xffa9a9a9);
    }
  }


	@override
	Widget build(BuildContext context) => 
    getTimeDifference(time) >= 0 && time != "" 
      ? Container(
        margin: const EdgeInsets.only(left:0.0, top:5.0, right:10.0, bottom:5.0),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
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
                  const BottomSchedules());
            }
          },
          child: Container(
            padding: state == "theorical" ? const EdgeInsets.only(left:10.0, top:5.0, right:10.0, bottom:5.0) : const EdgeInsets.only(left:10.0, top:5.0, right:0.0, bottom:5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
                  child: 
                  // getTimeDifference(time) == 0 && state != "cancelled"
                  // ?  BlinkText(
                  //     text: '${getTimeDifference(time).toString()} min',
                  //     color: getColorByState(state, context),
                  //   )
                  // : 
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

/*
class BlinkText extends StatefulWidget {
  final String text;
  final Color color;

	const BlinkText({
		required this.text,
		required this.color,
		super.key,
	});

  @override
  _BlinkTextState createState() => _BlinkTextState();
}

class _BlinkTextState extends State<BlinkText> {
  bool _show = true;
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      setState(() => _show = !_show);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Text(widget.text,
      style: _show
          ? TextStyle(
              color: widget.color,
              fontWeight: FontWeight.w700,
              fontFamily: 'Segoe Ui',
            )
          : TextStyle(
              color: widget.color.withOpacity(0.5),
              fontWeight: FontWeight.w700,
              fontFamily: 'Segoe Ui',
            )
  );

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
*/