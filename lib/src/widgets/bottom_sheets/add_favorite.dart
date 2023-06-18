import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:navika/src/data/global.dart' as globals;

class BottomAddFavorite extends StatefulWidget {
  final String name;
  final String id;
  final List lines;
  final List modes;

  const BottomAddFavorite({
    required this.name,
    required this.id,
    required this.lines,
    required this.modes,
    super.key,
  });

  @override
  State<BottomAddFavorite> createState() => _BottomAddFavoriteState();
}

class _BottomAddFavoriteState extends State<BottomAddFavorite>
    with SingleTickerProviderStateMixin {
  List stopsFavorites = globals.hiveBox.get('stopsFavorites') ?? [];

  @override
  Widget build(BuildContext context) => Container(
        height: 600,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
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
          child: ListView(
            children: [
              Text(
                'Ajouter cet arrêts aux favoris.',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
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
                  'Selectionner la ligne à ajouter aux favoris.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    color: accentColor(context),
                  ),
                ),
              ]),
              for (var line in widget.lines)
                if (!isFavoriteLine(widget.id, line['id']))
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        List list = globals.hiveBox.get('stopsFavorites');
                        list.add({
                          'id': widget.id,
                          'name': widget.name,
                          'modes': widget.modes,
                          'line': line['id']
                        });
                        globals.hiveBox.put('stopsFavorites', list);
                        Navigator.pop(context);
                        //RouteStateScope.of(context).go('/schedules');
                        FloatingSnackBar(
                          message: 'Favoris ajouté.',
                          context: context,
                          textColor: mainColor(context),
                          textStyle: snackBarText,
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: const Color(0xff272727),
                        );
                      },
                      child: Row(
                        children: [
                          Icones(
                              line: line,
                              oldLine: line,
                              i: 0,
                              size: 30,
                              isDark: Brightness.dark != Theme.of(context).colorScheme.brightness),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            line['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Segoe Ui',
                            ),
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          )),
                        ],
                      ),
                    ),
                  ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Annuler'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      );
}
