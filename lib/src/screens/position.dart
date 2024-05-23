// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:geolocator/geolocator.dart';

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

  late LocationPermission permission;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor(context),
          title: Text(app.NAME, 
            style: appBarTitle.copyWith(color: Colors.white)
          ),
          leading: closeLeadingAppBar(context),
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
                style: TextStyle(
                  fontFamily: fontFamily,
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
                    permission = await Geolocator.requestPermission();
                    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
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
                style: TextStyle(
                  fontFamily: fontFamily,
                  color: Colors.white,
                ),
              ),
              const Text(''),
              Text(
                AppLocalizations.of(context)!.position_details,
                style: TextStyle(
                  fontFamily: fontFamily,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
}
