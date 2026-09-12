// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/widgets/departures/block.dart';
import 'package:navika/src/widgets/departures/cascade.dart';

List formatUngroupedDepartures(schedules) {
  List departures = [];

  for (var schedulesLine in schedules) {
    Map line = {...schedulesLine};
    line.remove('departures');

    if (line['mode'] == 'rail') {
      for (var scheduleDepartures in schedulesLine['departures']) {
        Map departure = scheduleDepartures;
        departure['informations']['line'] = line;
        departures.add(departure);
      }
    }
  }

  departures.sort((a, b) {
    DateTime departureA =
        a['stop_date_time']['departure_date_time'] == '' ? DateTime.parse(a['stop_date_time']['arrival_date_time']) : DateTime.parse(a['stop_date_time']['departure_date_time']);
    DateTime departureB =
        b['stop_date_time']['departure_date_time'] == '' ? DateTime.parse(b['stop_date_time']['arrival_date_time']) : DateTime.parse(b['stop_date_time']['departure_date_time']);
    return departureA.compareTo(departureB);
  });

  return departures;
}

class DeparturesList extends StatelessWidget {
  final List schedules;
  final String id;
  final String mode;
  final ScrollController scrollController;
  final Function update;
  final bool ungroupDepartures;

  const DeparturesList({
    required this.schedules,
    required this.id,
    required this.mode,
    required this.scrollController,
    required this.update,
    required this.ungroupDepartures,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: scrollController,
        children: [
          if (ungroupDepartures)
            DeparturesCascade(
              departures: formatUngroupedDepartures(schedules).take(30).toList(),
              id: id,
              update: update,
            )
          else
            for (var line in schedules)
              if (mode.contains(line['mode']))
                DeparturesBlock(
                  line: line,
                  id: id,
                  update: update,
                )
        ],
      );
}
