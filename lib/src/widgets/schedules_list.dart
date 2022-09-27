import 'package:flutter/material.dart';

import '../routing.dart';

import '../data/lines.dart';

import '../widgets/lines_icons.dart';
import '../widgets/mode_icons.dart';
import '../widgets/timer_block.dart';

class SchedulesList extends StatelessWidget {
	final List schedules;
  final List modes;

	const SchedulesList({
		required this.schedules,
		required this.modes,
		super.key,
	});

	@override
	Widget build(BuildContext context) => ListView(
    children: [
      for (var schedule in this.schedules)
        if (modes.contains(schedule['line']['commercial_mode']['id']))
          Container(
            margin: EdgeInsets.only(left:5.0, top:5.0,right:5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    ModeIcones(
                      line: schedule['line'],
                      i: 0,
                      size: 30,
                    ),
                    LinesIcones(
                      line: schedule['line'],
                      size: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left:15.0, top:5.0,right:5.0,bottom:5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var dep in schedule['schedules'])
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top:5.0,bottom:5.0),
                                      child: Text(dep['display_informations']['direction'].substring(0, dep['display_informations']['direction'].indexOf('(')), 
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).colorScheme.secondary,
                                        )
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    for(var i = 0; i < (dep['date_times'].length < 2 ? dep['date_times'].length : 2); i++)
                                      Container(
                                        child: TimerBlock(
                                          time: dep['date_times'][i]['date_time'],
                                          id: i,
                                          el: dep['date_times']
                                        ),
                                      )
                                      
                                  ],
                                )
                              ],
                            )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left:0.0, top:10.0,right:0.0,bottom:00.0),
                  color: Color.fromARGB(255, 70, 70, 70),
                  height: 1.5,
                ),
              ]
            ),
          )
    ],
  );
}