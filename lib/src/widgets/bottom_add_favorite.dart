import 'package:flutter/material.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:navika/src/widgets/schedules/timer_block.dart';
import '../data/global.dart' as globals;
import '../routing.dart';

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

class _BottomAddFavoriteState extends State<BottomAddFavorite>
    with SingleTickerProviderStateMixin {

  List stopsFavorites = globals.hiveBox.get('stopsFavorites') ?? [];

	@override
	Widget build(BuildContext context) => Container(
    height: 400,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.grey[200],
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 2),
        )
      ]
    ),
    child: Container(
      padding: const EdgeInsets.only(left:20.0, top:30.0, right:20.0, bottom:10.0), 
      child: ListView(
        children: [
          Text('Ajouter cette stations aux favoris.',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              fontFamily: 'Segoe Ui',
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),

          Expanded(
            child: Text('Selectionner la ligne à ajouter aux favoris.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Segoe Ui',
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

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
                      'line': line['id']
                    });
                    globals.hiveBox.put('stopsFavorites', list);
                    Navigator.pop(context);
                    RouteStateScope.of(context).go('/schedules');
                  },
                  child: Row(
                    children: [
                      Icones(
                        line: line,
                        oldLine: line,
                        i: 0,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(line['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Segoe Ui',
                          ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        )
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
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