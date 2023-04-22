import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/widgets/departures/list.dart';
import 'package:navika/src/widgets/departures/block.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/error_message.dart';

class DepartureDetails extends StatefulWidget {
  final String id;
  final String stopLine;

  const DepartureDetails({
    required this.id,
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
  Map departure = globals.departure;

  @override
	void initState() {
		super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
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
      } else {
        setState(() {
          error = 'Récupération des informations impossible.';
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

          if (LINES.getLinesById(departure['id']).libelle != '')
            Text(LINES.getLinesById(departure['id']).libelle,
              style: appBarSubtitle
            ),
        ],
      ),
    ),
    body: Container(
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          
          if (error != '')
            ErrorMessage(
              error: error,
            ),
            
          if (departure['departures'].isEmpty) 
            Row(
              children: [
                SvgPicture.asset('assets/img/cancel.svg',
                    color: accentColor(context),
                    height: 18
                  ),
                Text('Aucune information',
                  style: TextStyle(
                    color: accentColor(context),
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
                  color: Color(0xff000000),
                  update: update,
                  from: widget.id,
                ),
              )
        ],
      ),
    ),
  );
}