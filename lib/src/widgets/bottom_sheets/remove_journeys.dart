// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

class BottomRemoveJourneys extends StatefulWidget {
  final String id;
  final Function update;

  const BottomRemoveJourneys({
    required this.id,
    required this.update,
    super.key,
  });

  @override
  State<BottomRemoveJourneys> createState() => _BottomRemoveFavoriteState();
}

class _BottomRemoveFavoriteState extends State<BottomRemoveJourneys> with SingleTickerProviderStateMixin {
  List stopsFavorites = globals.hiveBox.get('stopsFavorites') ?? [];

  void handleRemove(String uniqueId, update, context) {
    List journeys = globals.hiveBox.get('journeys');
    
    journeys.removeWhere((element) => element['unique_id'] == uniqueId);
    floatingSnackBar(
      message: AppLocalizations.of(context)!.route_removed,
      context: context,
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: mainColor(context),
    );
    
    globals.hiveBox.put('journeys', journeys);
    Navigator.pop(context);
    update();
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
                  AppLocalizations.of(context)!.remove_route,
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
                  height: 10,
                ),
                Text(
                  'Etes-vous sur de supprimer cet itinéraire ?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
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
                      handleRemove(widget.id, widget.update, context);
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
