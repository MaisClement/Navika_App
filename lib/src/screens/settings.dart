import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/bottom_sheets/terminus_trains.dart';
import 'package:navika/src/widgets/settings/button.dart';
import 'package:navika/src/widgets/settings/link.dart';

import 'package:navika/src/widgets/bottom_sheets/time.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  void update() {
    return;
  }

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Options',
                style: TextStyle(
                  fontFamily: 'Segoe Ui',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SettingsButton(
                name: "Temps d'attente",
                function: () {
                  showModalBottomSheet<void>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) => BottomSchedules(
                            isDeparture: true,
                            update: update,
                          ));
                }),
            SettingsButton(
                name: 'Train terminus',
                function: () {
                  showModalBottomSheet<void>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) =>
                          BottomTerminusTrain(update: update));
                }),
            const Spacer(),
            SettingsLink(
              name: 'Github du projet ›',
              url: 'https://github.com/MaisClement/Navika_App',
              icon: ScaffoldIcon.github,
            ),
            SettingsLink(
              name: 'Icones par Icones8 ›',
              url: 'https://icones8.fr',
              icon: ScaffoldIcon.icons8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.white,
              ),
            ),
            SettingsLink(
              name: 'Mentions légales ›',
              url: 'http://app.navika.hackernwar.com/legal.php',
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: const Text(
                'Par respect pour votre confidentialité, Navika ne collecte ni conserve aucune information vous concernant.',
                style: TextStyle(
                  fontFamily: 'Segoe Ui',
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.2),
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '${globals.NAME} 2023 • Version ${globals.VERSION}',
                    style: TextStyle(
                      fontFamily: 'Segoe Ui',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Made with 💖',
                    style: TextStyle(
                      fontFamily: 'Segoe Ui',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
