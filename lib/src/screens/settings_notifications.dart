import 'package:flutter/material.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/routes_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/notifications.dart';
import 'package:navika/src/widgets/lines/listbutton.dart';


class SettingsNotification extends StatefulWidget {
  const SettingsNotification({super.key});

  @override
  State<SettingsNotification> createState() => _SettingsNotificationState();
}

class _SettingsNotificationState extends State<SettingsNotification> {
  List favs = globals.hiveBox?.get('linesFavorites');

  void update() {
    setState(() {
      favs = globals.hiveBox?.get('linesFavorites');
      favs = favs.where((fav) => isAlertLine(fav['id'])).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      update();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor(context),
          title: const Text(
            'Notifications',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Segoe Ui',
                  color: Colors.white,
            ),
          ),
          leading: GestureDetector(
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: mainColor(context),
        body: ListView(
          children: [
            if (favs.isEmpty)
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                child: const Column(
                  children: [
                    Icon(
                      NavikaIcons.telescope,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text(
                      'Nous n’avons rien trouvé...',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe Ui',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            else
              for (var fav in favs)
                LinesListButton(
                  isLight: true,
                  isLoading: false,
                  line: fav,
                  onTap: () => addNotification(fav, true, context),
                )
          ],
        ),
      );
}
