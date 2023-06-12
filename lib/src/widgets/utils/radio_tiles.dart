import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';

class RadioTiles extends StatelessWidget {
  final List tiles;
  final Function(String) onTileChange;
  final String? value;

  const RadioTiles({
    required this.tiles,
    required this.onTileChange,
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var tile in tiles)
              Container(
                width: MediaQuery.of(context).size.width / (tiles.length +1),
                height: 90,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      onTileChange(tile['value']);
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: tile['value'] == value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 10,
                          ),
                          Icon(
                            tile['icon'],
                            color: tile['value'] == value
                                ? traficBlockColor(context)
                                : accentColor(context),
                            size: 30,
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            tile['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: tile['value'] == value
                                  ? traficBlockColor(context)
                                  : accentColor(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      );
}
