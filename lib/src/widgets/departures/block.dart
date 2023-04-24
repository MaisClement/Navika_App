import 'package:flutter/material.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/departures/lines.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

class DeparturesBlock extends StatelessWidget {
  final Map line;
  final String id;
  final String name;
  final List modes;
  final Function update;
  final bool limited;

  const DeparturesBlock({
    required this.line,
    required this.id,
    required this.name,
    required this.modes,
    required this.update,
    this.limited = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: schedulesBack(context, HexColor.fromHex(line['color'])),
        ),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: schedulesBlock(
                    context, HexColor.fromHex(line['color'])),
                boxShadow: [
                  BoxShadow(
                    color: accentColor(context).withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ]),
            child: InkWell(
              onTap: () {
                globals.schedulesStopArea = id;
                globals.schedulesStopName = name;
                globals.schedulesStopModes = modes;
                globals.schedulesStopLines = [];
                globals.departure = line;
                RouteStateScope.of(context)
                    .go('/schedules/stops/$id/departures/${line['id']}');
              },
              child: Row(
                children: [
                  ModeIcones(
                    line: line,
                    i: 0,
                    size: 30,
                    isDark: schedulesIsDark(context, line['text_color']),
                  ),
                  LinesIcones(line: line, size: 30),
                  Container(
                    width: 10,
                  ),

                  Text( LINES.getLinesById(line['id']).libelle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: schedulesText(
                          context, HexColor.fromHex(line['text_color'])),
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
            margin: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (clearTrain(line['departures']).isEmpty)
                  voidData(context)
                else
                  for (var train in clearTrain(line['departures']).sublist(0, getMaxLength(limited ? 2 : 5, clearTrain(line['departures']))))
                    DepartureLines(
                      train: train,
                      color: departureList(
                        context, HexColor.fromHex(line['color'])
                      ),
                      update: update,
                      from: id,
                    ),
              ],
            ),
          ),
          if (!limited)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor.fromHex(line['color']),
                    foregroundColor: HexColor.fromHex(line['text_color']),
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  child: const Text('Voir le reste ➜'),
                  onPressed: () {
                    globals.departure = line;
                    RouteStateScope.of(context).go('/schedules/stops/${globals.schedulesStopArea}/departures/${line['id']}');
                  },
                ),
              ],
            ),
          Container(
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: HexColor.fromHex(line['color']),
              ))
        ]),
      );
}
