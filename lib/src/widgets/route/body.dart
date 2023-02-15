import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/route/lines.dart';
import 'package:navika/src/widgets/route/listbutton.dart';

class RouteBody extends StatelessWidget {
  final ScrollController scrollController;
  final Map journey;

  const RouteBody({
    required this.scrollController,
    required this.journey,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView(
        controller: scrollController,
        padding: const EdgeInsets.only(top: 30),
        children: [
// Messages de l'index

          Container(
            decoration: BoxDecoration(
              color: RouteBhColor(context),
            ),
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Row(
              children: [
                RouteLines(
                  sections: journey['sections'],
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 5, right: 10),
                  color: RouteBhColor(context),
                  child: Row(
                    children: getDurationWidget(journey['duration'], context),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
