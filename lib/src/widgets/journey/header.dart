// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/journey/lines.dart';

class RoutePanel extends StatelessWidget {
  final Map journey;

  const RoutePanel({
    required this.journey,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Row(
                children: [
                  RouteLines(
                    sections: filterSection(journey['sections']),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 5, right: 10),
                    child: Row(
                      children: getDurationWidget(journey['duration'], context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
