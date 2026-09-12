// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/schedules/timer_block.dart';

formatDepartures(departures) {
  Map terminusDetails = {};
  Map departuresByTerminus = {};
  Map terminusByDirection = {};

  for (var departure in departures) {
    String terminus = departure['informations']['direction']['id'];

    if (departure['stop_date_time']['departure_date_time'] != '') {
      if (terminusDetails.containsKey(terminus)) {
        departuresByTerminus[terminus]?.add(departure);
      } else {
        terminusDetails[terminus] = departure['informations']['direction'];
        departuresByTerminus[terminus] = [departure];
      }
    }
  }

  for (var terminus in terminusDetails.keys) {
    var directionId = terminusDetails[terminus]['direction_id'];
    terminusByDirection[directionId] = terminus;
  }

  return [terminusDetails, departuresByTerminus, terminusByDirection];
}

class SchedulesLines extends StatefulWidget {
  final Map line;
  final String id;
  final Function update;

  const SchedulesLines({
    required this.line,
    required this.id,
    required this.update,
    super.key,
  });

  @override
  State<SchedulesLines> createState() => _SchedulesLinesState();
}

class _SchedulesLinesState extends State<SchedulesLines> {
  Map line = {};
  Map terminusDetails = {};
  Map departuresByTerminus = {};
  Map terminusByDirection = {};

  @override
  void initState() {
    super.initState();
    line = widget.line;
    List departures = line['departures'];
    List formattedSchedules = formatDepartures(departures);
    terminusDetails = formattedSchedules[0];
    departuresByTerminus = formattedSchedules[1];
    terminusByDirection = formattedSchedules[2];
  }

  handleTapDetails(context, terminus) {
    globals.direction = terminus['name'];

    // RouteStateScope.of(context).go('/stops/${widget.id}/${line["id"]}');

    //TODO if (RouteStateScope.of(context).route.pathTemplate == '/stops/:id') {
    //TODO   RouteStateScope.of(context).go('/stops/${widget.id}/${line["id"]}');
    //TODO } else {
    RouteStateScope.of(context).go('/routes/details/${line["id"]}/schedules/${widget.id}');
    //TODO }
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (departuresByTerminus.isEmpty)
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/img/cancel.svg', color: accentColor(context), height: 18),
                      SizedBox(width: 4),
                      Text(
                        AppLocalizations.of(context)!.no_next_departure,
                        style: TextStyle(color: accentColor(context), fontSize: 18, fontWeight: FontWeight.w800, fontFamily: fontFamily),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor.fromHex(line['color']),
                          foregroundColor: HexColor.fromHex(line['text_color']),
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        child: Text(AppLocalizations.of(context)!.see_schedules),
                        onPressed: () {
                          globals.departure = line;
                          RouteStateScope.of(context).go('/routes/details/${line["id"]}/schedules/${widget.id}');
                        },
                      ),
                    ],
                  ),
                ],
              )
            else
              for (var terminusId in departuresByTerminus.keys)
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
                      handleTapDetails(context, terminusDetails[terminusId]);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '➜  ${terminusDetails[terminusId]['name']}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                fontFamily: fontFamily,
                                color: accentColor(context),
                              ),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          for (var departure in departuresByTerminus[terminusId].sublist(0, getMaxLength(2, departuresByTerminus[terminusId])))
                            TimerBlock(
                              key: Key(departure['informations']['id']),
                              time: departure['stop_date_time']['departure_date_time'],
                              state: departure['stop_date_time']['state'],
                              update: widget.update,
                              color: departureList(context, HexColor.fromHex(line['color'])),
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
