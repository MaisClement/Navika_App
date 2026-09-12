// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/widgets/schedules/block.dart';

class SchedulesList extends StatelessWidget {
  final List schedules;
  final String id;
  final String mode;
  final ScrollController scrollController;
  final Function update;

  const SchedulesList({
    required this.schedules,
    required this.id,
    required this.mode,
    required this.scrollController,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: scrollController,
        children: [
          for (var line in schedules)
            if (mode.contains(line['mode']))
              SchedulesBlock(
                line: line,
                id: id,
                update: update,
              ),
          ],
      );
}
