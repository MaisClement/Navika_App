import 'package:flutter/material.dart';

import 'package:navika/src/screens/routes.dart';
import 'package:navika/src/screens/trafic.dart';
import 'package:navika/src/screens/schedules.dart';
import 'package:navika/src/screens/scaffold.dart';
import 'package:navika/src/screens/home.dart';

/// Displays the contents of the body of [NavikaAppScaffold]

getHomePage(pathTemplate, id) {
  if (pathTemplate == '/stops/:id' && id != null){
    return Home(
      displayType: 'stops',
      id: id
    );

  } else if (pathTemplate == '/bike/:id' && id != null) {
    return Home(
      displayType: 'bike',
      id: id
    );
  }
}

getPages(pathTemplate, id) {
	if (pathTemplate == '/home') {
		return const Home();

	} else if (pathTemplate == '/stops/:id' || pathTemplate == '/bike/:id') {
		return getHomePage(pathTemplate, id);

	} else if (pathTemplate.startsWith('/schedules')) {
		return const Schedules();
		
	}	else if (pathTemplate.startsWith('/routes')) {
		return const Routes();

	}	else if (pathTemplate.startsWith('/trafic')){
		return const Trafic();

	} else {
		return Container();
	}
}