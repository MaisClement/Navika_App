// ignore_for_file: constant_identifier_names

library my_prj.globals;
import 'package:location/location.dart' as gps;

const String NAME = 'Navika';
const String VERSION = 'v0.2-dev';
const String API_VERSION = 'v0.1';

const String API_BASE = 'https://navika.hackernwar.com/';

const String API_INDEX =            '$API_BASE$API_VERSION/index';
const String API_TRAFIC =           '$API_BASE$API_VERSION/trafic';
const String API_PLACES =           '$API_BASE$API_VERSION/places';
const String API_NEAR =             '$API_BASE$API_VERSION/near';
const String API_STOP_AREA =        '$API_BASE$API_VERSION/stop_area';
const String API_SCHEDULES =        '$API_BASE$API_VERSION/schedules';
const String API_BIKE_STATIONS =    '$API_BASE$API_VERSION/bike_station';
const String API_JOURNEYS =         '$API_BASE$API_VERSION/journeys';
const String API_VEHICLE_JOURNEY =  '$API_BASE$API_VERSION/vehicle_journey';

gps.LocationData? locationData;
double compassHeading = 0;
bool isSetLocation = false;

List path = [];

String schedulesStopArea = '';
String schedulesStopName = '';
List schedulesStopModes = [];
List schedulesStopLines = [];

Map journey = {};
Map departure = {};
List trafic = [];

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
  'dep' : _d,
  'arr' : _a
};

// ignore: prefer_typing_uninitialized_variables
var hiveBox;