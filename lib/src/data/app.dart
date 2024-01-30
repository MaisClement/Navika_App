// ignore_for_file: constant_identifier_names

library my_prj.app;
import 'package:package_info_plus/package_info_plus.dart';

Future getAppInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  
  name = packageInfo.appName;
  packageName = packageInfo.packageName;
  version = packageInfo.version;
  buildNumber = packageInfo.buildNumber;
  buildSignature = packageInfo.buildSignature;
}

String name = '';
String packageName = '';
String version = '';
String buildNumber = '';
String buildSignature = '';