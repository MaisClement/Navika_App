import 'package:flutter/material.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';

String getTime(){
  var d1 = DateTime.now();
  return DateTime(d1.year, d1.month, d1.day, d1.hour, d1.minute + 7).toString();
}

class BottomTerminusTrain extends StatefulWidget {
  final bool isDeparture;
  final Function update;

	const BottomTerminusTrain({
    this.isDeparture = false,
    required this.update,
		super.key,
	});

  @override
  State<BottomTerminusTrain> createState() => _BottomTerminusTrainState();
}

class _BottomTerminusTrainState extends State<BottomTerminusTrain>
    with SingleTickerProviderStateMixin {

  bool hide = globals.hiveBox?.get('hideTerminusTrain') ?? false;

	@override
	Widget build(BuildContext context) => Container(
    height: 305,
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
          Text('Affichage des terminus.',
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
          Text('Voulez-vous masquer les trains à l’arrivée ?',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Segoe Ui',
              color: accentColor(context),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          
          RadioListTile(
            title: const Text('Affiché'),
            value: false, 
            groupValue: hide, 
            onChanged: (value){
              setState(() {
                hide = value ?? false;
              });
              globals.hiveBox.put('hideTerminusTrain', value);
              widget.update();
            },
          ),
          RadioListTile(
            title: const Text('Masqué'),
            value: true, 
            groupValue: hide, 
            onChanged: (value){
              setState(() {
                hide = value ?? false;
              });
              globals.hiveBox.put('hideTerminusTrain', value);
              widget.update();
            },
          ),

          Center(
            child: ElevatedButton(
              child: const Text('Fermer'),
              onPressed: () => Navigator.pop(context),
            ),  
          )
        ],
      ),
    ),
  );
}