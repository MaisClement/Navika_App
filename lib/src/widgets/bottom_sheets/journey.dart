// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/journey_recurrent.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';

class BottomJourney extends StatefulWidget {
  final Map journey;

  const BottomJourney({
    required this.journey,
    super.key,
  });

  @override
  State<BottomJourney> createState() => _BottomJourneyState();
}

class _BottomJourneyState extends State<BottomJourney> with SingleTickerProviderStateMixin {
  
  String type = ''; // punctual, recurrent

  void setType(value) {
    if (value == 'punctual') {
      saveJourney(journey['unique_id'], context);
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
          borderRadius: bottomSheetBorder,
        ),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) =>
          BottomRecurrentJourney(
            journey: journey
          )
        ); 
    }
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: accentColor(context).withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2),
              )
            ]),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.save_trip,
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
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      AppLocalizations.of(context)!.route_type,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: fontFamily,
                        color: accentColor(context),
                      ),
                    ),
                  ),
                  RadioTiles(
                    tiles: [
                      const {
                        'name': 'Trajet ponctuel',
                        'value': 'punctual',
                        'icon': NavikaIcons.calendar
                      },
                      {
                        'name': AppLocalizations.of(context)!.regular_route,
                        'value': 'recurrent',
                        'icon': NavikaIcons.futur
                      },
                    ],
                    value: type,
                    onTileChange: (value) {
                      setType(value);
                    },
                  ),
                ],
              )
            ),
            Center(
              child: IconElevatedButton(
                icon: NavikaIcons.cancel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: const Color(0xffffffff),
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                text: AppLocalizations.of(context)!.cancel,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        )),
  );
}
