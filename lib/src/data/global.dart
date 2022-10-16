library my_prj.globals;
import 'package:location/location.dart' as gps;
import 'package:flutter_compass/flutter_compass.dart';

const String VERSION = '0.1-dev';

const String API_BASE = 'https://navika.hackernwar.com/';
const String API_VERSION = 'v0.1';

const String API_TRAFIC = '$API_BASE$API_VERSION/trafic';
const String API_PLACES = '$API_BASE$API_VERSION/places';
const String API_PLACES_NEARBY = '$API_BASE$API_VERSION/places_nearby';
const String API_POINT_NEARBY = '$API_BASE$API_VERSION/point_nearby';
const String API_SCHEDULES = '$API_BASE$API_VERSION/schedules';

gps.LocationData? locationData;
double compassHeading = 0;
bool isSetLocation = false;

String stopArea = '';
String stopName = '';

List trafic = [];

//

var hiveBox;