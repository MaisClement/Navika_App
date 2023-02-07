import 'package:flutter/material.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/widgets/departures/time_block.dart';

class TripBlock extends StatelessWidget {
  final Map stopTime;

  const TripBlock({
    required this.stopTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    getTime(stopTime['stop_time']['departure_time']),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Segoe Ui',
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            ),
            Container(
              height: 50,
              width: 10,
              color: Theme.of(context).colorScheme.primary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Text(
                    stopTime['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Segoe Ui',
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
