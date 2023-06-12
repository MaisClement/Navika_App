import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:navika/src/data/global.dart' as globals;

class BottomRouteSettings extends StatefulWidget {
  const BottomRouteSettings({
    super.key,
  });

  @override
  State<BottomRouteSettings> createState() => _BottomRouteSettingsState();
}

class _BottomRouteSettingsState extends State<BottomRouteSettings>
    with SingleTickerProviderStateMixin {
  String travelerType = globals.hiveBox.get('TravelerType') ?? 'standard';

  setTravelerType(String type) {
    globals.hiveBox.put('TravelerType', type);
    setState(() {
      travelerType = type;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
            top: MediaQueryData.fromView(WidgetsBinding.instance.window)
                .padding
                .top),
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
          padding: const EdgeInsets.only(
              left: 20.0, top: 30.0, right: 20.0, bottom: 10.0),
          child: ListView(
            children: [
              
              Text(
                "Options d'itinéraires",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                  color: accentColor(context),
                ),
              ),
              Divider(
                color: accentColor(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(children: [
                Text(
                  'Profil de voyageur',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    color: accentColor(context),
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              RadioTiles(
                tiles: const [
                  {
                    'name': 'Défaut',
                    'value': 'standard',
                    'icon': NavikaIcons.walking,
                  },
                  {
                    'name': 'Avec difficultés',
                    'value': 'luggage',
                    'icon': NavikaIcons.old_man,
                  },
                  {
                    'name': 'Mobilité réduite',
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
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    foregroundColor: const Color(0xffffffff),
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  child: const Text('Annuler'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      );
}
