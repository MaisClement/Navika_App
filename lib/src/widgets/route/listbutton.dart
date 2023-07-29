import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/route/lines.dart';

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
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 15),
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
                    sections: journey['sections'],
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
