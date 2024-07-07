// 🐦 Flutter imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// 🌎 Project imports:
import 'package:navika/src/data/app.dart' as app;
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/grouped_departures.dart';
import 'package:navika/src/widgets/bottom_sheets/route_options.dart';
import 'package:navika/src/widgets/bottom_sheets/terminus_trains.dart';
import 'package:navika/src/widgets/bottom_sheets/theme_mode.dart';
import 'package:navika/src/widgets/bottom_sheets/time.dart';
import 'package:navika/src/widgets/home/widget/sponsor.dart';
import 'package:navika/src/widgets/settings/button.dart';
import 'package:navika/src/widgets/settings/link.dart';
import 'package:navika/src/widgets/utils/button_large.dart';

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

  String displayMode = globals.hiveBox.get('displayMode');
  bool hideTerminusTrain = globals.hiveBox.get('hideTerminusTrain');
  bool ungroupDepartures = globals.hiveBox.get('ungroupDepartures');
  bool allowGps = globals.hiveBox.get('allowGps');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor(context),
          title: Text(AppLocalizations.of(context)!.settings,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: fontFamily,
                  color: Colors.white,
            ),
          ),
          leading: closeLeadingAppBar(context),
        ),
        backgroundColor: mainColor(context),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SettingsButton(
              name: AppLocalizations.of(context)!.settings_journeys,
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
              name: AppLocalizations.of(context)!.settings_position,
              sub: allowGps ? AppLocalizations.of(context)!.allowed : AppLocalizations.of(context)!.forbidden,
              function: () {
                RouteStateScope.of(context).go('/position');
              },
              icon: NavikaIcons.localisation,
            ),
                        
            SettingsButton(
              name: AppLocalizations.of(context)!.waiting_time,
              sub: displayMode == 'minutes'
                  ? AppLocalizations.of(context)!.waiting_time
                  : displayMode == 'hour'
                      ? AppLocalizations.of(context)!.passing_time
                      : AppLocalizations.of(context)!.defaut,
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
              name: AppLocalizations.of(context)!.settings_terminus,
              sub: hideTerminusTrain ? AppLocalizations.of(context)!.hidden : AppLocalizations.of(context)!.showed,
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
              name: AppLocalizations.of(context)!.departure_table,
              sub: ungroupDepartures ? AppLocalizations.of(context)!.not_grouped : AppLocalizations.of(context)!.grouped,
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
              name: AppLocalizations.of(context)!.notifications,
              sub: AppLocalizations.of(context)!.settings_notifications,
              icon: NavikaIcons.bell,
              function: () {
                RouteStateScope.of(context).go('/settings/notifications');
              },
            ),

            SettingsButton(
              name: AppLocalizations.of(context)!.settings_theme,
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

            // ------------

            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ButtonLarge(
                icon: NavikaIcons.stars,
                text: AppLocalizations.of(context)!.what_new,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  RouteStateScope.of(context).go('/changes');
                },
              ),
            ),

            HomeWidgetSponsor(
              backgroundColor: Colors.white,
              color: Colors.black,
            ),

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
                '${app.NAME} 2023 - ${DateTime.now().year} • Made with 💖',
                style: TextStyle(
                  fontFamily: fontFamily,
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
              name: AppLocalizations.of(context)!.settings_link_state,
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
              name: AppLocalizations.of(context)!.settings_link_repository_link,
              url: 'https://github.com/MaisClement/Navika_App',
              icon: NavikaIcons.github,
            ),
            SettingsLink(
              name: AppLocalizations.of(context)!.settings_link_icons,
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
              child: Text(
                AppLocalizations.of(context)!.details_privacy,
                style: TextStyle(
                  fontFamily: fontFamily,
                  color: Colors.white,
                ),
              ),
            ),
            SettingsLink(
              name: AppLocalizations.of(context)!.settings_link_legals,
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
              child: Text(
                AppLocalizations.of(context)!.details_OSM,
                style: TextStyle(
                  fontFamily: fontFamily,
                  color: Colors.white,
                ),
              ),
            ),
            SettingsLink(
              name: AppLocalizations.of(context)!.settings_link_OSM_licence,
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
              child: Text(
                AppLocalizations.of(context)!.details_HERE,
                style: TextStyle(
                  fontFamily: fontFamily,
                  color: Colors.white,
                ),
              ),
            ),
            SettingsLink(
              name: AppLocalizations.of(context)!.settings_link_HERE_privacy,
              url: 'https://legal.here.com/fr-fr/privacy/here-sdk-privacy-supplement',
            ),
            SettingsLink(
              name: AppLocalizations.of(context)!.settings_link_HERE_licence,
              url: 'https://app.navika.hackernwar.com/here_notice_android.php',
            ),

            const SizedBox(
              height: 10,
            ),
            
            Container(
              color: Colors.white.withOpacity(0.2),
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Navika • v${app.VERSION}-${app.BUILD_NUMBER} • ${app.PACKAGE_NAME}',
                    style: TextStyle(
                      fontFamily: fontFamily,
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
