// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';
import 'package:navika/src/widgets/schedules/lines.dart';
import 'package:navika/src/widgets/utils/button_large_trafic.dart';

class SchedulesBlock extends StatelessWidget {
  final Map line;
  final String id;
  final Function update;
  final bool limited;

  const SchedulesBlock({
    required this.line,
    required this.id,
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
                    LinesIcones(
                      line: line,
                      size: 30,
                    ),
                    Container(
                      width: 10,
                    ),
                    if (line['code'] != line['name'])
                      Expanded(
                        child: Text(
                          line['name'],
                          style: TextStyle(
                              color: accentColor(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: fontFamily),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                        ),
                      ),
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
            
          SchedulesLines(line: line, id: id, update: update),
          Container(
            height: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: HexColor.fromHex(line['color']),
            ),
          ),
        ],
      ),
    );
}
