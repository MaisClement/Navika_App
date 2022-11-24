import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/global.dart' as globals;

import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/widgets/departures/message_block.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

class DepartureList extends StatelessWidget {
	final List departures;
  final ScrollController scrollController;

	const DepartureList({
		required this.departures,
    required this.scrollController,
		super.key,
	});

  String getTime(String time){
    return '';
    DateTime dttime = DateTime.parse(time);

    String dthour = dttime.hour < 10 ? "0" + dttime.hour.toString() : dttime.hour.toString();
    String dtminute = dttime.minute < 10 ? "0" + dttime.minute.toString() : dttime.minute.toString();

    return '${dthour}:${dtminute}';
  }
  int getDelay(String base_time, String expected_time){
    return 0;
    DateTime dtbase = DateTime.parse(base_time);
    DateTime dtexpected = DateTime.parse(expected_time);

    Duration diff = dtexpected.difference(dtbase);

    return diff.inMinutes;
  }
  Color getState(Map departure){
    if (departure['informations']['state'] == 'cancelled'){
      return const Color(0xffeb2031);
    } else if (departure['informations']['state'] == 'delayed'){
      return const Color(0xfff68f53);
     }else if (getDelay(departure['stop_date_time']['base_departure_date_time'], departure['stop_date_time']['departure_date_time']) > 0){
      return const Color(0xfff68f53);
    } else{
      return const Color(0x00000000);
    }
  }
  Color getContainerState(Map departure){
    if (departure['informations']['state'] == 'cancelled') {
      return const Color(0xffeb2031);
    } else if (departure['informations']['state'] == 'delayed') {
      return const Color(0xfff68f53);
    } else if (getDelay(departure['stop_date_time']['base_departure_date_time'], departure['stop_date_time']['departure_date_time']) > 0){
      return const Color(0xfff68f53);
    } else if (departure['informations']['message'] == 'terminus'){
      return const Color(0xff888888);
    } else {
      return const Color(0x00000000);
    }
  }

	@override
	Widget build(BuildContext context) => ListView(
    controller: scrollController,
    children: [
      if (departures.isEmpty)
        Column(
          children: [
            const CircularProgressIndicator(),
            Text('Chargement...', 
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w700
              ),
            ),
          ]
        )
      else
        for (var departure in this.departures)
          Container(
            margin: const EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: HexColor.fromHex(departure['color']).withOpacity(0.1), // Color.fromARGB(255, 230, 230, 230), // 
            ),
            child: Column(
              children: [
                Container(
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
                  child: Row(
                    children: [
                      ModeIcones(
                        line: departure,
                        i: 0,
                        size: 30,
                        isDark: true,
                      ),
                      LinesIcones(
                        line: departure,
                        size: 30
                      ),
                      Container(
                        width: 10,
                      ),
                      if (departure['code'] != departure['name'])
                        Expanded(
                          child: Text(
                            departure['name'],
                            style: TextStyle(
                              color:  HexColor.fromHex(departure['text_color']),
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Segoe Ui'
                            )
                          )
                        )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (departure['departures'].isEmpty) 
                        Row(
                          children: [
                            SvgPicture.asset('assets/cancel.svg',
                                color: Theme.of(context).colorScheme.secondary,
                                height: 18
                              ),
                            Text('Aucune information',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Segoe Ui'
                              ),
                            ),
                          ],
                        )
                      else
                        for (var trains in departure['departures'].sublist(0, departure['departures'].length > 5 ? 5 : departure['departures'].length))
                          Container(
                            margin: const EdgeInsets.only(left:0.0, top:5.0, right:0.0, bottom:5.0),
                            padding: const EdgeInsets.only(left:10.0, top:0.0, right:0.0, bottom:0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white.withOpacity(0.8) // 
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    // Row(
                                    //   children: [
                                    //     ModeIcones(
                                    //       line: departure['informations']['line'],
                                    //       i: 0,
                                    //       size: 23,
                                    //     ),
                                    //     LinesIcones(
                                    //       line: departure['informations']['line'],
                                    //       size: 23
                                    //     ),
                                    //   ],
                                    // ),
                                    Expanded( 
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(trains['informations']['direction']['name'],
                                                  style: trains['stop_date_time']['state'] == 'cancelled'
                                                  ? const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: 'Segoe Ui',
                                                      color: Color(0xffeb2031),
                                                      decoration: TextDecoration.lineThrough
                                                    )
                                                  : TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: 'Segoe Ui',
                                                      color: Theme.of(context).colorScheme.secondary,
                                                    ),
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  overflow: TextOverflow.fade,
                                                ),
                                              )
                                            ]
                                          ),
                                          Row(
                                            children: [
                                              Text(trains['informations']['headsign'],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Diode',
                                                )
                                              ),
                                              if (trains['informations']['headsign'] != '')
                                                Container(
                                                  width: 10,
                                                ),
                                              Text(trains['informations']['trip_name'],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Diode',
                                                )
                                              ),
                                              
                                            ]
                                          ),
                                        ]
                                      ),
                                    ),

                                    if (trains['informations']['message'] == "terminus")
                                      const MessageBlock(
                                        message: "Terminus"
                                      )
                                    else 
                                      TimeBlock(
                                        time: trains['stop_date_time']['departure_date_time'],
                                        state: trains['stop_date_time']['state']
                                      )
                                      
                                  ]
                                ),
                                
                              ]
                            ),
                          ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left:0.0, top:5.0,right:0.0,bottom:5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white.withOpacity(0.8)
                            ),
                            child: InkWell(
                              onTap: () {
                                RouteStateScope.of(context).go('/schedules/${globals.schedulesStopArea}/departures/${departure['id']}');
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left:10.0, top:5.0, right:10.0, bottom:5.0),
                                child: Text('Voir le reste ➜',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Segoe Ui',
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              )
                            ),
                          ),
                        ],
                      )
                          
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:  HexColor.fromHex(departure['color']),
                  )
                )
              ]
            ),
          )
    ]
  );
}