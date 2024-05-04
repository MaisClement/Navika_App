// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

int getAddressPos(id) {
  List favs = globals.hiveBox?.get('addressFavorites') ?? [];

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
  List list = globals.hiveBox.get('addressFavorites');
  int pos = getAddressPos(widget.id);

  if (pos >= 0) {
    list.removeAt(pos);
    globals.hiveBox.put('addressFavorites', list);
    Navigator.pop(context);
    FloatingSnackBar(
      message: 'Adresse supprimé.',
      context: context,
      textColor: mainColor(context),
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
    );
  } else {
    FloatingSnackBar(
      message: 'Erreur lors de la suppression de l’adresse.',
      context: context,
      textColor: mainColor(context),
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
    );
  }
}

class BottomRemoveAddress extends StatefulWidget {
  final String id;
  final String type;

  const BottomRemoveAddress({
    required this.id,
    required this.type,
    super.key,
  });

  @override
  State<BottomRemoveAddress> createState() => _BottomRemoveAddressState();
}

class _BottomRemoveAddressState extends State<BottomRemoveAddress> with SingleTickerProviderStateMixin {
  List addressFavorites = globals.hiveBox.get('addressFavorites') ?? [];

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
            padding: const EdgeInsets.only(
                left: 20.0, top: 30.0, right: 20.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.edit_address,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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
                    icon: NavikaIcons.edit,
                    text: 'Modifer',
                    onPressed: () {
                        RouteStateScope.of(context).go('/home/address/${widget.type}/${getAddressPos(widget.id)}');
                    },
                  ),
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
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
