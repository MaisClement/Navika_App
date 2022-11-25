import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/widgets/departures/message_block.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';
import 'package:http/http.dart' as http;

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

  late Timer _timer;
  Map departure = globals.schedulesDeparture;

  @override
	void initState() {
		super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _timer = Timer(const Duration(seconds: 30), () {
        _getDepature();
      });
    });
	}

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
	}

	@override
	void dispose() {
		super.dispose();
    _timer.cancel();
	}

  Future<void> _getDepature() async {
    print({'INFO_get', globals.schedulesStopArea});
    try {
      final response = await http.get(Uri.parse('${globals.API_SCHEDULES}?s=${globals.schedulesStopArea}'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (mounted) {
          setState(() {
            if (data['departures'] != null) {
              for(var i = 0; i < data['departures'].length; i++) {
                if (data['departures'][i]['id'] == widget.stopLine) {
                  departure = data['departures'][i];
                  break;
                }
              }
              
            }
          });
        }
      }

      _timer = Timer(const Duration(seconds: 30), () {
        _getDepature();
      });
    } on Exception catch (_) {
      print('OULA PAS CONTENT');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(globals.schedulesStopName),
      elevation: 0,
    ),
    body: Container(
      color: HexColor.fromHex(departure['color']).withOpacity(0.1),
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
                  line: departure,
                  i: 0,
                  size: 35,
                  isDark: true,
                ),
                LinesIcones(
                  line: departure,
                  size: 35
                ),
                Container(
                  width: 10,
                ),
                if (LINES.getLinesById(departure['id']).libelle != "")
                  Text(LINES.getLinesById(departure['id']).libelle,
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
            for (var trains in departure['departures'])
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
                            state: trains['stop_date_time']['state'],
                            track: trains['stop_date_time']['platform']
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