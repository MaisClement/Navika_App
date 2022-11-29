import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/widgets/departures/list.dart';
import 'package:navika/src/widgets/departures/message.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';
import 'package:http/http.dart' as http;

import '../data/global.dart' as globals;

class DepartureDetails extends StatefulWidget {
  final String? stopArea;
  final String? stopLine;

  const DepartureDetails({
    required this.stopArea,
    required this.stopLine,
    super.key
  });

  @override
  State<DepartureDetails> createState() => _DepartureDetailsState();
}

class _DepartureDetailsState extends State<DepartureDetails>
    with SingleTickerProviderStateMixin {

  late Timer _timer;
  Map departure = globals.schedulesDeparture;

  @override
	void initState() {
		super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _timer = Timer(const Duration(seconds: 30), () {
        _getDepature();
      });
    });
	}

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
	}

	@override
	void dispose() {
		super.dispose();
    _timer.cancel();
	}

  Future<void> _getDepature() async {
    print({'INFO_get', globals.schedulesStopArea});
    try {
      final response = await http.get(Uri.parse('${globals.API_SCHEDULES}?s=${globals.schedulesStopArea}'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (mounted) {
          setState(() {
            if (data['departures'] != null) {
              for(var i = 0; i < data['departures'].length; i++) {
                if (data['departures'][i]['id'] == widget.stopLine) {
                  departure = data['departures'][i];
                  break;
                }
              }
              
            }
          });
        }
      }

      _timer = Timer(const Duration(seconds: 30), () {
        _getDepature();
      });
    } on Exception catch (_) {
      print('catch');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(globals.schedulesStopName),
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
    ),
    body: Container(
      color: HexColor.fromHex(departure['color']).withOpacity(0.1),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ]
            ),
            child: Row(
              children: [
                ModeIcones(
                  line: departure,
                  i: 0,
                  size: 35,
                  isDark: true,
                ),
                LinesIcones(
                  line: departure,
                  size: 35
                ),
                Container(
                  width: 10,
                ),
                if (LINES.getLinesById(departure['id']).libelle != "")
                  Text(LINES.getLinesById(departure['id']).libelle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ) 
              ],
            ),
          ),

          if (departure['departures'].isEmpty) 
            Row(
              children: [
                SvgPicture.asset('assets/cancel.svg',
                    color: Theme.of(context).colorScheme.primary,
                    height: 18
                  ),
                Text('Aucune information',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Segoe Ui'
                  ),
                ),
              ],
            )
          else
            for (var train in departure['departures'])
              Container(
                margin: const EdgeInsets.only(left:5.0, top:0.0, right:5.0, bottom:0.0),
                child: DepartureList(
                  train: train,
                ),
              )
        ],
      ),
    ),
  );
}