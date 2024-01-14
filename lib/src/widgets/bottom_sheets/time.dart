import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/schedules/timer_block.dart';
import 'package:navika/src/data/global.dart' as globals;

String getDt(){
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

  String displayMode = globals.hiveBox.get('displayMode');

	@override
	Widget build(BuildContext context) => SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5)
            ),
            boxShadow: [
              BoxShadow(
                color: accentColor(context).withOpacity(0.1),
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
                Text('Détails sur vos horaires',
                  style: TextStyle(
                    fontSize: 20,
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
                Row(
                  children: [
                    Expanded(
                      child: Text('À l’heure',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          color: accentColor(context),
                        ),
                      ),
                    ),
                    widget.isDeparture
                    ? TimeBlock(
                        time: getDt(),
                        base: getDt(),
                        state: const ['ontime'],
                        late: 0,
                        track: 'B',
                        update: widget.update, // INUTILE SI disabled
                        disabled: true,
                      )
                    : TimerBlock(
                        time: getDt(),
                        state: 'ontime',
                        update: widget.update, // INUTILE SI disabled
                        color: departureList(context, mainColor(context)),
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
                      child: Text('Retardé',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          color: accentColor(context),
                        ),
                      ),
                    ),
                    widget.isDeparture
                    ? TimeBlock(
                        time: getDt(),
                        base: getDt(),
                        state: const ['delayed'],
                        late: 5,
                        track: 'B',
                        update: widget.update, // INUTILE SI disabled
                        disabled: true,
                      )
                    : TimerBlock(
                        time: getDt(),
                        state: 'delayed',
                        update: widget.update, // INUTILE SI disabled
                        color: departureList(context, mainColor(context)),
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
                      child: Text('Supprimé',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          color: accentColor(context),
                        ),
                      ),
                    ),
                    widget.isDeparture
                    ? TimeBlock(
                        time: getDt(),
                        base: getDt(),
                        state: const ['cancelled'],
                        late: 0,
                        track: 'B',
                        update: widget.update, // INUTILE SI disabled
                        disabled: true,
                      )
                    : TimerBlock(
                        time: getDt(),
                        state: 'cancelled',
                        update: widget.update, // INUTILE SI disabled
                        color: departureList(context, mainColor(context)),
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
                      child: Text('Théorique',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          color: accentColor(context),
                        ),
                      ),
                    ),
                    widget.isDeparture
                    ? TimeBlock(
                        time: getDt(),
                        base: getDt(),
                        state: const ['theorical'],
                        late: 0,
                        track: 'B',
                        update: widget.update, // INUTILE SI disabled
                        disabled: true,
                      )
                    : TimerBlock(
                        time: getDt(),
                        state: 'theorical',
                        update: widget.update, // INUTILE SI disabled
                        color: departureList(context, mainColor(context)),
                        disabled: true,
                      ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('Définissez le mode d’affichage que vous préferez.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    color: accentColor(context),
                  ),
                ),
                Divider(
                  color: accentColor(context),
                ),
                RadioListTile(
                  title: const Text('Temps d’attente'),
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
                    child: const Text('Fermer'),
                    onPressed: () => Navigator.pop(context),
                  ),  
                ),
              ],
            ),
          ),
        ),
    );
}