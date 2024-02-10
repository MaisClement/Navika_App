import 'package:flutter/material.dart';
import 'package:navika/src/utils.dart';

class ModeIcones extends StatelessWidget {
  final Map line;
  final int i;
  final Brightness? brightness;
  final double size;

  const ModeIcones({
    required this.line,
    required this.i,
    this.brightness,
    this.size = 20,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          if (line['id'] == 'SNCF' || line['id'] == 'TER' || line['code'] == 'SNCF' || line['code'] == 'TER')
            const Text('')
          else
            Container(
              width: size,
              height: size,
              margin: i == 0
                  ? const EdgeInsets.only(left: 5.0, top: 5.0, right: 0.0, bottom: 5.0)
                  : const EdgeInsets.only(left: 20.0, top: 5.0, right: 0.0, bottom: 5.0),
              child: Image(
                  image: AssetImage(getModeImage(brightness ?? Theme.of(context).colorScheme.brightness, line),
                ),
              ),
            )
        ],
      );
}
