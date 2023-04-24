import 'package:flutter/material.dart';

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

mainColor(context) {
  return Theme.of(context).colorScheme.primary;
}

hereIcon(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return 'assets/img/here/HERE_logo_full_inverted.svg';
  }
  return 'assets/img/here/HERE_logo_full.svg';
}

topBarColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff000000);
  }
  return const Color(0xffffffff);
}

backgroundColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff000000);
  }
  return const Color(0xffffffff);
}

accentColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xffffffff);
  }
  return Theme.of(context).colorScheme.primary;
}

boxColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6);
  }
  return Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2);
}

boxContentColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return Colors.white.withOpacity(0.7);
  }
  return Theme.of(context).colorScheme.primary;
}

tabLabelColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return Colors.white;
  }
  return Colors.black;
}

walkingColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return Colors.grey[300];
  }
  return Colors.grey[700];
}

routeBhColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return Colors.grey[700];
  }
  return Colors.grey[300];
}

traficBlockColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff000000);
  }
  return const Color(0xffeeeeee);
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
  return Theme.of(context).colorScheme.primary;
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
  return Theme.of(context).colorScheme.primary.withOpacity(0.1);
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

getIconLine(context, line) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return line.imageLight;
  }
  return line.imageDark;
}