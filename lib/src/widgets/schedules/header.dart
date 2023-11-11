import 'package:flutter/material.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/bottom_sheets/add_favorite.dart';

class SchedulesPannel extends StatelessWidget {
  final String id;

  const SchedulesPannel({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) => WillPopScope (
    onWillPop:() async{
      RouteStateScope.of(context).go('/home');
      return false;
    },
    child: Container(
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
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 48),
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
                    icon: isFavorite(id)
                      ? const Icon(NavikaIcons.favorites)
                      : const Icon(NavikaIcons.add_bookmark),
                    tooltip: 'Ajouter aux favoris',
                    color: Theme.of(context).colorScheme.onSurface,
                    onPressed: () {
                      if (globals.schedulesStopLines.isNotEmpty) {
                        showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                            borderRadius: bottomSheetBorder,
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) => BottomAddFavorite(
                            id: id,
                            name: globals.schedulesStopName,
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
        ),
  );
}
