import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/route/lines.dart';

String getTime(String time) {
  DateTime dttime = DateTime.parse(time);
  String dthour = dttime.hour < 10 ? '0${dttime.hour}' : dttime.hour.toString();
  String dtminute =
      dttime.minute < 10 ? '0${dttime.minute}' : dttime.minute.toString();
  return '$dthour:$dtminute';
}

TextStyle getTextStyle(context, int size) {
  return TextStyle(
    fontSize: size.toDouble(),
    fontWeight: FontWeight.w600,
    fontFamily: 'Segoe Ui',
    color: accentColor(context),
  );
}

List<Widget> getDurationWidget(int d, context) {
  Duration duration = Duration(seconds: d);
  List<Widget> res = [];

  if (duration.inMinutes >= 60) {
    res.add(
        Text(duration.inHours.toString(), style: getTextStyle(context, 24)));

    res.add(Text('h', style: getTextStyle(context, 10)));

    res.add(Text(
        duration.inMinutes.remainder(60) < 10
            ? '0${duration.inMinutes.remainder(60).toString()}'
            : duration.inMinutes.remainder(60).toString(),
        style: getTextStyle(context, 24)));
  } else {
    res.add(Text(duration.inMinutes.remainder(60).toString(),
        style: getTextStyle(context, 24)));

    res.add(Text('mn', style: getTextStyle(context, 10)));
  }

  return res;
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
          padding:
              const EdgeInsets.only(left: 5, top: 12.0, right: 0.0, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 15),
                  Column(
                    children: [
                      Text(
                        getTime(journey['departure_date_time']),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          color: accentColor(context),
                        ),
                      ),
                      Text(
                        getTime(journey['arrival_date_time']),
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
                    color: backgroundColor(context),
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
                height: 1,
                decoration: BoxDecoration(color: dividerColor(context)),
              ),
            ],
          ),
        ),
      );
}
