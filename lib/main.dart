import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/data/app.dart';
import 'package:navika/src/extensions/timeofday.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:navika/firebase_options.dart';

import 'package:navika/src/data/credentials.dart' as credentials;
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/app.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  await Hive.initFlutter();
  var hiveBox = await Hive.openBox('Home');

  if (message.data['type'] == 'report') {
    await showReportNotification(message, hiveBox);
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  setHashUrlStrategy();

  setupWindow();

  await _initializeCertCA();

  await _initializeHive();

  await _initializeHERESDK();

  await _initializeFirebase();

  await _initializeCrashlytics();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  _initializeLocalNotification();

  await getAppInfo();

  runApp(const NavikaApp());
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

  // Trajet enregistré
  if (globals.hiveBox.get('journeys') == null) {
    globals.hiveBox.put('journeys', []);
  }

  // Trajet enregistré
  if (globals.hiveBox.get('homeOrder') == null) {
    globals.hiveBox.put('homeOrder', [
      {
        'id': 'message',
        'name': 'Messages d’actualités',
        'enabled': true,
      },
      {
        'id': 'trafic',
        'name': 'Etat du trafic',
        'enabled': true,
      },
      {
        'id': 'journeys',
        'name': 'Vos itinéraires',
        'enabled': true,
      },
      {
        'id': 'schedules',
        'name': 'Vos horaires',
        'enabled': true,
      },
    // {
    //   'id': 'lines',
    //   'name': 'Vos lignes',
    //   'enabled': true,
    // },
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
  if (globals.hiveBox.get('allowGps') == null) {
    globals.hiveBox.put('allowGps', false);
  }

  // Derniere position gps
  if (globals.hiveBox.get('latitude') == null) {
    globals.hiveBox.put('latitude', 48.859481);
  }
  if (globals.hiveBox.get('longitude') == null) {
    globals.hiveBox.put('longitude', 2.346711);
  }

  // Mode d'affichage
  if (globals.hiveBox.get('displayMode') == null) {
    globals.hiveBox.put('displayMode', 'default');
  }

  // Affichage des terminus
  if (globals.hiveBox.get('hideTerminusTrain') == null) {
    globals.hiveBox.put('hideTerminusTrain', false);
  }

  // Affichage groupé ?
  if (globals.hiveBox.get('ungroupDepartures') == null) {
    globals.hiveBox.put('ungroupDepartures', false);
  }

  // useSerin
  if (globals.hiveBox.get('useSerin') == null) {
    globals.hiveBox.put('useSerin', false);
  }

  if (kDebugMode) {
    print({'INFO_', globals.hiveBox.get('addressFavorites')});
  }
}

Future _initializeHERESDK() async {
  SdkContext.init(IsolateOrigin.main);

  String accessKeyId = credentials.HERE_ACCES_KEY_ID;
  String accessKeySecret = credentials.HERE_ACCES_KEY_SECRET;
  SDKOptions sdkOptions =
      SDKOptions.withAccessKeySecret(accessKeyId, accessKeySecret);

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
    print({'INFO_', 'User granted permission: ${settings.authorizationStatus}'});
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    if (message.notification != null) {
      showNotification(message);
    }

    if (message.data['type'] == 'report') {
      await showReportNotification(message, globals.hiveBox);
    }
  });
}

Future<void> renewNotif(String oldToken, String newToken) async {
  NavikaApi navikaApi = NavikaApi();
  await navikaApi.renewNotificationToken(oldToken, newToken);
}

Future _initializeCrashlytics() async {
  if (kDebugMode) {
    print({'INFO_', 'Ignore crashlytics'});
    return;
  }

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

void _initializeLocalNotification() {
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('app_icon');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification(RemoteMessage message) async {
  var androidNotificationDetails = const AndroidNotificationDetails(
    'com.lowa.navika',
    'Notification',
    playSound: true,
    enableVibration: true,
    importance: Importance.high,
    priority: Priority.high,
  );

  NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(0, message.notification?.title, message.notification?.body, notificationDetails);
}

Future<void> showReportNotification(RemoteMessage message, box) async {
  Map alert = box.get('linesAlert');
  String id = message.data['line'];

  if (alert[id] == null) {
    return;
  }

  alert = alert[id];
  Map days = alert['days'];
  
  // Type
  if (alert['type'] == 'all' && int.parse(message.data['severity']) < 3) {
    return;
  } else if (alert['type'] == 'alert' && int.parse(message.data['severity']) < 4) {
    return;
  }

  // Date
  if (DateTime.now().weekday == 1 && days['monday'] == false) {
    return;
  } else if (DateTime.now().weekday == 2 && days['tuesday'] == false) {
    return;
  } else if (DateTime.now().weekday == 3 && days['wednesday'] == false) {
    return;
  } else if (DateTime.now().weekday == 4 && days['thursday'] == false) {
    return;
  } else if (DateTime.now().weekday == 5 && days['friday'] == false) {
    return;
  } else if (DateTime.now().weekday == 6 && days['saturday'] == false) {
    return;
  } else if (DateTime.now().weekday == 7 && days['sunday'] == false) {
    return;
  }
  
  TimeOfDay startTime = TimeOfDay(
    hour:  int.parse( alert['times']['start_time'].substring(0, 2) ), 
    minute: int.parse( alert['times']['start_time'].substring(3, 5) )
  ); 
  TimeOfDay endTime = TimeOfDay(
    hour:  int.parse( alert['times']['end_time'].substring(0, 2) ), 
    minute: int.parse( alert['times']['end_time'].substring(3, 5) )
  ); 
  
  //Time
  if (startTime.compareTo(TimeOfDay.now()) > 0 && endTime.compareTo(TimeOfDay.now()) < 0 ) {
    return;
  }
  
  var androidNotificationDetails = const AndroidNotificationDetails(
    'trafic',
    'Alerte trafic',
    playSound: true,
    enableVibration: true,
    importance: Importance.high,
    priority: Priority.high,
  );
  
  NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(0, message.data['title'], message.data['body'], notificationDetails);
}
