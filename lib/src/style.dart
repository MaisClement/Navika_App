import 'package:flutter/material.dart';
import 'package:navika/src/screens/trip_details.dart';

const appBarTitle = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: 'Segoe Ui',
);

const appBarSubtitle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  fontFamily: 'Segoe Ui',
);

const snackBarText = TextStyle(
    color: Color(0xffffffff),
    fontWeight: FontWeight.w600,
    fontFamily: 'Segoe Ui');

const bottomSheetBorder = BorderRadius.only(
  topLeft: Radius.circular(15),
  topRight: Radius.circular(15),
  bottomLeft: Radius.zero,
  bottomRight: Radius.zero,
);

mainColor(context) {
  return Theme.of(context).colorScheme.primary;
}

hereIcon(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return 'assets/img/here/HERE_logo_full_inverted.svg';
  }
  return 'assets/img/here/HERE_logo_full.svg';
}

accentColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xffffffff);
  }
  return mainColor(context);
}

walkingColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return Colors.grey[300];
  }
  return Colors.grey[700];
}

routeBhColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return Colors.grey[800];
  }
  return const Color(0xffebf1f4);
}

schedulesBlock(context, Color color) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return color;
  }
  return Colors.white;
}

schedulesBack(context, Color color) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return color.withOpacity(0.3);
  }
  return color.withOpacity(0.1);
}

departureList(context, Color color) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return color.withOpacity(0.2);
  }
  return Colors.white.withOpacity(0.8);
}

Color departureListNoColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff222222);
  }
  return mainColor(context).withOpacity(0.1);
}

Brightness schedulesIsDark(Brightness brightness, color) {
  if (Brightness.dark == brightness) {
    if (color == '000000') {
      return Brightness.light;
    } else {
      return Brightness.dark;
    }
  }
  return Brightness.light;
}

// ----------------

getShimmerBaseColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff252525);
  }
  return const Color(0xffe0e0e0);
}
getShimmerHighlightColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff555555);
  }
  return const Color(0xfff5f5f5);
}

// ----------------

String getIconLine(Brightness brightness, line) {
  if (Brightness.dark == brightness) {
    return 'assets/img/icons/${line['logo_light']}';
  }
  return 'assets/img/icons/${line['logo']}';
}

Color getActiveColor(context, status) {
  if (status == TripBlockStatus.inactive){
    return const Color(0xff808080);
  }  
  return mainColor(context);
}

Color getArrivalActiveColor(context, status) {
  if (status == TripBlockStatus.inactive || status == TripBlockStatus.origin){
    return const Color(0xff808080);
  }  
  return mainColor(context);
}

Color getMechanicalBike(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff8ca985);
  }
  return const Color(0xffb7dcae);
}

Color getElecBike(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff84abcb);
  }
  return const Color(0xffa6d6fe);
}

Color getParkBike(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xffc3b75c);
  }
  return const Color(0xfff6e775);
}

Color getJourneysColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff011b27);
  }
  return const Color(0xffe4edf1);
}

Color getRadioTilesTextColor(context, value) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    if (value) {
      return Theme.of(context).colorScheme.onSurface;
    } else {
      return const Color(0xff1097d5);
    }
  }
  if (value) {
    return Theme.of(context).colorScheme.surface;
  } else {
    return accentColor(context);
  }
}