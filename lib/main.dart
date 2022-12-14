import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:navika/src/data/credentials.dart' as credentials;
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/app.dart';
import 'package:navika/firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print({'INFO_f', 'Handling a background message: ${message.messageId}'});
}

void main() {
  setHashUrlStrategy();

  setupWindow();

  _initializeHERESDK();

  _initializeHive();

  _initializeFirebase();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

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

  if (globals.hiveBox.get('stopsFavorites') == null) {
    globals.hiveBox.put('stopsFavorites', []);
  }
  if (globals.hiveBox.get('AddressFavorites') == null) {
    globals.hiveBox.put('AddressFavorites', []);
  }
  if (kDebugMode) {
    print({'HIVETEST_', globals.hiveBox.get('AddressFavorites')});
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

// https://firebase.google.com/docs/cloud-messaging/flutter/client?authuser=0

// https://firebase.google.com/docs/flutter/setup?authuser=0&platform=android

void _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  print({'INFO_f', 'User granted permission: ${settings.authorizationStatus}'});

  print({'INFO_f', 'firebase up !'});

  final fcmToken = await FirebaseMessaging.instance.getToken();

  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    // TODO: If necessary send token to application server.

    // Note: This callback is fired at each app startup and whenever a new
    // token is generated.
    print({'INFO_f', 'firebaseMessaging up !'});
  }).onError((err) {
    // Error getting token.
    print({'INFO_f', 'firebaseMessaging pas content !'});
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print({'INFO_f', 'Got a message whilst in the foreground!'});
    print({'INFO_f', 'Message data: ${message.data}'});

    if (message.notification != null) {
      print({'INFO_f', 'Message also contained a notification: ${message.notification}'});
    }
  });
}