import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/utils.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/departures/lines.dart';
import 'package:navika/src/widgets/error_message.dart';

class DepartureDetails extends StatefulWidget {
  final String id;
  final String stopLine;

  const DepartureDetails({required this.id, required this.stopLine, super.key});

  @override
  State<DepartureDetails> createState() => _DepartureDetailsState();
}

class _DepartureDetailsState extends State<DepartureDetails> with SingleTickerProviderStateMixin {

  ApiStatus error = ApiStatus.ok;
  late Timer _timer;
  Map departure = globals.departure;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getSchedules(widget.id, false);

    if (mounted) {
      setState(() {
        error = result['status'];
      });
      
      if (result['value']?['departures'] != null) {
        for (var i = 0; i < result['value']?['departures'].length; i++) {
          if (result['value']?['departures'][i]['id'] == widget.stopLine) {
            setState(() {
              departure = result['value']?['departures'][i];
            });
            break;
          }
        }
      }
    }
  }

  void update() {
    if (mounted) {
      setState(() {
        departure = departure;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: getNavigationBar(context),
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(globals.schedulesStopName, style: appBarTitle),
              if (LINES.getLinesById(departure['id']).libelle != '')
                Text(LINES.getLinesById(departure['id']).libelle,
                    style: appBarSubtitle),
            ],
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          child: ListView(
            shrinkWrap: true,
            children: [
              if (error != ApiStatus.ok)
                ErrorMessage(
                  error: error,
                ),
              if (departure['departures'].isEmpty)
                Row(
                  children: [
                    SvgPicture.asset('assets/img/cancel.svg',
                        color: accentColor(context), height: 18),
                    Text(
                      'Aucune information',
                      style: TextStyle(
                          color: accentColor(context),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Segoe Ui'),
                    ),
                  ],
                )
              else
                for (var train in clearTrain(departure['departures']))
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5.0, top: 0.0, right: 5.0, bottom: 0.0),
                    child: DepartureLines(
                      train: train,
                      color: departureListNoColor(context),
                      update: update,
                      from: widget.id,
                    ),
                  )
            ],
          ),
        ),
      );
}
