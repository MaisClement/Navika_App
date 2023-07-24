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

schedulesText(context, Color color) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return color;
  }
  return mainColor(context);
}

departureList(context, Color color) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return color.withOpacity(0.2);
  }
  return Colors.white.withOpacity(0.8);
}

departureListNoColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff222222);
  }
  return mainColor(context).withOpacity(0.1);
}

schedulesIsDark(context, color) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    if (color == '000000') {
      return true;
    } else {
      return false;
    }
  }
  return true;
}

// ----------------

String getIconLine(context, line) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return line.imageLight;
  }
  return line.imageDark;
}



Color getActiveColor(context, status) {
  if (status == TripBlockStatus.inactive){
    return const Color(0xff808080);
  }  
  return mainColor(context);
}
