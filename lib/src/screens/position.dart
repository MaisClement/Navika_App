// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:location/location.dart' as gps;

// 🌎 Project imports:
import 'package:navika/src/data/app.dart' as app;
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style.dart';

class Position extends StatefulWidget {
  const Position({super.key});

  @override
  State<Position> createState() => _PositionState();
}

class _PositionState extends State<Position> {
  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  late gps.PermissionStatus permissionGranted;
  gps.Location location = gps.Location();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor(context),
          title: Text(app.NAME, 
            style: appBarTitle.copyWith(color: Colors.white)
          ),
          leading: GestureDetector(
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onTap: () {
              globals.hiveBox.put('askGps', true);
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: mainColor(context),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Image(
                image: AssetImage(
                  'assets/img/position.png',
                ),
                width: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.position_title,
                style: const TextStyle(
                  fontFamily: 'Segoe Ui',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: mainColor(context),
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  child: Text(AppLocalizations.of(context)!.allow),
                  onPressed: () async {
                    permissionGranted = await location.hasPermission();
                    permissionGranted = await location.requestPermission();
                    if (permissionGranted != gps.PermissionStatus.granted) {
                      globals.hiveBox.put('allowGps', false);
                    } else {
                      globals.hiveBox.put('allowGps', true);
                    }
                    globals.hiveBox.put('askGps', true);
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: mainColor(context),
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  child: Text(AppLocalizations.of(context)!.not_allow),
                  onPressed: () async {
                    globals.hiveBox.put('allowGps', false);
                    globals.hiveBox.put('askGps', true);
                    Navigator.pop(context);
                  },
                ),
              ),
              const Spacer(),
              const Divider(
                color: Colors.white,
              ),
              Text(
                AppLocalizations.of(context)!.position_privacy,
                style: const TextStyle(
                  fontFamily: 'Segoe Ui',
                  color: Colors.white,
                ),
              ),
              const Text(''),
              Text(
                AppLocalizations.of(context)!.position_details,
                style: const TextStyle(
                  fontFamily: 'Segoe Ui',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
}
