// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/extensions/datetime.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/journey/favorite.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

List<Widget> buildFavorites(List journeys, update, context) {
  journeys = sortJourneys(journeys);
  List<Widget> widgets = [];

  DateTime? date;
  String d = '';

  for (int i = 0; i < journeys.length; i++) {
    if (i > 0 && DateTime.parse(journeys[i]['departure_date_time']).isSameDate( DateTime.parse(journeys[i - 1]['departure_date_time']))) {
      // Do rien :D
    } else {
      date = DateTime.parse(journeys[i]['departure_date_time']);

      if (date.isToday()) {
        d = AppLocalizations.of(context)!.today;
      } else if (date.isTomorrow()) {
        d = AppLocalizations.of(context)!.tomorrow;
      } else {
        d = '${date.day} ${getLongMonth(context)[date.month]}';
      }
      
      widgets.add(
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
          child: Row(
            children: [
              Icon(NavikaIcons.calendar,
                  color: accentColor(context), size: 25),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  d,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: fontFamily,
                    color: accentColor(context),
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
            ],
          ),
        )
      );
    }

    widgets.add(
      RouteFavorite(
        journey: journeys[i],
        update: update
      ),
    );
  }

  return widgets;
}

class RouteFavorites extends StatelessWidget {
  final List journeys;
  final Function update;

  const RouteFavorites({
    required this.journeys,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            
            if (journeys.isEmpty)
              Container(
                key: const ValueKey('nothing'),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage(
                        'assets/img/journeys.png',
                      ),
                      width: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.no_saved_routes,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IconElevatedButton(
                      icon: NavikaIcons.search,
                      text: AppLocalizations.of(context)!.search,
                      onPressed: () => initJourney(null, null, context),
                    ),
                  ],
                ),
              )
            else
              ...buildFavorites(journeys, update, context)
            ],
        ),
      );
}
