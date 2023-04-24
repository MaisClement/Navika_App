import 'package:flutter/material.dart';

import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';
import 'package:navika/src/widgets/schedules/lines.dart';

class SchedulesBlock extends StatelessWidget {
  final Map line;
  final Function update;

  const SchedulesBlock({
    required this.line,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: HexColor.fromHex(line['color']).withOpacity(0.1), // Color.fromARGB(255, 230, 230, 230), //
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: schedulesBlock(context, HexColor.fromHex(line['color'])),
                boxShadow: [
                  BoxShadow(
                    color: accentColor(context).withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ModeIcones(
                    line: line,
                    i: 0,
                    size: 30,
                    isDark: schedulesIsDark(context, line['text_color']),
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
                            color: schedulesText( context, HexColor.fromHex(line['text_color']) ),
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Segoe Ui'),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                ],
              ),
            ),
            SchedulesLines(line: line, update: update),
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
