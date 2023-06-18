import 'package:flutter/material.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/lines.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';


class TraficBlock extends StatelessWidget {
  final String name;
  final List trafic;

  const TraficBlock({
    required this.name,
    required this.trafic,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 3.0,
                color: getSlug(
                    getTraficLines(LINES.getLines(name).id)['severity']),
              ),
            ),
            child: InkWell(
              child: Image(image: AssetImage( getIconLine(context, LINES.getLines(name)) )),
              onTap: () {
                RouteStateScope.of(context).go('/trafic/$name');
              },
            ),
          ),
          Positioned(
            width: 20,
            height: 20,
            top: 33,
            left: 33,
            child: Image(
                image: getSlugImage(
                    getTraficLines(LINES.getLines(name).id)['severity'])),
          )
        ],
      );
}
