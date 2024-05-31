// 🎯 Dart imports:
import 'dart:io';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:uuid/uuid.dart';

// 🌎 Project imports:
import 'package:navika/credentials.dart' as credentials;
import 'package:navika/firebase_options.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/app.dart';
import 'package:navika/src/data/app.dart' as app;
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/screens/home_settings.dart';

// import 'package:sentry_flutter/sentry_flutter.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //DISABLED if (message.notification != null) {
  //DISABLED   showNotification(message);
  //DISABLED }

  if (message.data['type'] == 'report') {
    await showReportNotification(message);
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  setHashUrlStrategy();

  setupWindow();

  WidgetsFlutterBinding.ensureInitialized();

  await app.getAppInfo();

  try {
    await _initializeFirebase();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);   
  } catch (e) {
    // print('Error while initializing Firebase');
  }

  _initializeLocalNotification();

  await _initializeCertCA();

  await _initializeHive();

  await _initializeHERESDK();

  runApp(const NavikaApp());

  // SentryFlutter.init(
  //   (options) => options
  //     ..dsn=app.GLITCH_URL
  //     ..tracesSampleRate=1
  //     ..enableAutoSessionTracking=false,
  //   appRunner: () => runApp(const NavikaApp())
  // );
}

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
  }
}

Future _initializeCertCA() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
}

Future _initializeHive() async {
  await Hive.initFlutter();
  globals.hiveBox = await Hive.openBox('Home');

  // Arrêts favoris
  if (globals.hiveBox.get('stopsFavorites') == null) {
    globals.hiveBox.put('stopsFavorites', []);
  }

  // Lignes favorites
  if (globals.hiveBox.get('linesFavorites') == null) {
    globals.hiveBox.put('linesFavorites', []);
  }

  // Lignes favorites
  if (globals.hiveBox.get('linesAlert') == null) {
    globals.hiveBox.put('linesAlert', {});
  }

  // Adresses favorites
  if (globals.hiveBox.get('addressFavorites') == null) {
    globals.hiveBox.put('addressFavorites', []);
  }

  // Trajet régulier
  if (globals.hiveBox.get('recurrentJourneys') == null) {
    globals.hiveBox.put('recurrentJourneys', []);
  }

  // Trajet enregistré
  if (globals.hiveBox.get('journeys') == null) {
    globals.hiveBox.put('journeys', []);
  }

  // Trajet enregistré
  if (globals.hiveBox.get('homepageOrder') == null) {
    globals.hiveBox.put('homepageOrder', [
      {
        'id': 'message',
        'enabled': true,
      },
      {
        'id': 'sponsor',
        'enabled': true,
      },
      {
        'id': 'trafic',
        'enabled': true,
      },
      {
        'id': 'punctualJourneys',
        'enabled': true,
      },
      {
        'id': 'recurrentJourneys',
        'enabled': true,
      },
      {
        'id': 'schedules',
        'enabled': true,
      },
      {
        'id': 'map',
        'enabled': true,
      },
    ],
    );
  }

  // Mode selectionné
  if (globals.hiveBox.get('allowedModes') == null) {
    globals.hiveBox.put('allowedModes', ['rail', 'metro', 'tram', 'bus', 'cable', 'funicular', 'boat']);
  }

  // travelerType
  if (globals.hiveBox.get('travelerType') == null) {
    globals.hiveBox.put('travelerType', 'standard');
  }

  // Historique pour les itinéraires
  if (globals.hiveBox.get('historyPlaces') == null) {
    globals.hiveBox.put('historyPlaces', []);
  }

  // ---
  // Options
  // GPS Autorisé
  if (globals.hiveBox.get('askGps') == null) {
    globals.hiveBox.put('askGps', false);
  }
  
  if (globals.hiveBox.get('allowGps') == null) {
    globals.hiveBox.put('allowGps', false);
  }

  // Mode d'affichage
  if (globals.hiveBox.get('displayMode') == null) {
    globals.hiveBox.put('displayMode', 'default');
  }

  // Theme
  if (globals.hiveBox.get('themeMode') == null) {
    globals.hiveBox.put('themeMode', 'default');
  }

  // Affichage des terminus
  if (globals.hiveBox.get('hideTerminusTrain') == null) {
    globals.hiveBox.put('hideTerminusTrain', false);
  }

  // Affichage groupé ?
  if (globals.hiveBox.get('ungroupDepartures') == null) {
    globals.hiveBox.put('ungroupDepartures', false);
  }

  // Version
  if (globals.hiveBox.get('version') == null) {
    globals.hiveBox.put('version', app.VERSION);
  }
  
  // UUID
  if (globals.hiveBox.get('uuid') == null) {
    globals.hiveBox.put('uuid', const Uuid().v4());
  }

  // sponsorHideDate
  if (globals.hiveBox.get('sponsorHideDate') != null) {
    String sponsorHideDate = globals.hiveBox.get('sponsorHideDate');
    DateTime dt = DateTime.parse(sponsorHideDate.split('-').reversed.join());
    if (dt.isAfter(DateTime.now())) {
      handleSwitch(true, 'sponsor');
      globals.hiveBox.put('sponsorHideDate', null);
    }
  }
}

Future _initializeHERESDK() async {
  SdkContext.init(IsolateOrigin.main);

  String accessKeyId = credentials.HERE_ACCES_KEY_ID;
  String accessKeySecret = credentials.HERE_ACCES_KEY_SECRET;
  SDKOptions sdkOptions = SDKOptions.withAccessKeySecret(accessKeyId, accessKeySecret);

  try {
    await SDKNativeEngine.makeSharedInstance(sdkOptions);
  } on InstantiationException {
    throw Exception('Failed to initialize the HERE SDK.');
  }
}

Future _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final fcmToken = await FirebaseMessaging.instance.getToken();
  if (kDebugMode) {
    print({'INFO_token', fcmToken});
  }
  globals.fcmToken = fcmToken!;

  FirebaseMessaging.instance.onTokenRefresh.listen((newFcmToken) async {
    await renewNotif(globals.fcmToken, newFcmToken);

    globals.fcmToken = newFcmToken;
  }).onError((err) {
    if (kDebugMode) {
      print({'INFO_token_err', err});
    }
  });

  // Request permission for notifications
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print(['INFO_', settings.authorizationStatus]);
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    if (message.notification != null) {
      showNotification(message);
    }

    if (message.data['type'] == 'report') {
      await showReportNotification(message);
    }
  });
}

Future<void> renewNotif(String oldToken, String newToken) async {
  NavikaApi navikaApi = NavikaApi();
  await navikaApi.renewNotificationToken(oldToken, newToken);
}

void _initializeLocalNotification() {
  var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification(RemoteMessage message) async {
  var androidNotificationDetails = const AndroidNotificationDetails(
    'notification',
    'Notification',
    playSound: true,
    enableVibration: true,
    importance: Importance.high,
    priority: Priority.high,
  );

  NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(0, message.notification?.title, message.notification?.body, notificationDetails);
}

Future<void> showReportNotification(RemoteMessage message) async {
  var androidNotificationDetails = AndroidNotificationDetails(
    'trafic_${message.data['line']}',
    'Alerte trafic',
    playSound: true,
    enableVibration: true,
    importance: Importance.high,
    priority: Priority.high,
  );
  
  NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(0, message.data['title'], message.data['body'], notificationDetails);
}
