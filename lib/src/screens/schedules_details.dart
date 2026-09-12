// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/add_favorite.dart';
import 'package:navika/src/widgets/bottom_sheets/grouped_departures.dart';
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

class SchedulesDetails extends StatefulWidget {
  final String id;

  const SchedulesDetails({
    required this.id,
    super.key,
  });

  @override
  State<SchedulesDetails> createState() => _SchedulesDetailsState();
}

class _SchedulesDetailsState extends State<SchedulesDetails> {
  bool ungroupDepartures = globals.hiveBox.get('ungroupDepartures');

  updateUngroupDepartures() {
    setState(() {
      ungroupDepartures = globals.hiveBox.get('ungroupDepartures');
    });
  }

  askForUngroupDepartures() {
    bool askForUngroupDepartures = globals.hiveBox.get('askForUngroupDepartures');
    if (askForUngroupDepartures == false && widget.id.startsWith('SNCF:')) {
      showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
          borderRadius: bottomSheetBorder,
        ),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) => BottomGroupedDepartures(update: updateUngroupDepartures),
      );
      globals.hiveBox.put('askForUngroupDepartures', true);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

    askForUngroupDepartures();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: getNavigationBar(context),
        appBar: AppBar(
          title: Text(globals.schedulesStopName, style: appBarTitle),
          actions: [
            IconButton(
              icon: const Icon(NavikaIcons.group),
              // tooltip: AppLocalizations.of(context)!.refresh,
              onPressed: () {
                showModalBottomSheet<void>(
                  shape: const RoundedRectangleBorder(
                    borderRadius: bottomSheetBorder,
                  ),
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) => BottomGroupedDepartures(update: updateUngroupDepartures),
                );
              },
            ),
            IconButton(
              icon: isFavorite(widget.id) ? const Icon(NavikaIcons.favorites) : const Icon(NavikaIcons.addBookmark),
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
                      id: widget.id,
                      name: globals.schedulesStopName,
                      lines: globals.schedulesStopLines,
                    ),
                  );
                }
              },
            )
          ],
        ),
        body: Column(
          children: [
            SchedulesBody(
              scrollController: ScrollController(),
              ungroupDepartures: ungroupDepartures,
              id: widget.id,
              openPanel: null,
            ),
          ],
        ),
      );
}
