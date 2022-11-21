import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../extensions/hexcolor.dart';
import '../lines_icons.dart';
import '../mode_icons.dart';
import 'timer_block.dart';

class Schedules_List extends StatelessWidget {
	final List schedules;
  final String modes;

	const Schedules_List({
		required this.schedules,
		required this.modes,
		super.key,
	});

	@override
	Widget build(BuildContext context) => ListView(
    children: [
      if (schedules.length < 1)
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
        for (var line in schedules)
          if (modes.contains(line['mode']))
            Container(
              margin: EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: HexColor.fromHex(line['color']).withOpacity(0.2), // Color.fromARGB(255, 230, 230, 230), // 
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:  HexColor.fromHex(line['color']),
                    ),
                    child: Row(
                      children: [
                        ModeIcones(
                          line: line,
                          i: 0,
                          size: 30,
                          isDark: line['text_color'] == "000000",
                        ),
                        LinesIcones(
                          line: line,
                          size: 30
                        ),
                        Container(
                          width: 10,
                        ),
                        if (line['code'] != line['name'])
                          Expanded(
                            child: Text(
                              line['name'],
                              style: TextStyle(
                                color:  HexColor.fromHex(line['text_color']),
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Segoe Ui'
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
                        for (var terminus in line['terminus_schedules'])
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top:5.0,bottom:5.0),
                                child: Text('➜ ' + terminus['name'], 
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Segoe Ui',
                                    color: Theme.of(context).colorScheme.secondary,
                                  )
                                ),
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (terminus['schedules'].length > 0)
                                      for (var departure in terminus['schedules'].sublist(0, terminus['schedules'].length > 5 ? 5 : terminus['schedules'].length))
                                      TimerBlock(
                                          time: departure['departure_date_time'],
                                          state: departure['state'],
                                        )
                                    else
                                    Container(
                                      padding: EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:5.0),
                                      margin: EdgeInsets.only(left:0.0, top:5.0,right:10.0,bottom:5.0),
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
                                          SvgPicture.asset('assets/cancel.svg',
                                              color: Color(0xffa9a9a9),
                                              height: 15
                                            ),
                                          const Text(
                                          'Aucune information',
                                          style: TextStyle(
                                            color: Color(0xffa9a9a9),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Segoe Ui'
                                          ),
                                        ),
                                        ],
                                      )
                                    )
                                  ],
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
                      color:  HexColor.fromHex(line['color']),
                    )
                  )
                ]
              ),
            )
    ],
  );
}