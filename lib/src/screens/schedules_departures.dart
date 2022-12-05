import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/widgets/departures/list.dart';
import 'package:navika/src/widgets/departures/block.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../data/global.dart' as globals;
import '../style/style.dart';

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
 
  String error = '';
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
    if (kDebugMode) {
      print({'INFO_', globals.schedulesStopArea});
    }
    try {
      if (mounted) {
        final response = await http.get(Uri.parse('${globals.API_SCHEDULES}?s=${globals.schedulesStopArea}'));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          if (mounted) {
            if (data['departures'] != null) {
              for(var i = 0; i < data['departures'].length; i++) {
                if (data['departures'][i]['id'] == widget.stopLine) {
                  setState(() {
                  departure = data['departures'][i];
                  error = '';
                  });
                  break;
                }
              }
            }
          }
        }
      _timer = Timer(const Duration(seconds: 30), () {
        _getDepature();
      });
      } else {
        setState(() {
          error = "Récupération des informations impossible.";
        });
      }
    } catch (e) {
      setState(() {
        error = "Une erreur s'est produite.";
      });
    }
  }

  void update () {
    if (mounted) {
      setState(() {
        departure = departure;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(globals.schedulesStopName,
              style: appBarTitle
            ),

          if (LINES.getLinesById(departure['id']).libelle != "")
            Text(LINES.getLinesById(departure['id']).libelle,
              style: appBarSubtitle
            ),
        ],
      ),
    ),
    body: ListView(
      shrinkWrap: true,
      children: [
        if (error != '')
          Column(
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 15),
                  SvgPicture.asset(
                    'assets/cancel.svg',
                    color: Colors.grey[600],
                    height: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      error,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Segoe Ui',
                      ),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          )
        else if (departure['departures'].isEmpty) 
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
          for (var train in clearTrain(departure['departures']) )
            Container(
              margin: const EdgeInsets.only(left:5.0, top:0.0, right:5.0, bottom:0.0),
              child: DepartureList(
                train: train,
                update: update,
              ),
            )
      ],
    ),
  );
}