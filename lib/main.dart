import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/data/credentials.dart' as credentials;
import 'src/data/global.dart' as globals;
import 'src/app.dart';

void main() {
	setHashUrlStrategy();

	setupWindow();

	_initializeHERESDK();

  _initializeHive();

	runApp(const NavikaApp());
}

void setupWindow() {
	if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
		WidgetsFlutterBinding.ensureInitialized();
	}
}

void _initializeHive() async{
  await Hive.initFlutter();

  globals.hiveBox = await Hive.openBox('Home');
  
  print({'HIVETEST_latitude:', globals.hiveBox.get('latitude')});
}

void _initializeHERESDK() async {
  SdkContext.init(IsolateOrigin.main);

  String accessKeyId = credentials.HERE_ACCES_KEY_ID;
  String accessKeySecret = credentials.HERE_ACCES_KEY_SECRET;
  SDKOptions sdkOptions = SDKOptions.withAccessKeySecret(accessKeyId, accessKeySecret);

  try {
    await SDKNativeEngine.makeSharedInstance(sdkOptions);
  } on InstantiationException {
    throw Exception("Failed to initialize the HERE SDK.");
  }
}