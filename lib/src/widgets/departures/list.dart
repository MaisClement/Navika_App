import 'package:flutter/material.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/departures/block.dart';
import 'package:navika/src/widgets/departures/cascade.dart';

class DeparturesList extends StatelessWidget {
  final List departures;
  final String id;
  final String name;
  final List modes;
  final ScrollController scrollController;
  final Function update;
  final bool ungroupDepartures;

  const DeparturesList({
    required this.departures,
    required this.id,
    required this.name,
    required this.modes,
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
          if (departures.isEmpty)
            LinearProgressIndicator()

          else if (ungroupDepartures)
            DeparturesCascade(
              departures: departures,
              id: id,
              update: update
            )

          else
            for (var line in departures)
              if (modes.contains(line['mode']))
                DeparturesBlock(
                  line: line,
                  id: id,
                  name: name,
                  modes: modes,
                  update: update,
                )
          
        ],
      );
}
