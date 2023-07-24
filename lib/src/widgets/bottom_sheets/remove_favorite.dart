import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

int getFavoritesPos(id, line) {
  List favs = globals.hiveBox?.get('stopsFavorites') ?? [];

  if (favs.isNotEmpty) {
    var i = 0;
    for (var fav in favs) {
      if (fav['id'] == id && fav['line'] == line) {
        return i;
      }
      i++;
    }
  }
  return -1;
}

class BottomRemoveFavorite extends StatefulWidget {
  final String name;
  final String id;
  final String line;
  final Function update;

  const BottomRemoveFavorite({
    required this.name,
    required this.id,
    required this.line,
    required this.update,
    super.key,
  });

  @override
  State<BottomRemoveFavorite> createState() => _BottomRemoveFavoriteState();
}

class _BottomRemoveFavoriteState extends State<BottomRemoveFavorite>
    with SingleTickerProviderStateMixin {
  List stopsFavorites = globals.hiveBox.get('stopsFavorites') ?? [];

  void handleRemove(id, line, update) {
    List list = globals.hiveBox.get('stopsFavorites');
    int pos = getFavoritesPos(id, line);

    if (pos >= 0) {
      list.removeAt(pos);
      globals.hiveBox.put('stopsFavorites', list);
      Navigator.pop(context);
      update();
    } else {
      FloatingSnackBar(
        message: 'Erreur lors de la suppression du favori.',
        context: context,
        textColor: mainColor(context),
        textStyle: snackBarText,
        duration: const Duration(milliseconds: 4000),
        backgroundColor: const Color(0xff272727),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        height: 250,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Supprimer ce favori.',
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
              Expanded(
                child: Text(
                  'Etes-vous sur de supprimer ce favori ?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    color: accentColor(context),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              
              Center(
                child: IconElevatedButton(
                  icon: NavikaIcons.trash,
                  width: 135,
                  text: 'Supprimer',
                  onPressed: () {
                    handleRemove(widget.id, widget.line, widget.update);
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
                  width: 135,
                  text: 'Annuler',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
