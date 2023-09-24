import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:here_sdk/core.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';
import 'package:navika/src/extensions/hexcolor.dart';

Map listModes = {
  'cable': [
    'cable',
  ],
  'train': [
    'physical_mode:RapidTransit',
    'physical_mode:Train',
    'physical_mode:RailShuttle',
    'physical_mode:LocalTrain',
    'physical_mode:LongDistanceTrain',
    'rail',
    'nationalrail'
  ],
  'metro': [
    'physical_mode:Metro',
    'physical_mode:RailShuttle',
    'metro',
    'funicular'
  ],
  'tram': ['physical_mode:Tramway', 'tram'],
  'bus': ['physical_mode:Bus', 'bus'],
};

const divider = Divider(
  color: Color(0xff808080),
  thickness: 1.5,
);

Widget voidData(context) {
  return Row(
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
  );
}

int getMaxLength(int max, List list) {
  if (list.length > max) {
    return max;
  }
  return list.length;
}

Map? getTraficLines(Info line) {
  for (var lines in globals.trafic) {
    if (lines['id'] == line.id) {
      return lines;
    }
  }
  return null;
}

Map getDefaultLine(Info line) {
  return {
    'id': line.id,
    'code': line.name,
    'name': line.libelle,
    'color': 'aaaaaa',
    'text_color': '000000',
  };
}

Map? getReports(String lineId) {
  return getTraficLines(LINES.getLines(lineId))?['reports'];
}

int? getSeverity(String lineId) {
  return getTraficLines(LINES.getLines(lineId))?['severity'];
}

String getModeImage(line, isDark) {
  if (LINES.isLineById(line['id'])) {
    if (isDark) {
      return LINES.getLinesById(line['id']).imageModeDark;
    }
    return LINES.getLinesById(line['id']).imageModeLight;
  }
  String img = 'assets/img/icons/';

  String mode = '';
  for (var allowes in listModes.entries) {
    if (allowes.value.contains(line['mode'])) {
      mode = '$mode${allowes.key}';
    }
  }
  if (mode == '') {
    img = '${img}bus';
  } else {
    img = '$img$mode';
  }

  if (isDark) {
    return '$img.png';
  }
  return '${img}_light.png';
}

Color getSlug(severity, [type]) {
  if (severity == 0 && (type == null || type == 0)) {
    return Colors.transparent;
  } else if (severity == 0 && type != null && type == 1) {
    return const Color(0xff008b5b);
  } else if (severity == 5) {
    return const Color(0xffeb2031);
  } else if (severity == 4) {
    return const Color(0xfff68f53);
  } else if (severity == 3) {
    return Colors.transparent;
  } else if (severity == 2) {
    return Colors.transparent;
  } else if (severity == 1) {
    return Colors.transparent;
  } else if (type != null && type == 1) {
    return const Color(0xff008b5b);
  } else {
    return Colors.transparent;
  }
}

Color getSlugColor(severity, [type]) {
  if (severity == 0 && (type == null || type == 0)) {
    return Colors.transparent;
  } else if (severity == 0 && type != null && type == 1) {
    return const Color(0xff008b5b);
  } else if (severity == 5) {
    return const Color(0xffeb2031);
  } else if (severity == 4) {
    return const Color(0xfff68f53);
  } else if (severity == 3) {
    return const Color(0xfff68f53);
  } else if (severity == 2) {
    return const Color(0xfff68f53);
  } else if (severity == 1) {
    return const Color(0xff005bbc);
  } else if (type != null && type == 1) {
    return const Color(0xff008b5b);
  } else {
    return Colors.transparent;
  }
}

AssetImage getSlugImage(severity, [type]) {
  if (severity == 0 && (type == null || type == 0)) {
    return const AssetImage('assets/img/null.png');
  } else if (severity == 0 && type != null && type == 1) {
    return const AssetImage('assets/img/modal/valid.png');
  } else if (severity == 5) {
    return const AssetImage('assets/img/modal/error.png');
  } else if (severity == 4) {
    return const AssetImage('assets/img/modal/warning.png');
  } else if (severity == 3) {
    return const AssetImage('assets/img/modal/work.png');
  } else if (severity == 2) {
    return const AssetImage('assets/img/modal/futur_work.png');
  } else if (severity == 1) {
    return const AssetImage('assets/img/modal/information.png');
  } else if (type != null && type == 1) {
    return const AssetImage('assets/img/modal/valid.png');
  } else {
    return const AssetImage('assets/img/null.png');
    // return const AssetImage('assets/img/modal/interogation_grey.png');
  }
}

String getSlugTitle(severity) {
  if (severity == 0) {
    return 'Trafic fluide';
  } else if (severity == 5) {
    return 'Trafic fortement perturbé';
  } else if (severity == 4) {
    return 'Trafic perturbé';
  } else if (severity == 3) {
    return 'Travaux';
  } else if (severity == 2) {
    return 'Travaux à venir';
  } else if (severity == 1) {
    return 'Information';
  } else {
    return 'Trafic fluide';
  }
}

String getSlugLongTitle(severity) {
  if (severity == 0) {
    return 'Trafic fluide';
  } else if (severity == 5) {
    return 'Le trafic est fortement perturbé';
  } else if (severity == 4) {
    return 'Le trafic est perturbé';
  } else if (severity == 3) {
    return 'Des travaux sont en cours';
  } else if (severity == 2) {
    return 'Des travaux sont à venir';
  } else if (severity == 1) {
    return 'Information';
  } else {
    return 'Rien à signaler';
  }
}

String getDateTime(String time) {
  DateTime dttime = DateTime.parse(time);

  String dtday = dttime.day < 10 ? '0${dttime.day}' : dttime.day.toString();
  String dtmonth =
      dttime.month < 10 ? '0${dttime.month}' : dttime.month.toString();
  String dtyear = dttime.year.toString();
  String dthour = dttime.hour < 10 ? '0${dttime.hour}' : dttime.hour.toString();
  String dtminute =
      dttime.minute < 10 ? '0${dttime.minute}' : dttime.minute.toString();

  return '$dtday/$dtmonth/$dtyear $dthour:$dtminute';
}

List clearTrain(List departures) {
  bool hide = globals.hiveBox?.get('hideTerminusTrain') ?? false;

  if (hide) {
    List list = [];
    for (var departure in departures) {
      if (departure['informations']['message'] != 'terminus') {
        list.add(departure);
      }
    }
    return list;
  }

  return departures;
}

// Schedules

int getTimeDifference(String time) {
  DateTime dttime = DateTime.parse(time);
  DateTime dtnow = DateTime.now();

  Duration diff = dttime.difference(dtnow);

  return diff.inMinutes;
}

String getTime(String time) {
  if (time == '') {
    return '';
  }

  DateTime dttime = DateTime.parse(time);

  var now = DateTime.now();
  var timezoneOffsetInMinutes = now.timeZoneOffset.inMinutes;
  dttime = dttime.add(Duration(minutes: timezoneOffsetInMinutes));

  String dthour = dttime.hour < 10 ? '0${dttime.hour}' : dttime.hour.toString();
  String dtminute = dttime.minute < 10 ? '0${dttime.minute}' : dttime.minute.toString();

  return '$dthour:$dtminute';
}

String makeTime(String time) {
  if (time == '') {
    return '';
  }
  return '${time.substring(0, 2)}:${time.substring(2, 4)}';
}

List getState(Map train) {
  String state = train['stop_date_time']['state'];

  List res = [];
  if (state == 'modified') {
    res.add('modified');
  }
  if (state != 'ontime' && state != 'theorical') {
    res.add(state);
  }
  if (getLate(train) > 0) {
    res.add('delayed');
  }
  //else {
  if (res.isEmpty) {
    res.add('ontime');
  }
  return res;
}

int getLate(Map train) {
  String departure = train['stop_date_time']['departure_date_time'];
  String expectedDeparture = train['stop_date_time']['base_departure_date_time'];

  if (departure == '' || expectedDeparture == '') {
    return 0;
  }
  DateTime dttime = DateTime.parse(departure);
  DateTime dtexpe = DateTime.parse(expectedDeparture);
  Duration diff = dttime.difference(dtexpe);
  return diff.inMinutes;
}

int getDelay(dateTime, baseDateTime) {
  String departure = dateTime;
  String expectedDeparture = baseDateTime;

  if (departure == '' || expectedDeparture == '') {
    return 0;
  }
  DateTime dttime = DateTime.parse(departure);
  DateTime dtexpe = DateTime.parse(expectedDeparture);
  Duration diff = dttime.difference(dtexpe);
  return diff.inMinutes;
}

Color getColorByState(state, context) {
  if (state.contains('cancelled')) {
    return const Color(0xffeb2031);
  } else if (state.contains('delayed') || state.contains('modified')) {
    return const Color(0xfff68f53);
  } else if (state.contains('ontime')) {
    return Colors.white.withOpacity(0);
  } else {
    return const Color(0xffa9a9a9);
  }
}

Color getSchedulesColorByState(state, context) {
  switch (state) {
    case 'cancelled':
      return const Color(0xffeb2031);
    case 'delayed':
      return const Color(0xfff68f53);
    case 'ontime':
      return accentColor(context);
    default:
      return const Color(0xffa9a9a9);
  }
}

Color getDeparturesColorByState(state, context) {
  if (state.contains('cancelled') ||
      state.contains('delayed') ||
      state.contains('modified') ||
      state.contains('ontime')) {
    return const Color(0xfffcc900);
  }

  return const Color(0xffa9a9a9);
}

Color getColorForDirectionByState(state, context) {
  if (state.contains('cancelled')) {
    return const Color(0xffeb2031);
  } else if (state.contains('cancelled')) {
    return const Color(0xffeb2031);
  } else if (state.contains('modified')) {
    return const Color(0xfff68f53);
  } else {
    return accentColor(context);
  }
}

Color getBackColorByState(state, context) {
  if (state.contains('cancelled')) {
    return const Color(0xffeb2031);
  } else if (state.contains('delayed') || state.contains('modified')) {
    return const Color(0xfff68f53);
  } else {
    return Colors.white.withOpacity(0);
  }
}

// Journeys

Color getColorByType(section) {
  if (section['type'] == 'street_network' || section['type'] == 'waiting') {
    return const Color(0xff7b7b7b);
  }
  if (section['informations'] != null &&
      section['informations']['line']['color'] != null) {
    return HexColor.fromHex(section['informations']['line']['color']);
  }
  return const Color(0xff202020);
}

double getLineWidthByType(String type) {
  if (type == 'public_transport') {
    return 20;
  }
  return 7;
}

double degTorad(double x) {
  return pi * x / 180;
}

double getDistance(double lat1, double lon1, double lat2, double lon2) {
  const double earthRadius = 6378137; // Terre = sphère de 6378km de rayon
  double rlo1 = degTorad(lon1); // CONVERSION
  double rla1 = degTorad(lat1);
  double rlo2 = degTorad(lon2);
  double rla2 = degTorad(lat2);
  double dlo = (rlo2 - rlo1) / 2;
  double dla = (rla2 - rla1) / 2;
  double a =
      (sin(dla) * sin(dla)) + sin(rla1) * cos(rla2) * (sin(dlo) * sin(dlo));
  double d = 2 * atan2(sqrt(a), sqrt(1 - a));
  return ((earthRadius * d) * 3);
}

GeoCoordinates getCenterPoint(
    double lat1, double lon1, double lat2, double lon2) {
  double clon = (lon1 + lon2) / 2;
  double clat = (lat1 + lat2) / 2;

  return GeoCoordinates(clat, clon);
}

String getStringTime(String time) {
  DateTime dttime = DateTime.parse(time);
  String dthour = dttime.hour < 10 ? '0${dttime.hour}' : dttime.hour.toString();
  String dtminute = dttime.minute < 10 ? '0${dttime.minute}' : dttime.minute.toString();
  return '$dthour:$dtminute';
}

TextStyle getTextStyle(context, int size) {
  return TextStyle(
    fontSize: size.toDouble(),
    fontWeight: FontWeight.w600,
    fontFamily: 'Segoe Ui',
    color: accentColor(context),
  );
}

String getDuration(int d) {
  Duration duration = Duration(seconds: d);
  String res = '';
  if (duration.inMinutes >= 60) {
    res =
        '$res${duration.inHours.toString()}h${duration.inMinutes.remainder(60).toString()}';
  } else {
    res = '$res${duration.inMinutes.remainder(60).toString()} mn';
  }

  return res;
}

String getDistanceText(int d) {
  // get the distance in meters or kilometers
  String res = '';
  // ${d}
  if (d >= 1000) {
    res = '$res${d / 1000.0} km';
  } else {
    res = '$res$d m';
  }
  return res;
}

List<Widget> getDurationWidget(int d, context) {
  Duration duration = Duration(seconds: d);
  List<Widget> res = [];

  if (duration.inMinutes >= 60) {
    res.add(
        Text(duration.inHours.toString(), style: getTextStyle(context, 24)));

    res.add(Text('h', style: getTextStyle(context, 10)));

    res.add(Text(
        duration.inMinutes.remainder(60) < 10
            ? '0${duration.inMinutes.remainder(60).toString()}'
            : duration.inMinutes.remainder(60).toString(),
        style: getTextStyle(context, 24)));
  } else {
    res.add(Text(duration.inMinutes.remainder(60).toString(),
        style: getTextStyle(context, 24)));

    res.add(Text('mn', style: getTextStyle(context, 10)));
  }

  return res;
}

enum MarkerSize { hidden, small, large }

enum MarkerMode { bike, bus, cable, metro, boat, noctilien, rer, train, tram }

String getMarkerImageByType(MarkerMode mode, MarkerSize size, context) {
  String assets = 'assets/img/marker/';

  if (size == MarkerSize.hidden) {
    return 'assets/img/null.png';
  }

  if (size == MarkerSize.small) {
    if (mode == MarkerMode.bike) {
      assets = '${assets}mini_bike';
    } else {
      assets = '${assets}mini';
    }
  }

  if (size == MarkerSize.large) {
    if (mode == MarkerMode.train) {
      assets = '${assets}marker_train';
    } else if (mode == MarkerMode.metro) {
      assets = '${assets}marker_metro';
    } else if (mode == MarkerMode.tram) {
      assets = '${assets}marker_tram';
    } else if (mode == MarkerMode.cable) {
      assets = '${assets}marker_cable';
    } else if (mode == MarkerMode.boat) {
      assets = '${assets}marker_boat';
    } else if (mode == MarkerMode.bus) {
      assets = '${assets}marker_bus';
    } else if (mode == MarkerMode.bike) {
      assets = '${assets}marker_bike';
    }
  }

  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    assets = '${assets}_light.png';
  } else {
    assets = '$assets.png';
  }

  return assets;
}

MarkerMode getMarkerMode(List modes) {
  if (modes.contains('nationalrail') || modes.contains('rail')) {
    return MarkerMode.train;
  } else if (modes.contains('metro')) {
    return MarkerMode.metro;
  } else if (modes.contains('tram')) {
    return MarkerMode.tram;
  } else if (modes.contains('cablecar')) {
    return MarkerMode.cable;
  } else if (modes.contains('boat')) {
    return MarkerMode.boat;
  } else if (modes.contains('bus')) {
    return MarkerMode.bus;
  } else if (modes.contains('bike')) {
    return MarkerMode.bike;
  } else {
    return MarkerMode.bus;
  }
}

MarkerSize getMarkerSize(MarkerMode mode, double zoom) {
  if (zoom > 15000 && (mode == MarkerMode.train || mode == MarkerMode.rer)) {
    return MarkerSize.small;
  }
  if (zoom > 15000) {
    return MarkerSize.hidden;
  }
  if (zoom > 3000 && mode == MarkerMode.bike) {
    return MarkerSize.hidden;
  }
  if (zoom > 6000 && (mode != MarkerMode.train && mode != MarkerMode.rer)) {
    return MarkerSize.small;
  }
  if (zoom > 3000 && mode == MarkerMode.bus) {
    return MarkerSize.small;
  }
  if (zoom > 2000 && mode == MarkerMode.bike) {
    return MarkerSize.small;
  }
  return MarkerSize.large;
}

int getSizeForMarker(MarkerSize size) {
  if (size == MarkerSize.hidden) {
    return 0;
  }
  if (size == MarkerSize.small) {
    return 20;
  }
  return 100;
}

double getAppBarOpacity(double position) {
  double res = (((position * -1) + 1) * -3.33) + 1;
  if (res < 0) {
    return 0.0;
  } else if (res > 1.0) {
    return 1;
  }
  return res;
}

double getOpacity(position) {
  double res =
      ((1 / position - 1.1) * 2.33) > 1 ? 1 : ((1 / position - 1.1) * 2.33);
  if (res < 0) {
    return 0.0;
  } else if (res > 1.0) {
    return 1;
  }
  return res;
}

String timeToString(TimeOfDay tod) {
  String dthour = tod.hour < 10 ? '0${tod.hour}' : tod.hour.toString();
  String dtminute = tod.minute < 10 ? '0${tod.minute}' : tod.minute.toString();

  return '$dthour:$dtminute:00';
}
