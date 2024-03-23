import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/add_favorite.dart';
import 'package:navika/src/data/global.dart' as globals;

class SchedulesPannel extends StatelessWidget {
  final String id;

  const SchedulesPannel({
    required this.id,
    super.key,
  });

	@override
	Widget build(BuildContext context) => SizedBox(
    width: MediaQuery.of(context).size.width,
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

        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Retour',
                color: accentColor(context),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(globals.schedulesStopName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: accentColor(context),
                    ),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              IconButton(
                icon: isFavorite(id)
                  ? const Icon(NavikaIcons.favorites)
                  : const Icon(NavikaIcons.addBookmark),
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
        ),

      ],
    ),
  );
}