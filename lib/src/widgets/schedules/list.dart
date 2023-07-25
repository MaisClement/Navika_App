import 'package:flutter/material.dart';

import 'package:navika/src/widgets/schedules/block.dart';

class SchedulesList extends StatelessWidget {
  final List schedules;
  final String modes;
  final ScrollController scrollController;
  final Function update;

  const SchedulesList({
    required this.schedules,
    required this.modes,
    required this.scrollController,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: scrollController,
        children: [
          if (schedules.isEmpty)
            const LinearProgressIndicator()
          else
            for (var line in schedules)
              if (modes.contains(line['mode']))
                SchedulesBlock(
                  line: line,
                  update: update,
                ),
        ],
      );
}
