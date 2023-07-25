// ignore_for_file: constant_identifier_names

library my_prj.globals;
import 'package:location/location.dart' as gps;

const String NAME = 'Navika';
const String VERSION = '0.5';
const String API_VERSION = '0.3';

//const String API_BASE = 'https://navika.hackernwar.com/$API_VERSION';
const String API_BASE = 'http://code.hackernwar.com:8000';

const String API_INDEX =            '$API_BASE/index';
const String API_TRAFIC =           '$API_BASE/trafic';
const String API_PLACES =           '$API_BASE/places';
const String API_NEAR =             '$API_BASE/near';
const String API_STOPS =            '$API_BASE/stops';
const String API_SCHEDULES =        '$API_BASE/schedules';
const String API_LINES =            '$API_BASE/lines';
const String API_BIKE_STATIONS =    '$API_BASE/bike_station';
const String API_JOURNEYS =         '$API_BASE/journeys';
const String API_VEHICLE_JOURNEY =  '$API_BASE/vehicle_journey';

gps.LocationData? locationData;
double compassHeading = 0;
bool isSetLocation = false;

List path = [];

String schedulesStopArea = '';
String schedulesStopName = '';
List schedulesStopModes = [];
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

// ignore: prefer_typing_uninitialized_variables
var hiveBox;