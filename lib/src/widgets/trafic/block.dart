import 'package:flutter/material.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/lines.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/icons/lines.dart';

Map getTrafic(List trafic, String? name, Map? line) {
  String id = '';

  if (name != null) {
    id = LINES.getLines(name)!['id'];

  } else if (line!['id'] != null) {
    id = line['id'];

  }
  
  for (var el in trafic) {
    if (el['id'] == id) {
      return el;
    }
  }

  // Si on a rien
  if (name != null) {
    if (LINES.getLines(name) != null) {
      return getDefaultLine(LINES.getLines(name)!);
    }
  }
  
  return line!;
}

class TraficBlock extends StatelessWidget {
  final String? name;
  final Map? line;
  final List trafic;
  final bool isLoading;

  const TraficBlock({
    this.name,
    this.line,
    required this.trafic,
    this.isLoading = false,
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
                color: getSlug( getTrafic(trafic, name, line)['severity'] ?? 0),
              ),
            ),
            child: InkWell(
              child: LinesIcones(
                line: getTrafic(trafic, name, line),
                removeMargin: true,
                size: 30,
              ),
              onTap: () {
                globals.lineTrafic = getTrafic(trafic, name, line);
                RouteStateScope.of(context).go('/trafic/details');
              },
            ),
          ),
          Positioned(
            width: 20,
            height: 20,
            top: 33,
            left: 33,
            child: isLoading 
            ? const CircularProgressIndicator(
              strokeWidth: 3,
            )
            : Image(image: getSlugImage( getTrafic(trafic, name, line)['severity'] ?? 0 )),
          )
        ],
      );
}
