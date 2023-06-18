import 'package:flutter/material.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/bottom_sheets/add_favorite.dart';

class SchedulesPannel extends StatelessWidget {
  final void Function()? tooglePanel;

  const SchedulesPannel({
    required this.tooglePanel,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: accentColor(context).withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            GestureDetector(
              onTap: tooglePanel,
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48,
                ),
                Text(
                  globals.schedulesStopName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    color: accentColor(context),
                  ),
                ),
                IconButton(
                  icon: isFavorite(globals.schedulesStopArea)
                    ? const Icon(NavikaIcons.favorites)
                    : const Icon(NavikaIcons.add_bookmark),
                  tooltip: 'Ajouter aux favoris',
                  onPressed: () {
                    if (globals.schedulesStopLines.isNotEmpty) {
                      showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: bottomSheetBorder,
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) => BottomAddFavorite(
                          id: globals.schedulesStopArea,
                          name: globals.schedulesStopName,
                          modes: globals.schedulesStopModes,
                          lines: globals.schedulesStopLines,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      );
}
