import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/widgets/schedules/timer_block.dart';

import '../../extensions/hexcolor.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

import '../../routing.dart';
import '../../data/global.dart' as globals;

class FavoriteSchedules extends StatelessWidget {
  final String id;
  final String name;
  final List modes;
	final List schedules;
  final Function update;

	const FavoriteSchedules({
    required this.id,
    required this.name,
    required this.modes,
		required this.schedules,
		required this.update,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Column(
    children: [
      
      for (var line in schedules)
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: HexColor.fromHex(line['color']).withOpacity(0.1), // Color.fromARGB(255, 230, 230, 230), // 
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ]
                ),
                child: Row(
                  children: [
                    ModeIcones(
                      line: line,
                      i: 0,
                      size: 30,
                      isDark: true,
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
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Segoe Ui'
                          ),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
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
                    if (line['terminus_schedules'].isEmpty) 
                      Row(
                        children: [
                          SvgPicture.asset('assets/cancel.svg',
                              color: Theme.of(context).colorScheme.primary,
                              height: 18
                            ),
                          Text('Aucune information',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Segoe Ui'
                            ),
                          ),
                        ],
                      )
                    else
                      for (var terminus in line['terminus_schedules'])
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top:5.0,bottom:5.0),
                              child: Text('➜ ${terminus["name"]}', 
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Segoe Ui',
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (terminus['schedules'].length > 0)
                                  for (var departure in terminus['schedules'].sublist(0, terminus['schedules'].length > 5 ? 5 : terminus['schedules'].length))
                                  TimerBlock(
                                      time: departure['departure_date_time'],
                                      state: departure['state'],
                                      update: update,
                                    )
                                else
                                  Container(
                                    padding: const EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:5.0),
                                    margin: const EdgeInsets.only(left:0.0, top:5.0,right:10.0,bottom:5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: const Offset(0, 2),
                                        )
                                      ]
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/cancel.svg',
                                            color: const Color(0xffa9a9a9),
                                            height: 15
                                          ),
                                        const Text('Aucune information',
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
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            child: const Text('Tous les horaires ➜'),
            onPressed: () {
              globals.schedulesStopArea = id;
              globals.schedulesStopName = name;
              globals.schedulesStopModes = modes;
              RouteStateScope.of(context).go('/schedules/stops/${id}');
            },
          ),
        ),
      
    ],
  );
}