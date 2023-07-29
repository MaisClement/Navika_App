import 'dart:io';

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
import 'firebase_options.dart';


import 'package:navika/src/data/credentials.dart' as credentials;
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/app.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  setHashUrlStrategy();

  setupWindow();
  
  _initializeHive();

  _initializeHERESDK();

  _initializeFirebase();

  _initializeLocalNotification();

  runApp(const NavikaApp());
}

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
  }
}

void _initializeHive() async {
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

  // timeType
  if (globals.hiveBox.get('timeType') == null) {
    globals.hiveBox.put('timeType', 'departure');
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

  if (kDebugMode) {
    print({'INFO_', globals.hiveBox.get('addressFavorites')});
  }
}

void _initializeHERESDK() async {
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

void _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print({'INFO_token', fcmToken});
  globals.fcmToken = fcmToken!;

  FirebaseMessaging.instance.onTokenRefresh
    .listen((fcmToken) {
      // TODO: If necessary send token to application server.

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
      print({'INFO_token_new', fcmToken});
      globals.fcmToken = fcmToken;
    })
    .onError((err) {
      // Error getting token.
      print({'INFO_token_err', err});
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

  // Notification received callback
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('INFO_ Got a message whilst in the foreground!');
    print('INFO_ Message data: ${message.data}');

    if (message.notification != null) {
      showNotification(message);
      print('INFO_ Message also contained a notification: ${message.notification}');
    }
  });
}

void _initializeLocalNotification() {
  var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

void showNotification(RemoteMessage message) async {
  print({'INFO_', message.toMap()});
  var androidNotificationDetails = const AndroidNotificationDetails(
    'com.lowa.channel',
    'Notification',
    playSound: true,
    enableVibration: true,
    importance: Importance.high,
    priority: Priority.high,
  );

  NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
      0, message.notification?.title, message.notification?.body, notificationDetails);
}