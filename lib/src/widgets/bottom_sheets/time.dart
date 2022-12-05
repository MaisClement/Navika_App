import 'package:flutter/material.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/schedules/timer_block.dart';
import 'package:navika/src/data/global.dart' as globals;

String getTime(){
  var d1 = DateTime.now();
  return DateTime(d1.year, d1.month, d1.day, d1.hour, d1.minute + 7).toString();
}

class BottomSchedules extends StatefulWidget {
  final bool isDeparture;
  final Function update;

	const BottomSchedules({
    this.isDeparture = false,
    required this.update,
		super.key,
	});

  @override
  State<BottomSchedules> createState() => _BottomSchedulesState();
}

class _BottomSchedulesState extends State<BottomSchedules>
    with SingleTickerProviderStateMixin {

  String displayMode = globals.hiveBox.get('displayMode') ?? 'default';

	@override
	Widget build(BuildContext context) => Container(
    height: 600,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5)
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Détails sur vos horaires.',
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
          Row(
            children: [
              Expanded(
                child: Text('À l\'heure.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              widget.isDeparture
              ? TimeBlock(
                  time: getTime(),
                  base: getTime(),
                  state: 'ontime',
                  late: 0,
                  // ignore: prefer_single_quotes
                  track: "B",
                  update: widget.update, // INUTILE SI disabled
                  disabled: true,
                )
              : TimerBlock(
                  time: getTime(),
                  state: 'ontime',
                  update: widget.update, // INUTILE SI disabled
                  disabled: true,
                ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Text('Retardé.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              widget.isDeparture
              ? TimeBlock(
                  time: getTime(),
                  base: getTime(),
                  state: 'delayed',
                  late: 5,
                  track: 'B',
                  update: widget.update, // INUTILE SI disabled
                  disabled: true,
                )
              : TimerBlock(
                  time: getTime(),
                  state: 'delayed',
                  update: widget.update, // INUTILE SI disabled
                  disabled: true,
                ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Text('Supprimé.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              widget.isDeparture
              ? TimeBlock(
                  time: getTime(),
                  base: getTime(),
                  state: 'cancelled',
                  late: 0,
                  track: 'B',
                  update: widget.update, // INUTILE SI disabled
                  disabled: true,
                )
              : TimerBlock(
                  time: getTime(),
                  state: 'cancelled',
                  update: widget.update, // INUTILE SI disabled
                  disabled: true,
                ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Text('Horaire théorique.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              widget.isDeparture
              ? TimeBlock(
                  time: getTime(),
                  base: getTime(),
                  state: 'theorical',
                  late: 0,
                  track: 'B',
                  update: widget.update, // INUTILE SI disabled
                  disabled: true,
                )
              : TimerBlock(
                  time: getTime(),
                  state: 'theorical',
                  update: widget.update, // INUTILE SI disabled
                  disabled: true,
                ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text("Définissez le mode d'affichage que vous préferez.",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              fontFamily: 'Segoe Ui',
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Divider(),
          RadioListTile(
            title: const Text("Temps d'attente"),
            value: 'minutes', 
            groupValue: displayMode, 
            onChanged: (value){
              setState(() {
                displayMode = value.toString();
              });
              globals.hiveBox.put('displayMode', value.toString());
              widget.update();
            },
          ),
          RadioListTile(
            title: const Text('Heure de passage'),
            value: 'hour', 
            groupValue: displayMode, 
            onChanged: (value){
              setState(() {
                displayMode = value.toString();
              });
              globals.hiveBox.put('displayMode', value.toString());
              widget.update();
            },
          ),
          RadioListTile(
            title: const Text('Défaut'),
            value: 'default', 
            groupValue: displayMode, 
            onChanged: (value){
              setState(() {
                displayMode = value.toString();
              });
              globals.hiveBox.put('displayMode', value.toString());
              widget.update();
            },
          ),

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              child: const Text('Fermer'),
              onPressed: () => Navigator.pop(context),
            ),  
          )
        ],
      ),
    ),
  );
}