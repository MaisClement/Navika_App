import 'package:flutter/material.dart';
import 'package:navika/src/screens/home.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/screens/routes.dart';
import 'package:navika/src/screens/schedules.dart';
import 'package:navika/src/screens/trafic.dart';

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

  } else if (pathTemplate == '/address/:id' && id != null) {
    return Home(
      displayType: 'address',
      id: id
    );
  }
}

getPages(pathTemplate, id) {
	if (pathTemplate == '/stops/:id' || pathTemplate == '/bike/:id' || pathTemplate == '/address/:id') {
		return getHomePage(pathTemplate, id);

	} else if (pathTemplate.startsWith('/schedules')) {
		return const Schedules();
		
	}	else if (pathTemplate.startsWith('/routes')) {
		return const Routes();

	}	else if (pathTemplate.startsWith('/trafic')){
		return const Trafic();

	} else if (pathTemplate.startsWith('/home')){
		return const Home();

	} else {
		return Container();
	}
}

class NavikaAppScaffold extends StatelessWidget {
  final String? pathTemplate;
  final String? id;

  const NavikaAppScaffold({
    required this.pathTemplate,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getNavigationBar(context),
      body: getPages(pathTemplate, id),
    );
  }
}
