library my_prj.globals;
import 'package:location/location.dart' as gps;

const double VERSION = 0.1;
const String API_VERSION = 'v0.1';

const String API_BASE = 'https://navika.hackernwar.com/';

const String API_INDEX =     '$API_BASE$API_VERSION/index';
const String API_TRAFIC =     '$API_BASE$API_VERSION/trafic';
const String API_PLACES =     '$API_BASE$API_VERSION/places';
const String API_POINTS =     '$API_BASE$API_VERSION/points';
const String API_SCHEDULES =  '$API_BASE$API_VERSION/schedules';

gps.LocationData? locationData;
double compassHeading = 0;
bool isSetLocation = false;

String stopArea = '';
String stopName = '';

List trafic = [];

//

var hiveBox;