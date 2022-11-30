import 'package:flutter/material.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/widgets/bottom_add_favorite.dart';
import 'package:navika/src/widgets/schedules/body.dart';
import '../data/global.dart' as globals;
import '../style/style.dart';

bool isFavorite(id) {
  List favs = globals.hiveBox?.get('stopsFavorites') ?? [];

  if (favs.isNotEmpty) {
    for (var fav in favs) {
      if (fav['id'] == id) {
        return true;
      } 
    }
  }
  return false;
}
bool isFavoriteLine(id, line) {
  List favs = globals.hiveBox?.get('stopsFavorites') ?? [];

  if (favs.isNotEmpty) {
    for (var fav in favs) {
      if (fav['id'] == id && fav['line'] == line) {
        return true;
      } 
    }
  }
  return false;
}

class SchedulesDetails extends StatelessWidget {
  final String? navPos;

  const SchedulesDetails({this.navPos, super.key});
            
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text(globals.schedulesStopName,
              style: appBarTitle
            ),
      actions: [
        IconButton(
          icon: isFavorite(globals.schedulesStopArea) ? const Icon(Scaffold_icon.star) : const Icon(Scaffold_icon.star_regular),
          tooltip: 'Ajouter aux favoris',
          onPressed: () {
            showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                isScrollControlled: true,
                context: context, 
                builder: (BuildContext context) => 
                  BottomAddFavorite(
                    id: globals.schedulesStopArea,
                    name: globals.schedulesStopName,
                    lines: globals.schedulesStopLines,
                  ));
          },
        ),
      ]
    ),
    body: SchedulesBody(
      scrollController: ScrollController()
    )
  );
}