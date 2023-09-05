import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
  await Firebase.initializeApp();

  if (kDebugMode) {
    print('Handling a background message: ${message.messageId}');
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  setHashUrlStrategy();

  setupWindow();
  
  await _initializeHive();

  await _initializeHERESDK();

  await _initializeFirebase();

  await _initializeCrashlytics();

  // initializeBackgroundNotifications
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  _initializeLocalNotification();

  runApp(const NavikaApp());
}

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
  }
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

  // Mode selectionné
  if (globals.hiveBox.get('allowedModes') == null) {
    globals.hiveBox.put('allowedModes', ['rail', 'metro', 'tram', 'bus']);
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

  FirebaseMessaging.instance.onTokenRefresh
    .listen((fcmToken) {
      // TODO: If necessary send token to application server.
      
      if (kDebugMode) {
        print({'INFO_token_new', fcmToken});
      }
      globals.fcmToken = fcmToken;
    })
    .onError((err) {
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
    print({'INFO_f', 'User granted permission: ${settings.authorizationStatus}'});
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {

    if (message.notification != null) {
      showNotification(message);
    }
  });
}

Future _initializeCrashlytics() async {
  if (kDebugMode) {
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
  var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification(RemoteMessage message) async {
  // print({'INFO_', message.toMap()});
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