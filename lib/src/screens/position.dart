import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:location/location.dart' as gps;
import 'package:navika/src/routing.dart';
import 'package:navika/src/style/style.dart';

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
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(globals.NAME,
              style: appBarTitle.copyWith(color: Colors.white)),
          leading: GestureDetector(
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Autoriser Navika à accéder à votre position ?',
                style: TextStyle(
                  fontFamily: 'Segoe Ui',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  child: const Text('Autoriser'),
                  onPressed: () async {
                    permissionGranted = await location.hasPermission();
                    permissionGranted = await location.requestPermission();
                    if (permissionGranted != gps.PermissionStatus.granted) {
                      globals.hiveBox.put('allowGps', false);
                    } else {
                      globals.hiveBox.put('allowGps', true);
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  child: const Text('Ne pas autoriser'),
                  onPressed: () async {
                    globals.hiveBox.put('allowGps', false);
                    Navigator.pop(context);
                  },
                ),
              ),
              const Spacer(),
              const Divider(
                color: Colors.white,
              ),
              const Text(
                "Navika utilise votre position, uniquement lors que l'application est ouverte pour afficher votre position sur la carte ou vous proposez les points d'arrêts à proximité.",
                style: TextStyle(
                  fontFamily: 'Segoe Ui',
                  color: Colors.white,
                ),
              ),
              const Text(''),
              const Text(
                "Votre position est utilisé uniquement lorsque vous en avez besoin et n'est pas sauvegardé.",
                style: TextStyle(
                  fontFamily: 'Segoe Ui',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
}
