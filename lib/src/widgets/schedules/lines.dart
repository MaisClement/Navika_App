// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/schedules/timer_block.dart';

class SchedulesLines extends StatelessWidget {
  final Map line;
  final String id;
  final Function update;

  const SchedulesLines({
    required this.line,
    required this.id,
    required this.update,
    super.key,
  });

  handleTapDetails(context, terminus) {
    globals.direction = terminus['name'];
    RouteStateScope.of(context).go('/routes/details/${line["id"]}/schedules/$id');
  }

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
                Container(
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: departureList(context, HexColor.fromHex(line['color'])),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(7),
                    onTap: () {
                      handleTapDetails(context, terminus);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '➜  ${terminus['name']}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: fontFamily,
                                color: accentColor(context),
                              ),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          for (var departure in terminus['schedules'].sublist(0, getMaxLength(2, terminus['schedules'])))
                            TimerBlock(
                              time: departure['departure_date_time'],
                              state: departure['state'],
                              update: update,
                              color: departureList(
                                  context, HexColor.fromHex(line['color'])),
                            )
                        ],
                      ),
                    ),
                  ),
                )
          ],
        ),
      );
}
