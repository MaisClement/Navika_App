// ignore_for_file: constant_identifier_names

library my_prj.globals;
import 'package:flutter/material.dart';
import 'package:location/location.dart' as gps;

// const String API_BASE = 'https://navika.hackernwar.com';
const String API_BASE = 'http://code.hackernwar.com:8000';
const String GLITCH = 'https://69ff476ec3614a5dba8fc1d579c816c6@glitch.hackernwar.com/2';

const String API_INDEX =                            '$API_BASE/index';
const String API_TRAFIC =                           '$API_BASE/trafic';
const String API_PLACES =                           '$API_BASE/places';
const String API_NEAR =                             '$API_BASE/near';
const String API_ADDRESS =                          '$API_BASE/address';
const String API_STOPS =                            '$API_BASE/stops';
const String API_SCHEDULES =                        '$API_BASE/schedules';
const String API_LINES =                            '$API_BASE/lines';
const String API_BIKE_STATIONS =                    '$API_BASE/bikes';
const String API_JOURNEY =                          '$API_BASE/journey';
const String API_JOURNEYS =                         '$API_BASE/journeys';
const String API_VEHICLE_JOURNEY =                  '$API_BASE/vehicle_journey';
const String API_MAPS =                             '$API_BASE/maps';
const String API_ADD_NOTIFICATION_SUBSCRIPTION =    '$API_BASE/notification/subscribe';
const String API_RENEW_NOTIFICATION =               '$API_BASE/notification/renew';
const String API_GET_NOTIFICATION_SUBSCRIPTION =    '$API_BASE/notification/get';
const String API_REMOVE_NOTIFICATION_SUBSCRIPTION = '$API_BASE/notification/unsubscribe';

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

// for smoth transition
String? direction;

// ignore: prefer_typing_uninitialized_variables
var hiveBox;