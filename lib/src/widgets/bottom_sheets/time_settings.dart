// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';
import 'package:navika/src/widgets/utils/search_box.dart';

class TimeSettings extends StatelessWidget {
  final StateSetter setState;
  final Function selectDate;
  final Function selectTime;
  final Function setTimeType;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final Function update;
  final String timeType;

  const TimeSettings({
    required this.setState,
    required this.selectDate,
    required this.selectTime,
    required this.setTimeType,
    required this.selectedDate,
    required this.selectedTime,
    required this.update,
    required this.timeType,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5)
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor(context).withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ]
      ),
      child: Container(
        padding: const EdgeInsets.only(left:20.0, top:30.0, right:20.0, bottom:10.0), 
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(
                AppLocalizations.of(context)!.modify_time,
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
              RadioTiles(
                tiles: [
                  {
                    'name': AppLocalizations.of(context)!.departing_at,
                    'value': 'departure',
                    'icon': NavikaIcons.departure
                  },
                  {
                    'name': AppLocalizations.of(context)!.arriving_at,
                    'value': 'arrival',
                    'icon': NavikaIcons.arrival
                  },
                ],
                value: timeType,
                onTileChange: (value) {
                  setTimeType(value);
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                child: SearchBox(
                  text: getDate(context, selectedDate),
                  icon: NavikaIcons.calendar,
                  onTap: () async {
                    await selectDate(context);
                    setState(() {});
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                child: SearchBox(
                  text: getTodTime(selectedTime),
                  icon: NavikaIcons.clock,
                  onTap: () async {
                    await selectTime(context);
                    setState(() {});
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.validate),
                  onPressed: () {
                    update();
                    Navigator.pop(context);
                  },
                ),  
              )
            ],
          )
        )
    ),
  );
}
