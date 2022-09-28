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

	@override
	Widget build(BuildContext context) => ListView(
    children: [
      for (var departure in this.departures)
        Container(
          margin: EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:0.0),
          padding: EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color:  HexColor.fromHex(departure['informations']['line']['color']).withOpacity(0.1),
            color:  Color(0xffcccccc),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    ModeIcones(
                      line: departure['informations']['line'],
                      i: 0,
                      size: 30,
                    ),
                    LinesIcones(
                      line: departure['informations']['line'],
                      size: 30
                    ),
                  ],
                )
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(departure['informations']['direction']['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Parisine',
                              color: Theme.of(context).colorScheme.secondary,
                            )
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
                        Container(
                          width: 10,
                        ),
                        Text(departure['informations']['trip_name'],
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Parisine',
                          )
                        ),
                        
                      ]
                    ),
                  ]
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left:5.0, top:5.0,right:5.0, bottom:5.0),
                  padding: EdgeInsets.only(left:5.0, top:5.0,right:5.0, bottom:5.0),
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xff141414),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(getTime(departure['stop_date_time']['departure_date_time']),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xfffcc900),
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