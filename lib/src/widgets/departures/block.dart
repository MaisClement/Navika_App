import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/departures/list.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

List clearTrain(List departures) {
  bool hide = globals.hiveBox?.get('hideTerminusTrain') ?? false;

  if (hide){
    List list = [];
    for (var departure in departures){
      if (departure['informations']['message'] != 'terminus'){
        list.add(departure);
      }
    }
    return list;
  } 

  return departures;
}

class DepartureBlock extends StatelessWidget {
	final List departures;
  final ScrollController scrollController;
  final Function update;

	const DepartureBlock({
		required this.departures,
    required this.scrollController,
    required this.update,
		super.key,
	});

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
                color: accentColor(context),
                fontWeight: FontWeight.w700
              ),
            ),
          ]
        )
      else
        for (var departure in departures)
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
                    color: schedulesBlock(context, HexColor.fromHex(departure['color'])),
                    boxShadow: [
                      BoxShadow(
                        color: accentColor(context).withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      )
                    ]
                  ),
                  child: InkWell(
                    onTap: () {
                      globals.departure = departure;
                      RouteStateScope.of(context).go('/schedules/stops/${globals.schedulesStopArea}/departures/${departure['id']}');
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
                                color: accentColor(context),
                                height: 18
                              ),
                            Text('Aucune information',
                              style: TextStyle(
                                color: accentColor(context),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Segoe Ui'
                              ),
                            ),
                          ],
                        )
                      else
                        for (var train in clearTrain( departure['departures'] ).sublist(0, clearTrain( departure['departures'] ).length > 5 ? 5 : clearTrain( departure['departures'] ).length))
                          DepartureList(
                            train: train,
                            color: HexColor.fromHex(departure['color']),
                            update: update,
                          ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor.fromHex(departure['color']),
                              foregroundColor: HexColor.fromHex(departure['text_color']),
                            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                            child: const Text('Voir le reste ➜'),
                            onPressed: () {
                              globals.departure = departure;
                              RouteStateScope.of(context).go('/schedules/stops/${globals.schedulesStopArea}/departures/${departure['id']}');
                            },
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