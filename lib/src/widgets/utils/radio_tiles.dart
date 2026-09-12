// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/style.dart';

class RadioTiles extends StatelessWidget {
  final List tiles;
  final Function(dynamic) onTileChange;
  final dynamic value;

  const RadioTiles({
    required this.tiles,
    required this.onTileChange,
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var tile in tiles)
              SizedBox(
                width: MediaQuery.of(context).size.width / (tiles.length + 1),
                height: tile['name'] != null ? 90 : 52,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: tile['name'] != null ? 90 : 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: tile['value'] == value ? mainColor(context) : Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      onTileChange(tile['value']);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 10,
                        ),
                        Icon(
                          tile['icon'],
                          color: getRadioTilesTextColor(context, tile['value'] == value),
                          size: 30,
                        ),
                        Container(
                          height: 10,
                        ),
                        if (tile['name'] != null)
                          Text(
                            tile['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: getRadioTilesTextColor(context, tile['value'] == value),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      );
}
