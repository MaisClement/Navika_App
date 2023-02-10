import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';

int getAddressPos(id) {
  List favs = globals.hiveBox?.get('AddressFavorites') ?? [];

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

class BottomRemoveAddress extends StatefulWidget {
  final String id;

  const BottomRemoveAddress({
    required this.id,
    super.key,
  });

  @override
  State<BottomRemoveAddress> createState() => _BottomRemoveAddressState();
}

class _BottomRemoveAddressState extends State<BottomRemoveAddress>
    with SingleTickerProviderStateMixin {
  List addressFavorites = globals.hiveBox.get('AddressFavorites') ?? [];

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
                'Supprimer une adresse.',
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
                  'Etes-vous sur de supprimer cette adresse ?',
                  style: TextStyle(
                    fontSize: 15,
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffeb2031),
                    foregroundColor: const Color(0xffffffff),
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  child: const Text('Supprimer'),
                  onPressed: () {
                    List list = globals.hiveBox.get('AddressFavorites');
                    int pos = getAddressPos(widget.id);

                    if (pos >= 0) {
                      list.removeAt(pos);
                      globals.hiveBox.put('AddressFavorites', list);
                      Navigator.pop(context);
                      FloatingSnackBar(
                        message: 'Adresse supprimé.',
                        context: context,
                        textColor: Theme.of(context).colorScheme.primary,
                        textStyle: snackBarText,
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: const Color(0xff272727),
                      );
                    } else {
                      FloatingSnackBar(
                        message: "Erreur lors de la suppression de l'adresse.",
                        context: context,
                        textColor: Theme.of(context).colorScheme.primary,
                        textStyle: snackBarText,
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: const Color(0xff272727),
                      );
                    }
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    foregroundColor: const Color(0xffffffff),
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  child: const Text('Annuler'),
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        ),
      );
}
