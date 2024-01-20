import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/icons/icons.dart';

class MapIcone extends StatelessWidget {
  final Map stop;
  final MarkerSize size;
  final double zoom;
  final Function update;

  const MapIcone({
    required this.stop,
    required this.size,
    required this.zoom,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          color: getMapWidgetColor(context),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 2,
              bottom: 2,
            ),
            child: Row(
              children: [
                Wrap( 
                  children: [
                    for (var i = 0; i < stop['lines'].length; i++)
            
                      if (getMarkerSize(getMarkerModeByMode(stop['lines'][i]['mode']), zoom) == MarkerSize.large)
                        Icones(
                          line: stop['lines'][i],
                          prevLine: i > 0 ? stop['lines'][i - 1] : stop['lines'][i],
                          i: i,
                          isDark: Brightness.dark == Theme.of(context).colorScheme.brightness
                        )
                    
                  ]
                )
              ],
            ),
          )
        );
}
