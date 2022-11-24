import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/widgets/departures/message_block.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

import '../data/global.dart' as globals;

class DepartureDetails extends StatefulWidget {
  final String? stopArea;
  final String? stopLine;

  const DepartureDetails({
    required this.stopArea,
    required this.stopLine,
    super.key
  });

  @override
  State<DepartureDetails> createState() => _DepartureDetailsState();
}

class _DepartureDetailsState extends State<DepartureDetails>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(globals.schedulesStopName),
      elevation: 0,
    ),
    body: Container(
      color: HexColor.fromHex(globals.schedulesDeparture['color']).withOpacity(0.1),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            decoration: BoxDecoration(
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
                  line: globals.schedulesDeparture,
                  i: 0,
                  size: 35,
                  isDark: true,
                ),
                LinesIcones(
                  line: globals.schedulesDeparture,
                  size: 35
                ),
                Container(
                  width: 10,
                ),
                if (LINES.getLinesById(globals.schedulesDeparture['id']).libelle != "")
                  Text(LINES.getLinesById(globals.schedulesDeparture['id']).libelle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ) 
              ],
            ),
          ),

          if (globals.schedulesDeparture['departures'].isEmpty) 
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
            for (var trains in globals.schedulesDeparture['departures'])
              Container(
                margin: const EdgeInsets.only(left:5.0, top:5.0, right:5.0, bottom:5.0),
                padding: const EdgeInsets.only(left:10.0, top:3.0, right:0.0, bottom:3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white.withOpacity(0.8) // 
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded( 
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(trains['informations']['direction']['name'],
                                      style: trains['stop_date_time']['state'] == 'cancelled'
                                      ? const TextStyle(
                                          fontSize: 18,
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
        ],
      ),
    ),
  );
}