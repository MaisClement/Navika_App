// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/icons/icons.dart';

void handleAddToFavorite(widget, line, context) {
  List list = globals.hiveBox.get('stopsFavorites');
  list.add({'id': widget.id, 'name': widget.name, 'line': line['id']});
  globals.hiveBox.put('stopsFavorites', list);
  Navigator.pop(context);
  //RouteStateScope.of(context).go('/schedules');
  
  floatingSnackBar(
    message: AppLocalizations.of(context)!.favorite_added,
    context: context,
    textStyle: snackBarText,
    duration: const Duration(milliseconds: 4000),
    backgroundColor: mainColor(context),
  );
}

class BottomAddFavorite extends StatefulWidget {
  final String name;
  final String id;
  final List lines;

  const BottomAddFavorite({
    required this.name,
    required this.id,
    required this.lines,
    super.key,
  });

  @override
  State<BottomAddFavorite> createState() => _BottomAddFavoriteState();
}

class _BottomAddFavoriteState extends State<BottomAddFavorite> with SingleTickerProviderStateMixin {
  List stopsFavorites = globals.hiveBox.get('stopsFavorites') ?? [];

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
                  'Ajouter cet arrêts aux favoris',
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
                Wrap(children: [
                  Text(
                    AppLocalizations.of(context)!.select_line_to_add_to_favorites,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: fontFamily,
                      color: accentColor(context),
                    ),
                  ),
                ]),
                for (var line in widget.lines)
                  if (!isFavoriteLine(widget.id, line['id']))
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => handleAddToFavorite(widget, line, context),
                        child: Row(
                          children: [
                            Icones(
                              line: line,
                              prevLine: line,
                              i: 0,
                              size: 30,
                              brightness: Theme.of(context).colorScheme.brightness,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                line['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: fontFamily,
                                ),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.cancel),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
