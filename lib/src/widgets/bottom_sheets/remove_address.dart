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

int getAddressPos(id) {
  List favs = globals.hiveBox?.get('savedAddress') ?? [];

  if (favs.isNotEmpty) {
    var i = 0;
    for (var fav in favs) {
      if (fav['id'] == id) {
        return i;
      }
      i++;
    }
  }
  return -1;
}

void removeAddress(widget, context) {
  List list = globals.hiveBox.get('savedAddress');
  int pos = getAddressPos(widget.id);

  if (pos >= 0) {
    list.removeAt(pos);
    globals.hiveBox.put('savedAddress', list);
    Navigator.pop(context);
    floatingSnackBar(
      message: 'Adresse supprimé.',
      context: context,
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: mainColor(context),
    );
  } else {
    floatingSnackBar(
      message: 'Erreur lors de la suppression de l’adresse.',
      context: context,
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: Theme.of(context).colorScheme.error,
    );
  }
}

class BottomRemoveAddress extends StatefulWidget {
  final String id;

  const BottomRemoveAddress({
    required this.id,
    super.key,
  });

  @override
  State<BottomRemoveAddress> createState() => _BottomRemoveAddressState();
}

class _BottomRemoveAddressState extends State<BottomRemoveAddress> with SingleTickerProviderStateMixin {
  List addressFavorites = globals.hiveBox.get('savedAddress') ?? [];

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)), boxShadow: [
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
                  AppLocalizations.of(context)!.remvove_address,
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
                  height: 20,
                ),
                Center(
                  child: IconElevatedButton(
                    icon: NavikaIcons.trash,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffeb2031),
                      foregroundColor: const Color(0xffffffff),
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    text: AppLocalizations.of(context)!.delete,
                    onPressed: () => removeAddress(widget, context),
                  ),
                ),
                Center(
                  child: IconElevatedButton(
                    icon: NavikaIcons.cancel,
                    text: AppLocalizations.of(context)!.cancel,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
