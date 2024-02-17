// ignore_for_file: constant_identifier_names, non_constant_identifier_names

library my_prj.app;
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future getAppInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  
  NAME = packageInfo.appName;
  PACKAGE_NAME = packageInfo.packageName;
  VERSION = packageInfo.version;
  BUILD_NUMBER = packageInfo.buildNumber;
  BUILD_SIGNATURE = packageInfo.buildSignature;

  if(kDebugMode) {
    API_BASE = 'http://code.hackernwar.com:8000';
  } else {
    API_BASE = 'https://navika.hackernwar.com';
  }

  API_INDEX =                            '$API_BASE/index';
  API_TRAFIC =                           '$API_BASE/trafic';
  API_PLACES =                           '$API_BASE/places';
  API_NEAR =                             '$API_BASE/near';
  API_ADDRESS =                          '$API_BASE/address';
  API_STOPS =                            '$API_BASE/stops';
  API_SCHEDULES =                        '$API_BASE/schedules';
  API_LINES =                            '$API_BASE/lines';
  API_BIKE_STATIONS =                    '$API_BASE/bikes';
  API_JOURNEY =                          '$API_BASE/journey';
  API_JOURNEYS =                         '$API_BASE/journeys';
  API_VEHICLE_JOURNEY =                  '$API_BASE/vehicle_journey';
  API_MAPS =                             '$API_BASE/maps';
  API_ADD_NOTIFICATION_SUBSCRIPTION =    '$API_BASE/notification/subscribe';
  API_RENEW_NOTIFICATION =               '$API_BASE/notification/renew';
  API_GET_NOTIFICATION_SUBSCRIPTION =    '$API_BASE/notification/get';
  API_REMOVE_NOTIFICATION_SUBSCRIPTION = '$API_BASE/notification/unsubscribe';
  API_CHANGES =                          '$API_BASE/CHANGES_$VERSION.md';
}

String NAME = '';
String PACKAGE_NAME = '';
String VERSION = '';
String BUILD_NUMBER = '';
String BUILD_SIGNATURE = '';

// ---

const String GLITCH_URL = 'https://69ff476ec3614a5dba8fc1d579c816c6@glitch.hackernwar.com/2';

String API_BASE = 'https://navika.hackernwar.com';
String API_INDEX =                            '';
String API_TRAFIC =                           '';
String API_PLACES =                           '';
String API_NEAR =                             '';
String API_ADDRESS =                          '';
String API_STOPS =                            '';
String API_SCHEDULES =                        '';
String API_LINES =                            '';
String API_BIKE_STATIONS =                    '';
String API_JOURNEY =                          '';
String API_JOURNEYS =                         '';
String API_VEHICLE_JOURNEY =                  '';
String API_MAPS =                             '';
String API_ADD_NOTIFICATION_SUBSCRIPTION =    '';
String API_RENEW_NOTIFICATION =               '';
String API_GET_NOTIFICATION_SUBSCRIPTION =    '';
String API_REMOVE_NOTIFICATION_SUBSCRIPTION = '';
String API_CHANGES =                          '';