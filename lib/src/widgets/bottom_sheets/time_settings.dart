import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/utils/search_box.dart';

class TimeSettings extends StatelessWidget {
  final StateSetter setState;
  final Function selectDate;
  final Function selectTime;
  final Function setTimeType;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final String timeType;

  const TimeSettings({
    required this.setState,
    required this.selectDate,
    required this.selectTime,
    required this.setTimeType,
    required this.selectedDate,
    required this.selectedTime,
    required this.timeType,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) => Container(
    height: 370,
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
              'Modifier l’heure',
              style: TextStyle(
                fontSize: 20,
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
            RadioTiles(
              tiles: const [
                {
                  'name': 'Départ à',
                  'value': 'departure',
                  'icon': NavikaIcons.departure
                },
                {
                  'name': 'Arrivée à',
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
                text: getDate(selectedDate),
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
                text: getTime(selectedTime),
                icon: NavikaIcons.clock,
                onTap: () async {
                  await selectTime(context);
                  setState(() {});
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Fermer'),
                onPressed: () => Navigator.pop(context),
              ),  
            )
          ],
        )
      )
  );
}
