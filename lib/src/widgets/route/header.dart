import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/route/lines.dart';

class RoutePannel extends StatelessWidget {
  final Map journey;

  const RoutePannel({
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
          color: routeBhColor(context),
        ),
        child: Column(
          children: [
            Container(
              height: 15,
            ),
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 15,
            ),
            Container(
            decoration: BoxDecoration(
              color: routeBhColor(context),
            ),
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Row(
              children: [
                RouteLines(
                  sections: journey['sections'],
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 5, right: 10),
                  color: routeBhColor(context),
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
