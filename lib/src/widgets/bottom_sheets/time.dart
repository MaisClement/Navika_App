// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/departures/time_block.dart';
import 'package:navika/src/widgets/schedules/timer_block.dart';

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
                Text(AppLocalizations.of(context)!.timetable_details,
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
                Row(
                  children: [
                    Expanded(
                      child: Text(AppLocalizations.of(context)!.on_time,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
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
                        update: (){}, // INUTILE SI disabled
                        disabled: true,
                      )
                    : TimerBlock(
                        time: getDt(),
                        state: 'ontime',
                        update: (){}, // INUTILE SI disabled
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
                      child: Text(AppLocalizations.of(context)!.delayed,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
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
                        update: (){}, // INUTILE SI disabled
                        disabled: true,
                      )
                    : TimerBlock(
                        time: getDt(),
                        state: 'delayed',
                        update: (){}, // INUTILE SI disabled
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
                      child: Text(AppLocalizations.of(context)!.deleted,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
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
                        update: (){}, // INUTILE SI disabled
                        disabled: true,
                      )
                    : TimerBlock(
                        time: getDt(),
                        state: 'cancelled',
                        update: (){}, // INUTILE SI disabled
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
                      child: Text(AppLocalizations.of(context)!.theoretical,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
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
                        update: (){}, // INUTILE SI disabled
                        disabled: true,
                      )
                    : TimerBlock(
                        time: getDt(),
                        state: 'theorical',
                        update: (){}, // INUTILE SI disabled
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
                    fontFamily: fontFamily,
                    color: accentColor(context),
                  ),
                ),
                Divider(
                  color: accentColor(context),
                ),
                RadioListTile(
                  title: Text(AppLocalizations.of(context)!.waiting_time),
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
                  title: Text(AppLocalizations.of(context)!.passing_time),
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
                  title: Text(AppLocalizations.of(context)!.defaut),
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
                    child: Text(AppLocalizations.of(context)!.close),
                    onPressed: () => Navigator.pop(context),
                  ),  
                ),
              ],
            ),
          ),
        ),
    );
}
