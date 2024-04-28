// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/journey/lines.dart';

String getJourneyType(BuildContext context, String type) {
  switch (type) {
    case 'best':
      return AppLocalizations.of(context)!.best_emoji;
    case 'fastest':
      return AppLocalizations.of(context)!.fastest;
    case 'comfort':
      return AppLocalizations.of(context)!.comfort;
    case 'less_fallback_walk':
      return AppLocalizations.of(context)!.less_fallback_walk;
    default:
      return 'null';
  }
}

class RouteListButton extends StatelessWidget {
  final Map journey;
  final void Function() onTap;

  const RouteListButton({
    required this.journey,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (getJourneyType(context, journey['type']) != 'null')
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    getJourneyType(context, journey['type']),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: walkingColor(context),
                    ),
                  ),
                ),

              Row(
                children: [
                  const SizedBox(width: 25),
                  Column(
                    children: [
                      Text(
                        getStringTime(journey['departure_date_time']),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          color: accentColor(context),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        getStringTime(journey['arrival_date_time']),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          color: accentColor(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  RouteLines(
                    sections: filterSection(journey['sections']),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 5),
                    color: Theme.of(context).colorScheme.surface,
                    child: Row(
                      children: getDurationWidget(journey['duration'], context),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                color: getShimmerBaseColor(context),
                height: 1,
              )
            ],
          ),
        ),
      );
}
