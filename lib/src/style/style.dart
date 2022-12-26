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

hereIcon(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return 'assets/here/HERE_logo_full_inverted.svg';
  }
  return 'assets/here/HERE_logo_full.svg';
}

backgroundColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff191919);
  }
  return const Color(0xfffafafa);
}

accentColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xffffffff);
  }
  return Theme.of(context).colorScheme.primaryContainer;
}

boxColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4);
  }
  return Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2);
}

boxContentColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return Colors.white.withOpacity(0.7);
  }
  return Theme.of(context).colorScheme.primary;
}

dividerColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff606060);
  }
  return Colors.grey[300];
}

traficBlockColor(context) {
  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    return const Color(0xff000000);
  }
  return const Color(0xffeeeeee);
}
