import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/navigator.dart';

class NavikaApp extends StatefulWidget {
	const NavikaApp({super.key});

	@override
	State<NavikaApp> createState() => _NavikaAppState();
}

class _NavikaAppState extends State<NavikaApp> {
	final _navigatorKey = GlobalKey<NavigatorState>();
	late final RouteState _routeState;
	late final SimpleRouterDelegate _routerDelegate;
	late final TemplateRouteParser _routeParser;

	@override
	void initState() {
		/// Configure the parser with all of the app's allowed path templates.
		_routeParser = TemplateRouteParser(
			allowedPaths: [
				'/home',
				'/stops/:stop_area',
				'/journeys',
				'/journeys/details',
				'/schedules',
				'/schedules/search',
        '/schedules/stops/:stop_area',
        '/schedules/stops/:stop_area/departures/:line_id',
				'/trafic',
        '/trafic/:lineId',
				'/web/:uri'
			],
			initialRoute: '/home',
		);

		_routeState = RouteState(_routeParser);

		_routerDelegate = SimpleRouterDelegate(
			routeState: _routeState,
			navigatorKey: _navigatorKey,
			builder: (context) => NavikaAppNavigator(
				navigatorKey: _navigatorKey,
			),
		);

		super.initState();
	}

	@override
	Widget build(BuildContext context) => RouteStateScope(
    notifier: _routeState,
    child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeParser,

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('fr', 'FR'), // Thai
      ],
      
      //THEME
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primarySwatch: generateMaterialColor(const Color(0xff025982)), // generateMaterialColor(const Color(0xff611925)),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: const Color(0xff025982).withOpacity(0.2),
          iconTheme: MaterialStateProperty.all(
            const IconThemeData(
              color: Colors.black
            )
          )
        )
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1e1e1e)
        ),
        scaffoldBackgroundColor: const Color(0xff191919),
        brightness: Brightness.dark,
        primarySwatch: generateMaterialColor(const Color(0xff025982)), // generateMaterialColor(const Color(0xff611925)),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color(0xff1e1e1e),
          indicatorColor: const Color(0xff025982),
          iconTheme: MaterialStateProperty.all(
            const IconThemeData(
              color: Colors.white
            )
          )
        )
      ),
      //THEME
      themeMode: ThemeMode.system, 
    ),
  );
}



/*
Vert 2A4D14
Bleu de prusse 24445c
Steel Teal 5F8895
Phtalo Blue 020887
1b007f
Wine Red 611925
Raw Sienna C97D54
*/

/*
820226
025982
*/


MaterialColor generateMaterialColor(Color color) {
	return MaterialColor(color.value, {
		50: tintColor(color, 0.9),
		100: tintColor(color, 0.8),
		200: tintColor(color, 0.6),
		300: tintColor(color, 0.4),
		400: tintColor(color, 0.2),
		500: color,
		600: shadeColor(color, 0.1),
		700: shadeColor(color, 0.2),
		800: shadeColor(color, 0.3),
		900: shadeColor(color, 0.4),
	});
}

int tintValue(int value, double factor) =>
		max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
		tintValue(color.red, factor),
		tintValue(color.green, factor),
		tintValue(color.blue, factor),
		1);

int shadeValue(int value, double factor) =>
		max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
		shadeValue(color.red, factor),
		shadeValue(color.green, factor),
		shadeValue(color.blue, factor),
		1);
