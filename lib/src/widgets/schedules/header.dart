import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../routing.dart';
import '../../data/global.dart' as globals;

class SchedulesPannel extends StatelessWidget {
  final void Function()? tooglePanel;

	const SchedulesPannel({
    required this.tooglePanel,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
    ),
    child: Column(
      children: [
        Container(
          height: 20,
        ),
        GestureDetector(
          onTap: tooglePanel,
          child: Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        Container(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(globals.schedulesStopName, 
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Segoe Ui',
              color: Theme.of(context).colorScheme.secondary,
            )
          ),
        ),
      ],
    ),
  );
}