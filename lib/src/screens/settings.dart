import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/bottom_sheets/grouped_departures.dart';
import 'package:navika/src/widgets/bottom_sheets/route_options.dart';
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
    setState(() {
      displayMode = globals.hiveBox.get('displayMode');
      hideTerminusTrain = globals.hiveBox.get('hideTerminusTrain');
      ungroupDepartures = globals.hiveBox.get('ungroupDepartures');
      allowGps = globals.hiveBox.get('allowGps');
    });
  }

  String displayMode = globals.hiveBox.get('displayMode');
  bool hideTerminusTrain = globals.hiveBox.get('hideTerminusTrain');
  bool ungroupDepartures = globals.hiveBox.get('ungroupDepartures');
  bool allowGps = globals.hiveBox.get('allowGps');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor(context),
          title: const Text(
            'Options',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Segoe Ui',
                  color: Colors.white,
            ),
          ),
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
        backgroundColor: mainColor(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SettingsButton(
              name: 'Options d’itinéraires',
              icon: NavikaIcons.options,
              function: () {
                showModalBottomSheet<void>(
                    shape: const RoundedRectangleBorder(
                      borderRadius: bottomSheetBorder,
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) => const BottomRouteSettings());
              },
            ),

            SettingsButton(
              name: 'Position',
              sub: allowGps ? 'Autorisé' : 'Interdit',
              function: () {
                RouteStateScope.of(context).go('/position');
              },
              icon: NavikaIcons.localisation,
            ),
            
            SettingsButton(
              name: 'Temps d’attente',
              sub: displayMode == 'minutes'
                  ? 'Temps d’attente'
                  : displayMode == 'hour'
                      ? 'Heure de passage'
                      : 'Défaut',
              icon: NavikaIcons.clock,
              function: () {
                showModalBottomSheet<void>(
                  shape: const RoundedRectangleBorder(
                    borderRadius: bottomSheetBorder,
                  ),
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) => BottomSchedules(
                    isDeparture: true,
                    update: update,
                  ),
                );
              },
            ),
            SettingsButton(
              name: 'Terminus',
              sub: hideTerminusTrain ? 'Masqué' : 'Affiché',
              icon: NavikaIcons.train_face,
              function: () {
                showModalBottomSheet<void>(
                    shape: const RoundedRectangleBorder(
                      borderRadius: bottomSheetBorder,
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) =>
                        BottomTerminusTrain(update: update));
              },
            ),

            SettingsButton(
              name: 'Tableau des départs',
              sub: ungroupDepartures ? 'Non groupé' : 'Groupé',
              icon: NavikaIcons.group,
              function: () {
                showModalBottomSheet<void>(
                    shape: const RoundedRectangleBorder(
                      borderRadius: bottomSheetBorder,
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) =>
                        BottomGroupedDepartures(update: update));
              },
            ),

            if (kDebugMode)
              SettingsButton(
                name: 'Crash test',
                sub: 'Executer un crash test',
                icon: Icons.bug_report,
                function: () => throw Exception(),
              ),

            // ------------

            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: AssetImage('assets/img/logo/logo_large.png'),
                height: 30
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.white,
              ),
            ),
            SettingsLink(
              name: 'Github du projet ›',
              url: 'https://github.com/MaisClement/Navika_App',
              icon: NavikaIcons.github,
            ),
            SettingsLink(
              name: 'Icones par Icones8 ›',
              url: 'https://icones8.fr',
              icon: NavikaIcons.icons8,
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: const Text(
                'Par respect pour votre confidentialité, Navika ne conserve aucune information vous concernant.',
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${globals.NAME} 2023 • Version v${globals.VERSION}',
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
