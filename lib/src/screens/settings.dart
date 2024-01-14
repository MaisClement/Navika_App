import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/data/app.dart' as app;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/bottom_sheets/grouped_departures.dart';
import 'package:navika/src/widgets/bottom_sheets/route_options.dart';
import 'package:navika/src/widgets/bottom_sheets/terminus_trains.dart';
import 'package:navika/src/widgets/bottom_sheets/theme_mode.dart';
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
  int tap = 0;

  void update() {
    setState(() {
      displayMode = globals.hiveBox.get('displayMode');
      hideTerminusTrain = globals.hiveBox.get('hideTerminusTrain');
      ungroupDepartures = globals.hiveBox.get('ungroupDepartures');
      allowGps = globals.hiveBox.get('allowGps');
    });
  }

  void handleTap() {
    setState(() {
      tap++;
    });
    if (tap == 7) {

      if (globals.hiveBox.get('useSerin') ) {
        const snackBar = SnackBar(
          content: Text('process::serin_work (serin.exe:69) run into an error'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        globals.hiveBox.put('useSerin', false);

      } else {
        const snackBar = SnackBar(
          content: Text('app.easter.setSerinActive() run successfully !'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        globals.hiveBox.put('useSerin', true);
      }

      
    }
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
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
              icon: NavikaIcons.trainFace,
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

            SettingsButton(
              name: 'Notifications',
              sub: 'Gérez vos notifications',
              icon: NavikaIcons.bell,
              function: () {
                RouteStateScope.of(context).go('/settings/notifications');
              },
            ),

            SettingsButton(
              name: 'Theme',
              icon: Icons.color_lens,
              function: () {
                showModalBottomSheet<void>(
                    shape: const RoundedRectangleBorder(
                      borderRadius: bottomSheetBorder,
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) =>
                        const BottomThemeMode());
              },
            ),

            if (kDebugMode)
              SettingsButton(
                name: 'Crash test',
                sub: 'Executer un crash test',
                icon: Icons.bug_report_outlined,
                function: () => throw Exception(),
              ),

            // ------------

            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 10),
                  child: Image(
                    image: AssetImage('assets/img/logo/logo_large.png'),
                    height: 30
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Text(
                '${app.name} 2023 - ${DateTime.now().year} • Made with 💖',
                style: const TextStyle(
                  fontFamily: 'Segoe Ui',
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.white,
              ),
            ),
            SettingsLink(
              name: 'Status ›',
              url: 'https://navika.betteruptime.com',
              icon: NavikaIcons.alert,
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
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: const Text(
                'Par respect pour votre confidentialité, Navika ne collecte ou ne conserve aucune information personnelles vous concernant.',
                style: TextStyle(
                  fontFamily: 'Segoe Ui',
                  color: Colors.white,
                ),
              ),
            ),
            SettingsLink(
              name: 'Mentions légales ›',
              url: 'http://app.navika.hackernwar.com/legal.php',
            ),
            

            // OSM
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: const Text(
                'Les données geographiques utilisées par Navika sont fourni par OpenStreetMap et ses contributeurs.',
                style: TextStyle(
                  fontFamily: 'Segoe Ui',
                  color: Colors.white,
                ),
              ),
            ),
            SettingsLink(
              name: 'Licence OpenStreetMap ›',
              url: 'https://www.openstreetmap.org/copyright/fr/',
            ),
            
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: const Text(
                'Navika repose sur des technologies et services de « HERE Global B.V.».',
                style: TextStyle(
                  fontFamily: 'Segoe Ui',
                  color: Colors.white,
                ),
              ),
            ),
            SettingsLink(
              name: 'Politique de confidentialité HERE ›',
              url: 'https://legal.here.com/fr-fr/privacy/here-sdk-privacy-supplement',
            ),
            SettingsLink(
              name: 'Licences HERE ›',
              url: 'https://app.navika.hackernwar.com/here_notice_android.php',
            ),

            const SizedBox(
              height: 10,
            ),
            
            InkWell(
              onTap: () => handleTap(),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Navika • Version v${app.version}-${app.buildNumber} • ${app.packageName}',
                      style: const TextStyle(
                        fontFamily: 'Segoe Ui',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
