import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:getwidget/getwidget.dart';

import '../data.dart';
import '../routing.dart';
import '../widgets/fade_transition_page.dart';
import 'book_details.dart';
import 'trafic_details.dart';
import 'schedules_details.dart';
import 'scaffold.dart';

import '../data/state.dart';

class SchedulesDetailsScreen extends StatefulWidget {
	final String? navPos;

	const SchedulesDetailsScreen({
		this.navPos,
    super.key
  });

	@override
	State<SchedulesDetailsScreen> createState() => _SchedulesDetailsScreenState();
}

class _SchedulesDetailsScreenState extends State<SchedulesDetailsScreen> {
	final String title = 'Horaires';
  bool state = false;

  String stopArea = NAVSTATE.getNavById(0).stopArea;
  String stopName = NAVSTATE.getNavById(0).stopName;

	@override
	Widget build(BuildContext context) {
		if (stopArea == null && stopName == null) {
			return const Scaffold(
				body: Center(
					child: Text('Pas content'),
				),
			);
		}
    if (state == false){
      return Scaffold(
        appBar: AppBar(
          title: Text(stopName),
          centerTitle: true,
        ),
        body: Center(
          child: const GFLoader(),
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(stopName),
        centerTitle: true,
      ),
      body: Container()
    );
	}
}
