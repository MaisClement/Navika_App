// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';
import 'package:navika/src/widgets/utils/switch_mode.dart';

class BottomRouteSettings extends StatefulWidget {
  final StateSetter? setState;

  const BottomRouteSettings({
    this.setState,
    super.key,
  });

  @override
  State<BottomRouteSettings> createState() => _BottomRouteSettingsState();
}

class _BottomRouteSettingsState extends State<BottomRouteSettings> with SingleTickerProviderStateMixin {
  String travelerType = globals.hiveBox.get('travelerType');

  List allowedModes = globals.hiveBox.get('allowedModes');


  void setTravelerType(String type) {
    globals.hiveBox.put('travelerType', type);
    setState(() {
      travelerType = type;
    });
    if (widget.setState!= null) {
      widget.setState!(() {});
    }
  }

  void handleChangeMode(String type, bool value) {
    if (value) {
      setState(() {
        allowedModes.add(type);
      });
    } else {
      setState(() {
        allowedModes.removeWhere((item) => item == type);
      });
    }
    globals.hiveBox.put('allowedModes', allowedModes);
    if (widget.setState!= null) {
      widget.setState!(() {});
    }
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: accentColor(context).withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ]),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.settings_journeys,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily,
                color: accentColor(context),
              ),
            ),
            Divider(
              color: accentColor(context),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.traveler_profile,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily,
                color: accentColor(context),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RadioTiles(
              tiles: [
                {
                  'name': AppLocalizations.of(context)!.defaut,
                  'value': 'standard',
                  'icon': NavikaIcons.walking,
                },
                {
                  'name': AppLocalizations.of(context)!.reduced_mobility,
                  'value': 'luggage',
                  'icon': NavikaIcons.oldMan,
                },
                {
                  'name': AppLocalizations.of(context)!.wheelchair,
                  'value': 'wheelchair',
                  'icon': NavikaIcons.wheelchair,
                },
              ],
              value: travelerType,
              onTileChange: (value) {
                setTravelerType(value);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Divider(
              color: accentColor(context),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.transportation_mode,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily,
                color: accentColor(context),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SwitchMode(
              name: AppLocalizations.of(context)!.rail,
              value: allowedModes.contains('rail'),
              icon: NavikaIcons.trainFace,
              function: (bool value) {
                handleChangeMode('rail', value);
              },
            ),
            SwitchMode(
              name: AppLocalizations.of(context)!.metro,
              value: allowedModes.contains('metro'),
              icon: NavikaIcons.metro,
              function: (bool value) {
                handleChangeMode('metro', value);
              },
            ),
            SwitchMode(
              name: AppLocalizations.of(context)!.tramway,
              value: allowedModes.contains('tram'),
              icon: NavikaIcons.idfmTram,
              function: (bool value) {
                handleChangeMode('tram', value);
              },
            ),
            SwitchMode(
              name: AppLocalizations.of(context)!.bus,
              value: allowedModes.contains('bus'),
              icon: NavikaIcons.idfmBus,
              function: (bool value) {
                handleChangeMode('bus', value);
              },
            ),
            SwitchMode(
              name: AppLocalizations.of(context)!.cable_car,
              value: allowedModes.contains('cable'),
              icon: NavikaIcons.idfmCable,
              function: (bool value) {
                handleChangeMode('cable', value);
              },
            ),
            // SwitchMode(
            //   name: AppLocalizations.of(context)!.shuttle,
            //   value: allowedModes.contains('funicular'),
            //   icon: NavikaIcons.trainFace,
            //   function: (bool value) {
            //     handleChangeMode('funicular', value);
            //   },
            // ),
            SwitchMode(
              name: AppLocalizations.of(context)!.boat,
              value: allowedModes.contains('boat'),
              icon: NavikaIcons.idfmBoat,
              function: (bool value) {
                handleChangeMode('boat', value);
              },
            ),
    
            // ['rail', 'metro', 'tram', 'bus', 'cable', 'funicular', 'boat']
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context)!.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
