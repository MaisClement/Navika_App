import 'package:flutter/material.dart';
import 'package:navika/src/screens/trip_details.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/departures/time_block.dart';

class TripBlock extends StatelessWidget {
  final Map stopTime;
  final TripBlockStatus status;

  const TripBlock({
    required this.stopTime,
    this.status = TripBlockStatus.active,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              getTime(stopTime['stop_time']['arrival_time']),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Segoe Ui',
                fontSize: 17,
                color: status == TripBlockStatus.inactive
                    ? const Color(0xff808080)
                    : accentColor(context),
              ),
            ),
          )
        ],
      ),
      if (stopTime['type'] == 'origin')
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 30,
          width: 10,
          decoration: BoxDecoration(
            color: status != TripBlockStatus.inactive
                ? Theme.of(context).colorScheme.primary
                : const Color(0xff808080),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(7),
              topRight: Radius.circular(7),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(
                top: 1, bottom: 21, left: 1, right: 1),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        )
      else if (stopTime['type'] == 'terminus')
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 30,
          width: 10,
          decoration: BoxDecoration(
            color: status != TripBlockStatus.inactive
                ? Theme.of(context).colorScheme.primary
                : const Color(0xff808080),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(7),
              bottomRight: Radius.circular(7),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(
                top: 21, bottom: 1, left: 1, right: 1),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        )
      else if (status == TripBlockStatus.origin)
        Container(
          height: 50,
          width: 10,
          color: const Color(0xff808080),
          child: Container(
            margin: const EdgeInsets.only(top: 21, bottom: 0),
            width: 29,
            height: 10,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                  top: 1, bottom: 20, left: 1, right: 1),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
        )
      else if (status == TripBlockStatus.terminus)
        Container(
          height: 50,
          width: 10,
          color: status == TripBlockStatus.active
              ? Theme.of(context).colorScheme.primary
              : const Color(0xff808080),
          child: Container(
            margin: const EdgeInsets.only(
                top: 21, bottom: 21, left: 1, right: 1),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        )
      else
        Container(
          height: 50,
          width: 10,
          color: status == TripBlockStatus.active
              ? Theme.of(context).colorScheme.primary
              : const Color(0xff808080),
          child: Container(
            margin: const EdgeInsets.only(
                top: 21, bottom: 21, left: 1, right: 1),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Text(
              stopTime['name'],
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Segoe Ui',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
