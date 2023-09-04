import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';
import 'package:navika/src/widgets/utils/select_tiles_mini.dart';
import 'package:navika/src/widgets/utils/time_box.dart';
import 'package:navika/src/data/global.dart' as globals;

bool isAlertLine(id) {
  Map favs = globals.hiveBox?.get('linesAlert');

  if (favs.isNotEmpty && favs[id] != null) {
    return true;
  }
  return false;
}

Map? getAlert(id) {
  List favs = globals.hiveBox?.get('linesAlert');

  if (favs.isNotEmpty && favs[id] != null) {
    return favs[id];
  }
  return null;
}

class NotificationsSettings extends StatefulWidget {
  final Map line;
  final bool isAlert;

  const NotificationsSettings({
    required this.line,
    this.isAlert = false,
    super.key,
  });

  @override
  State<NotificationsSettings> createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> with SingleTickerProviderStateMixin {

  String type = 'alert';  // alert, all

  Map days = {
    'monday' : true,     // 0, 1
    'tuesday' : true,    //
    'wednesday' : true,  //
    'thursday' : true,   //
    'friday' : true,     //
    'saturday' : false,   //
    'sunday' : false,     //
  };

  Map times = {
    'start_time' : const TimeOfDay(hour: 7, minute: 0),
    'end_time' : const TimeOfDay(hour: 18, minute: 0),
  };

  void setType(value) {
    setState(() {
      type = value;
    });
  }

  void setDays(key, value) {
    setState(() {
      days[key] = value;
    });
  }

  Future<void> subscribe() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.addNotificationSubscription(widget.line['id'], type, days, times['start_time'], times['end_time']);

    if (mounted) {
      setState(() {
        ApiStatus error = result['status'];

        if ( error != ApiStatus.ok) {
          FloatingSnackBar(
            message: getErrorText(error),
            context: context,
            textColor: mainColor(context),
            textStyle: snackBarText,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: const Color(0xff272727),
          );
        } else {
          if (result['value'] != null) {
            Map alert = globals.hiveBox.get('linesAlert');
            alert[result['value']['line']] = result['value'];
            globals.hiveBox.put('linesAlert', alert);
          }
          Navigator.of(context).pop();

        }
      });
    }
  }

  Future<void> unsubscribe() async {
    NavikaApi navikaApi = NavikaApi();

    Map alert = globals.hiveBox.get('linesAlert');
    var id = alert[widget.line['id']]['id'];

    Map result = await navikaApi.removeNotificationSubscription(id);

    if (mounted) {
      setState(() {
        ApiStatus error = result['status'];

        if ( error != ApiStatus.ok) {
          FloatingSnackBar(
            message: getErrorText(error),
            context: context,
            textColor: mainColor(context),
            textStyle: snackBarText,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: const Color(0xff272727),
          );
        } else {
          if (result['value'] != null) {
            Map alert = globals.hiveBox.get('linesAlert');
            alert[result['value']['line']] = null;
            globals.hiveBox.put('linesAlert', alert);
          }
          Navigator.of(context).pop();

        }
      });
    }
  }

  selectTime(String type, BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: times[type],
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null && picked != times[type]) {
      setState(() {
        times[type] = picked;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) => Container(
    height: widget.isAlert ? 570 : 530,
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
              widget.isAlert ? 'Modifier une alerte' : 'Créer une alerte',
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

            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              child: Text('Type de l’alerte',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                  color: accentColor(context),
                ),
              ),
            ),
            
            RadioTiles(
              tiles: const [
                {
                  'name': 'Perturbations',
                  'value': 'alert',
                  'icon': NavikaIcons.alert
                },
                {
                  'name': 'Perturbations et travaux',
                  'value': 'all',
                  'icon': NavikaIcons.work
                },
              ],
              value: type,
              onTileChange: (value) {
                setType(value);
              },
            ),

            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text('Jours de l’alerte',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                  color: accentColor(context),
                ),
              ),
            ),
            
            MiniSelectTiles(
              tiles: const [
                {
                  'name': 'L',
                  'value': 'monday',
                },
                {
                  'name': 'M',
                  'value': 'tuesday',
                },
                {
                  'name': 'M',
                  'value': 'wednesday',
                },
                {
                  'name': 'J',
                  'value': 'thursday',
                },
                {
                  'name': 'V',
                  'value': 'friday',
                },
                {
                  'name': 'S',
                  'value':'saturday',
                },
                {
                  'name': 'D',
                  'value':'sunday',
                }
              ],
              value: days,
              onTileChange: (key, value) {
                setDays(key, value);
              },
            ),

            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text('Plage horaire',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                  color: accentColor(context),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeBox(
                  text: getTime(times['start_time']),
                  icon: NavikaIcons.clock,
                  onTap: () async {
                    await selectTime('start_time', context);
                    setState(() {});
                  },
                ),
            
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Icon(
                    NavikaIcons.avance,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
            
                TimeBox(
                  text: getTime(times['end_time']),
                  icon: NavikaIcons.clock,
                  onTap: () async {
                    await selectTime('end_time', context);
                    setState(() {});
                  },
                )
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            Center(
              child: IconElevatedButton(
                icon: widget.isAlert ? NavikaIcons.edit : NavikaIcons.plus,
                width: 138,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: const Color(0xffffffff),
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                text: widget.isAlert ? 'Modifier' : 'Créer',
                onPressed: () async {
                  await subscribe();
                }
              ),
            ),

            if (widget.isAlert) 
              Center(
              child: IconElevatedButton(
                icon: NavikaIcons.trash,
                width: 138,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffeb2031),
                  foregroundColor: const Color(0xffffffff),
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                text: 'Supprimer',
                onPressed: () async {
                  await unsubscribe();
                }
              ),
            ),

            Center(
              child: IconElevatedButton(
                icon: NavikaIcons.cancel,
                width: 138,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  text: 'Annuler',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        )
      )
  );
}
