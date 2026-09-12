// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

int getHistoryPos(id) {
  List history = globals.hiveBox?.get('historyPlaces') ?? [];

  if (history.isNotEmpty) {
    var i = 0;
    for (var place in history) {
      if (place['id'] == id) {
        return i;
      }
      i++;
    }
  }
  return -1;
}

class BottomRemoveHistory extends StatefulWidget {
  final String id;
  final Function update;

  const BottomRemoveHistory({
    required this.id,
    required this.update,
    super.key,
  });

  @override
  State<BottomRemoveHistory> createState() => _BottomRemoveHistoryState();
}

class _BottomRemoveHistoryState extends State<BottomRemoveHistory> with SingleTickerProviderStateMixin {
  List historyPlaces = globals.hiveBox.get('historyPlaces') ?? [];

  void handleRemove(id, update) {
    List list = List.from(globals.hiveBox.get('historyPlaces') ?? []);
    int pos = getHistoryPos(id);

    if (pos >= 0) {
      list.removeAt(pos);
      globals.hiveBox.put('historyPlaces', list);
      Navigator.pop(context);
      update();
    } else {
      floatingSnackBar(
        message: AppLocalizations.of(context)!.favorite_deletion_error,
        context: context,
        textStyle: snackBarText,
        duration: const Duration(milliseconds: 4000),
      backgroundColor: Theme.of(context).colorScheme.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: accentColor(context).withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ]),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.remove_history,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                fontFamily: fontFamily,
                color: accentColor(context),
              ),
            ),
            Divider(
              color: accentColor(context),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(AppLocalizations.of(context)!.sure_to_remove_history,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontFamily: fontFamily,
                color: accentColor(context),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            
            Center(
              child: IconElevatedButton(
                icon: NavikaIcons.trash,
                text: AppLocalizations.of(context)!.delete,
                onPressed: () {
                  handleRemove(widget.id, widget.update);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffeb2031),
                  foregroundColor: const Color(0xffffffff),
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              ),
            ),
            Center(
              child: IconElevatedButton(
                icon: NavikaIcons.cancel,
                text: AppLocalizations.of(context)!.cancel,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
