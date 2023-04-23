import 'package:flutter/material.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/data/global.dart' as globals;

const divider = Divider(
  color: Color(0xff808080),
  thickness: 1.5,
);

Map getTraficLines(String name) {
  for (var lines in globals.trafic) {
    if (lines['id'] == name) {
      return lines;
    }
  }
  return {};
}

Map? getReports(String lineId) {
  return getTraficLines(LINES.getLines(lineId).id)['reports'];
}

int? getSeverity(String lineId) {
  return getTraficLines(LINES.getLines(lineId).id)['severity'];
}

String getModeImage(lineId, isDark) {
  if (LINES.isLineById(lineId)) {
    if (isDark) {
      return LINES.getLinesById(lineId).imageModeDark;
    }
    return LINES.getLinesById(lineId).imageModeLight;
  }
  if (isDark) {
    return 'assets/img/icons/bus.png';
  }
  return 'assets/img/icons/bus_light.png';
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
    //return "Unknown";
  }
}

String getTime(String time) {
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
