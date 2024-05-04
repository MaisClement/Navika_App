// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/bottom_sheets/remove_journeys.dart';
import 'package:navika/src/widgets/journey/lines.dart';

class RouteFavorite extends StatelessWidget {
  final Map journey;
  final Function update;

  const RouteFavorite({
    required this.journey,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(
      bottom: 20,
    ),
    child: InkWell(
        onTap: () => RouteStateScope.of(context).go('/home/journeys/get/${journey['unique_id']}',),
        onLongPress:  () {
          showModalBottomSheet<void>(
            shape: const RoundedRectangleBorder(
              borderRadius: bottomSheetBorder,
            ),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) =>
              BottomRemoveJourneys(
                id: journey['unique_id'],
                update: update,
              ));
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        getStringTime(journey['departure_date_time']),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                          color: accentColor(context),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        getStringTime(journey['arrival_date_time']),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                          color: accentColor(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        journey['sections'][0]['from']['name'],
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                          color: accentColor(context),
                        ),
                      ),
                      
                      const SizedBox(height: 5),

                      Text('➜ ${journey['sections'][journey['sections'].length - 1]['from']['name']}',
                        style: TextStyle(
                          fontSize: 17,
                          color: accentColor(context),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      RouteLines(
                        sections: filterSection(journey['sections']),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
  );
}
