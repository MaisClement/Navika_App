// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/add_favorite.dart';
import 'package:navika/src/widgets/schedules/body.dart';

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
  final String id;

  const SchedulesDetails({required this.id, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: getNavigationBar(context),
        appBar: AppBar(
          title: Text(globals.schedulesStopName, style: appBarTitle),
          actions: [
            IconButton(
              icon: isFavorite(id)
                  ? const Icon(NavikaIcons.favorites)
                  : const Icon(NavikaIcons.addBookmark),
              tooltip: AppLocalizations.of(context)!.add_to_favorites,
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
        body: SchedulesBody(scrollController: ScrollController(), id: id),
      );
}
