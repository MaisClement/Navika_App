import 'package:flutter/material.dart';
import 'package:navika/src/widgets/trafic/block.dart';

class HomeWidgetTrafic extends StatelessWidget {
  final List lines;
  final List trafic;

  const HomeWidgetTrafic({
    required this.lines,
    required this.trafic,
    super.key,
  });
  

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
    child: Wrap(
      children: [
        for (var line in lines)
          TraficBlock(
            line: line,
            trafic: trafic,
            isLoading: trafic.isEmpty,
          ),
      ],
    ),
  );
}
