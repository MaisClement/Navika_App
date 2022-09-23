import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/app.dart';

void main() {
  
	setHashUrlStrategy();

	setupWindow();
	runApp(const Bookstore());
}

void setupWindow() {
	if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
		WidgetsFlutterBinding.ensureInitialized();
	}
}
