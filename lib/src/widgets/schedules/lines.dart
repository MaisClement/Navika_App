import 'package:flutter/material.dart';

import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/schedules/timer_block.dart';

class SchedulesLines extends StatelessWidget {
  final Map line;
  final Function update;

  const SchedulesLines({
    required this.line,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (line['terminus_schedules'].isEmpty)
              voidData(context)
            else
              for (var terminus in line['terminus_schedules'])
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '➜ ${terminus["name"]}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Segoe Ui',
                                color: accentColor(context),
                              ),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (terminus['schedules'].length > 0)
                          for (var departure in terminus['schedules'].sublist(0, getMaxLength(5, terminus['schedules'])))
                            TimerBlock(
                              time: departure['departure_date_time'],
                              state: departure['state'],
                              update: update,
                            )
                        else
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: voidData(context),
                          )
                      ],
                    ),
                  ],
                )
          ],
        ),
      );
}
