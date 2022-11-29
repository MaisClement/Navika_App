import 'package:flutter/material.dart';
import 'package:navika/src/widgets/schedules/body.dart';
import '../data/global.dart' as globals;

class SchedulesDetails extends StatelessWidget {
  final String? navPos;

  const SchedulesDetails({this.navPos, super.key});
            
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(globals.schedulesStopName),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
    ),
    body: SchedulesBody(
      scrollController: ScrollController()
    )
  );
}