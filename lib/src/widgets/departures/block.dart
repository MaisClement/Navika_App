import 'package:flutter/material.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/departures/lines.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';
import 'package:navika/src/widgets/utils/button_large_trafic.dart';

class DeparturesBlock extends StatelessWidget {
  final Map line;
  final String id;
  final String name;
  final Function update;
  final bool limited;

  const DeparturesBlock({
    required this.line,
    required this.id,
    required this.name,
    required this.update,
    this.limited = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: schedulesBack(context, HexColor.fromHex(line['color'])),
        ),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: schedulesBack(context, HexColor.fromHex(line['color'])),
            ),
            child: InkWell(
              onTap: () {
                RouteStateScope.of(context).go('/routes/details/${line['id']}');
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                child: Row(
                  children: [
                    ModeIcones(
                      line: line,
                      i: 0,
                      size: 30,
                      brightness: Theme.of(context).colorScheme.brightness,
                    ),
                    LinesIcones(line: line, size: 30),
                    SizedBox(
                      width: 10,
                    ),
              
                    if ( LINES.getLines(line) != null )
                      Text( LINES.getLines(line)!['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          color: accentColor(context),
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      )
                  ],
                ),
              ),
            ),
          ),

          if (!limited && line['severity'] != null && line['severity'] > 0)
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(7),
              ),
              margin: const EdgeInsets.only(
                top: 10, left: 5, right: 5
              ),
              child: ButtonLargeTrafic(
                line: line,
                borderRadius: BorderRadius.circular(7),
                onTap: () {
                  globals.lineTrafic = line;
                  RouteStateScope.of(context).go('/trafic/details');
                },
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
                    RouteStateScope.of(context).go('/schedules/stops/$id/departures/${line['id']}');
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
