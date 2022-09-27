import 'package:flutter/material.dart';


import '../extensions/hexcolor.dart';

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
            margin: EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:0.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                  color:  HexColor.fromHex(schedule['line']['color']),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 0), // changes x,y position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ModeIcones(
                        line: schedule['line'],
                        i: 0,
                        size: 30,
                        isDark: schedule['line']['text_color'] == "000000",
                      ),
                      Container(
                        margin: EdgeInsets.only(left:10.0, top:0.0,right:10.0,bottom:0.0),
                        child: Text(
                          schedule['line']['code'],
                          style: TextStyle(
                            color:  HexColor.fromHex(schedule['line']['text_color']),
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Parisine',
                            fontSize: 24,
                          ),
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                        ),
                      ),
                      if (schedule['line']['code'] != schedule['line']['name'])
                        Expanded(
                          child: Text(
                            schedule['line']['name'],
                            style: TextStyle(
                              color:  HexColor.fromHex(schedule['line']['text_color']),
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Parisine'
                            )
                          )
                        )
                      
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var dep in schedule['schedules'])
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:5.0,bottom:5.0),
                              child: Text('➜ ' + dep['display_informations']['direction'].substring(0, dep['display_informations']['direction'].indexOf('(')), 
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.secondary,
                                )
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                if (dep['date_times'].length > 0)
                                  for(var i = 0; i < (dep['date_times'].length < 2 ? dep['date_times'].length : 2); i++)
                                    Container(
                                      child: TimerBlock(
                                        time: dep['date_times'][i]['date_time'],
                                        id: i,
                                        el: dep['date_times']
                                      ),
                                    )
                                else
                                  Text('Aucune information', 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    )
                                  ),
                              ],
                            )
                          ],
                        )
                    ],
                  ),
                ),
                Container(
                  color:  HexColor.fromHex(schedule['line']['color']),
                  height: 3,
                )
              ]
            ),
          )
    ],
  );
}