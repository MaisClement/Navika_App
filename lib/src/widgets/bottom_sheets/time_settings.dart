import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';
import 'package:navika/src/data/global.dart' as globals;

class TimeSettings extends StatefulWidget {
  const TimeSettings({
    super.key,
  });

  @override
  State<TimeSettings> createState() => _TimeSettingsState();
}

class _TimeSettingsState extends State<TimeSettings>
    with SingleTickerProviderStateMixin {
  String timeType = globals.hiveBox.get('timeType');


  void setTimeType(String type) {
    globals.hiveBox.put('timeType', type);
    setState(() {
      timeType = type;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) => Container(
    height: 225,
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
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 30.0,
        right: 20.0,
        bottom: 10.0
      ),
      child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(
              "Modifier l'heure",
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
                  'name': 'De départ',
                  'value': 'departure',
                },
                {
                  'name': "D'arrivé",
                  'value': 'arrival',
                },
              ],
              value: timeType,
              onTileChange: (value) {
                setTimeType(value);
              },
            )
          ],
        )
      )
  );
}
