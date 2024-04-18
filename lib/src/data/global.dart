// ignore_for_file: constant_identifier_names

library my_prj.globals;
import 'package:flutter/material.dart';
import 'package:location/location.dart' as gps;
import 'package:navika/src/controller/here_map_controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

String fcmToken = '';

gps.LocationData? locationData;
double compassHeading = 0;
bool isSetLocation = false;

List path = [];

String schedulesStopName = '';
List schedulesStopLines = [];

Map lineTrafic = {};
Map journey = {};
Map departure = {};
List trafic = [];

String pdfTitle = '';
String pdfUrl = '';

bool routePosUsed = false;

Map? index;

Map _d = {
    'id': null,
    'name': null
};
Map _a = {
    'id': null,
    'name': null
};
Map route = {
  'from' : _d,
  'to' : _a
};

bool isTimeNow = true;
DateTime selectedDate = DateTime.now();
TimeOfDay selectedTime = TimeOfDay.now();
String timeType = 'departure';
List forbiddenLines = [];
List journeys = [];

// for smoth transition
String? direction;

// for for query search
HereController? hereMapController;
PanelController? panelController;

String? query;

// ignore: prefer_typing_uninitialized_variables
var hiveBox;