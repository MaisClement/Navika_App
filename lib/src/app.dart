import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/navigator.dart';

class NavikaApp extends StatefulWidget {
	const NavikaApp({super.key});

  static void updateThemeMode(BuildContext context) {
    context.findAncestorStateOfType<_NavikaAppState>()?.updateThemeMode();
  }

	@override
	State<NavikaApp> createState() => _NavikaAppState();
}

class _NavikaAppState extends State<NavikaApp> {
	final _navigatorKey = GlobalKey<NavigatorState>();
	late final RouteState _routeState;
	late final SimpleRouterDelegate _routerDelegate;
	late final TemplateRouteParser _routeParser;
  String themeMode = '';

  @override
	void initState() {
		_routeParser = TemplateRouteParser(
			allowedPaths: [
				'/home',
				'/home/settings',
				'/home/address',
				'/home/address/:type',
				'/home/address/:type/:id',
				'/maps',
				'/settings',
				'/settings/notifications',
				'/changes',
				'/position',
				'/stops/:id',
				'/bike/:id',
				'/address/:id',
				'/home/journeys',
				'/home/journeys/search/:type',
				'/home/journeys/details',
				'/home/journeys/list',
				'/home/journeys/get/:id',
				'/schedules',
				'/schedules/search',
        '/schedules/stops/:id',
        '/schedules/stops/:id/departures/:line_id',
        '/trip/details/:id',
        '/trip/details/:id/from/:from',
        '/trip/details/:id/from/:from/to/:to',
				'/routes',
				'/routes/search',
				'/routes/details/:id',
				'/routes/details/:id/schedules/:stop_id',
				'/trafic',
        '/trafic/details',
        '/trafic/add',
				'/web/:uri',
				'/pdf'
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

    themeMode = globals.hiveBox?.get('themeMode');

		super.initState();
	}

  void updateThemeMode() {
    setState(() {
      themeMode = globals.hiveBox?.get('themeMode');
    });
  }

  Color mainColor = const Color(0xff025982);
  Color primaryContainer = const Color(0xffccdee6);
  Color darkPrimaryContainer = const Color(0xff01354e);

  ThemeMode getThemeMode(String themeMode) {
    if (themeMode == 'dark') {
      return ThemeMode.dark;
    } else if (themeMode == 'light') {
      return ThemeMode.light;
    }
    return ThemeMode.system;
  }

	@override
	Widget build(BuildContext context) => RouteStateScope(
    notifier: _routeState,
    child: MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeParser,

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('fr', 'FR'), // French
      ],
      
      //THEME
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,

        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: mainColor,
          primaryContainer: primaryContainer,
          onPrimary: const Color(0xFFFFFFFF),
          onPrimaryContainer: mainColor,
          secondary: const Color(0xFFFFFFFF),
          onSecondary: const Color(0xFFFFFFFF),
          error: const Color(0xFFF32424),
          onError: const Color(0xFFF32424),
          background: const Color(0xFFF1F2F3),
          onBackground: const Color(0xff000000),
          surface: const Color(0xFFFFFFFF),
          onSurface: const Color(0xff000000),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            foregroundColor: const Color(0xFFFFFFFF),
          ),
        ),
        cardTheme: CardTheme(
          color:  primaryContainer,
          elevation: 0,
          margin: const EdgeInsets.all(0) ,
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Color(0xff919191),
        ),
        iconTheme: IconThemeData(
          color: mainColor
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: mainColor.withOpacity(0.15),
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return IconThemeData(
                color: mainColor
              );
            }
            return const IconThemeData(
              color: Color(0xff616161)
            );
          }),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(
                fontWeight: FontWeight.w700,
                color: mainColor,
              );
            }
            return const TextStyle(
              color: Color(0xff616161)
            );
          }),
        ),
        
        scaffoldBackgroundColor: const Color(0xffffffff),

        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,

        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: mainColor,
          primaryContainer: darkPrimaryContainer,
          onPrimary: const Color(0xff000000),
          onPrimaryContainer: const Color(0xFFFFFFFF),
          secondary: const Color(0xff000000),
          onSecondary: const Color(0xff000000),
          error: const Color(0xFFF32424),
          onError: const Color(0xFFF32424),
          background: const Color(0xFF242425),
          onBackground: const Color(0xFFFFFFFF),
          surface: const Color(0xff000000),
          onSurface: const Color(0xFFFFFFFF),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            foregroundColor: const Color(0xFFFFFFFF),
          ),
        ),
        cardTheme: CardTheme(
          color:  darkPrimaryContainer,
          elevation: 0,
          margin: const EdgeInsets.all(0) ,
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Color(0xff919191),
          labelColor: Colors.white,
          indicatorColor: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: mainColor
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color(0xff1e1e1e),
          indicatorColor: mainColor,
          iconTheme: MaterialStateProperty.all(
            const IconThemeData(
              color: Colors.white
            )
          )
        ),
        scaffoldBackgroundColor: const Color(0xff000000),
      ),

      themeMode: getThemeMode(themeMode), 
    ),
  );
}

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
