import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/departures/block.dart';

import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/widgets/departures/list.dart';
import 'package:navika/src/data/global.dart' as globals;

class FavoriteDepartures extends StatelessWidget {
  final String id;
  final String name;
  final List modes;
	final List schedules;
  final Function update;

	const FavoriteDepartures({
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
      
      for (var departure in schedules)
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: HexColor.fromHex(departure['color']).withOpacity(0.1), // Color.fromARGB(255, 230, 230, 230), // 
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: schedulesBlock(context, HexColor.fromHex(departure['color'])),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ]
                ),
                child: InkWell(
                  onTap: () {
                    globals.schedulesStopArea = id;
                    globals.schedulesStopName = name;
                    globals.schedulesStopModes = modes;
                    globals.schedulesDeparture = departure;
                    RouteStateScope.of(context).go('/schedules/stops/$id/departures/${departure['id']}');
                  },
                  child: Row(
                    children: [
                      ModeIcones(
                        line: departure,
                        i: 0,
                        size: 30,
                        isDark: schedulesIsDark(context, departure['text_color']),
                      ),
                      LinesIcones(
                        line: departure,
                        size: 30
                      ),
                      Container(
                        width: 10,
                      ),
                      if (LINES.getLinesById(departure['id']).libelle != '')
                        Text(LINES.getLinesById(departure['id']).libelle,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Segoe Ui',
                            color: schedulesText(context, HexColor.fromHex(departure['text_color'])),
                          ),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                        ) 
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (clearTrain( departure['departures'] ).isEmpty) 
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
                      for (var train in clearTrain( departure['departures'] ).sublist(0, clearTrain( departure['departures'] ).length > 3 ? 3 : clearTrain( departure['departures'] ).length))
                        DepartureList(
                          train: train,
                          color: HexColor.fromHex(departure['color']),
                          update: update,
                        ),
                        
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
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundColor: const Color(0xffffffff),
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
            child: const Text('Tous les horaires ➜'),
            onPressed: () {
              globals.schedulesStopArea = id;
              globals.schedulesStopName = name;
              globals.schedulesStopModes = modes;
              RouteStateScope.of(context).go('/schedules/stops/$id');
            },
          ),
        ),
    ],
  );
}