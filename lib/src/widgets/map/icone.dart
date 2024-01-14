import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/icons/icons.dart';

class MapIcone extends StatelessWidget {
  final Map stop;
  final MarkerSize size;
  final Function update;

  const MapIcone({
    required this.stop,
    required this.size,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(
      left: 5,
      right: 5,
      top: 2,
      bottom: 2
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: getMapWidgetColor(context),
    ),
    child: Row(
      children: [
        Wrap( 
          children: [
            for (var i = 0; i < stop['lines'].length; i++)
            
              Icones(
                line: stop['lines'][i],
                prevLine: i > 0 ? stop['lines'][i - 1] : stop['lines'][i],
                i: i,
                isDark: Brightness.dark != Theme.of(context).colorScheme.brightness
              )
            
          ]
        )
      ],
    ),
  );
}
