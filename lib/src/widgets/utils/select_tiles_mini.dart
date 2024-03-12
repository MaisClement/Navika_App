import 'package:flutter/material.dart';
import 'package:navika/src/style.dart';

class MiniSelectTiles extends StatelessWidget {
  final List tiles;
  final Function(String, bool) onTileChange;
  final Map value;

  const MiniSelectTiles({
    required this.tiles,
    required this.onTileChange,
    required this.value,
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
                height: MediaQuery.of(context).size.width / (tiles.length + 1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: value[tile['value']]
                        ? mainColor(context)
                        : Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      onTileChange(tile['value'], !value[tile['value']]!);
                    },
                    child: Center(
                      child: Text(
                        tile['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: value[tile['value']]
                              ? Theme.of(context).colorScheme.surface
                              : accentColor(context),
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      );
}
