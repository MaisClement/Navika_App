// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/departures/train.dart';

class DeparturesCascade extends StatelessWidget {
  final List departures;
  final String id;
  final Function update;

  const DeparturesCascade({
    required this.departures,
    required this.id,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            for (var departure in clearTrain(departures))
              DepartureTrain(
                train: departure, 
                color: departure['informations']['line']['color'], 
                update: update, 
                from: id
              )
          ]
        ),
      );
}
