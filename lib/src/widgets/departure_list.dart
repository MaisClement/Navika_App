import 'package:flutter/material.dart';

import '../extensions/hexcolor.dart';

import '../widgets/lines_icons.dart';
import '../widgets/mode_icons.dart';
import '../widgets/timer_block.dart';

class DepartureList extends StatelessWidget {
	final List departures;

	const DepartureList({
		required this.departures,
		super.key,
	});

  String getTime(String time){
    DateTime dttime = DateTime.parse(time);

    String dthour = dttime.hour < 10 ? "0" + dttime.hour.toString() : dttime.hour.toString();
    String dtminute = dttime.minute < 10 ? "0" + dttime.minute.toString() : dttime.minute.toString();

    return '${dthour}:${dtminute}';
  }
  int getDelay(String base_time, String expected_time){
    DateTime dtbase = DateTime.parse(base_time);
    DateTime dtexpected = DateTime.parse(expected_time);

    Duration diff = dtexpected.difference(dtbase);

    return diff.inMinutes;
  }
  Color getState(Map departure){
    if (departure['informations']['state'] == 'cancelled'){
      return Color(0xffeb2031);
    } else if (departure['informations']['state'] == 'delayed'){
      return Color(0xfff68f53);
     }else if (getDelay(departure['stop_date_time']['base_departure_date_time'], departure['stop_date_time']['departure_date_time']) > 0){
      return Color(0xfff68f53);
    } else{
      return Color(0x00000000);
    }
  }
  Color getContainerState(Map departure){
    if (departure['informations']['state'] == 'cancelled') {
      return Color(0xffeb2031);
    } else if (departure['informations']['state'] == 'delayed') {
      return Color(0xfff68f53);
    } else if (getDelay(departure['stop_date_time']['base_departure_date_time'], departure['stop_date_time']['departure_date_time']) > 0){
      return Color(0xfff68f53);
    } else if (departure['informations']['message'] == 'terminus'){
      return Color(0xff888888);
    } else {
      return Color(0x00000000);
    }
  }

	@override
	Widget build(BuildContext context) => ListView(
    children: [
      for (var departure in this.departures)
      if (departure['informations']['direction']['name'] != '')
        Container(
          margin: EdgeInsets.only(left:3.0, top:5.0, right:3.0, bottom:0.0),
          padding: EdgeInsets.only(left:5.0, top:2.0, right:8.0, bottom:2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:  Color.fromARGB(255, 230, 230, 230),
            border: Border(
              top: BorderSide(
                width: 3,
                color: getState(departure)
              ),
              bottom: BorderSide(
                width: 3,
                color: getState(departure)
              ),
              left: BorderSide(
                width: 3,
                color: getState(departure)
              ),
              right: BorderSide(
                width: 3,
                color: getState(departure)
              ),
            )
          ),
          child: Row(
            children: [
              Row(
                children: [
                  ModeIcones(
                    line: departure['informations']['line'],
                    i: 0,
                    size: 23,
                  ),
                  LinesIcones(
                    line: departure['informations']['line'],
                    size: 23
                  ),
                ],
              ),
              Expanded( 
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(departure['informations']['direction']['name'],
                            style: departure['informations']['state'] == 'cancelled' ?
                              TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Parisine',
                                color: Color(0xffeb2031),
                                decoration: TextDecoration.lineThrough
                              )
                            :
                              TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Parisine',
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
                        Container(
                          width: 10,
                        ),
                        Text(departure['informations']['headsign'],
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Diode',
                          )
                        ),
                        if (departure['informations']['headsign'] != '')
                          Container(
                            width: 10,
                          ),
                        Text(departure['informations']['trip_name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Diode',
                          )
                        ),
                        
                      ]
                    ),
                  ]
                ),
              ),

              if (departure['informations']['message'] == 'terminus')
                Container(
                  margin: const EdgeInsets.only(top:16.0), 
                  padding: const EdgeInsets.only(left:7.0, right:5.0),
                  decoration: const BoxDecoration(
                    color: Color(0xff888888),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.zero,
                    )
                  ),
                  child: Text('Terminus',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xffffffff),
                      fontFamily: 'Parisine',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center
                  )
                ), 
              if (departure['informations']['state'] == 'cancelled')
                Container(
                  margin: const EdgeInsets.only(top:16.0), 
                  padding: const EdgeInsets.only(left:7.0, right:5.0),
                  decoration: const BoxDecoration(
                    color: Color(0xffeb2031),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.zero,
                    )
                  ),
                  child: Text('Supprimé',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xffffffff),
                      fontFamily: 'Parisine',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center
                  )
                ),
              if (departure['informations']['state'] != 'cancelled' && getDelay(departure['stop_date_time']['base_departure_date_time'], departure['stop_date_time']['departure_date_time']) > 0)
                Container(
                  margin: const EdgeInsets.only(top:16.0), 
                  padding: const EdgeInsets.only(left:7.0, right:5.0),
                  decoration: const BoxDecoration(
                    color: Color(0xfff68f53),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.zero,
                    )
                  ),
                  child: Text( '+${getDelay(departure['stop_date_time']['base_departure_date_time'], departure['stop_date_time']['departure_date_time'] ).toString()}\'',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xffffffff),
                      fontFamily: 'Parisine',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center
                  )
                ),      

              Container(
                  margin: const EdgeInsets.only(top:5.0, bottom:5.0),
                height: 30,
                decoration: BoxDecoration(
                  color: getContainerState(departure),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.zero,
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  )
                ),
                child: Container(
                  padding: const EdgeInsets.only(left:5.0, top:6.0, right:5.0, bottom:5.0),
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xff141414),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.zero,
                    )
                  ),
                  child: Text(getTime(departure['stop_date_time']['base_departure_date_time']),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xfffcc900),
                      fontFamily: 'Parisine',
                    ),
                    textAlign: TextAlign.center
                  )
                ),
              ),
                
              Container(
                padding: const EdgeInsets.only(left:5.0, top:2.0,right:5.0, bottom:5.0),
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(5),
                  ),
                  border: Border(
                    top: BorderSide(
                      width: 2,
                      color: Color(0xff141414)
                    ),
                    bottom: BorderSide(
                      width: 2,
                      color: Color(0xff141414)
                    ),
                    left: BorderSide(
                      width: 2,
                      color: Color(0xff141414)
                    ),
                    right: BorderSide(
                      width: 2,
                      color: Color(0xff141414)
                    ),  
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: 
                
                  Text( departure['stop_date_time']['platform'] ,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Parisine',
                    ),
                    textAlign: TextAlign.center
                  )
                )
              ),

            ]
          )
        )
          
    ],
  );
}