import 'package:flutter/material.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';

class BottomGroupedDepartures extends StatefulWidget {
  final bool isDeparture;
  final Function update;

	const BottomGroupedDepartures({
    this.isDeparture = false,
    required this.update,
		super.key,
	});

  @override
  State<BottomGroupedDepartures> createState() => _BottomGroupedDeparturesState();
}

class _BottomGroupedDeparturesState extends State<BottomGroupedDepartures> with SingleTickerProviderStateMixin {

  bool ungroup = globals.hiveBox?.get('ungroupDepartures') ?? false;

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
            Text('Affichage de vos trains',
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
            Text('Voulez-vous regrouper les trains selon leur ligne ?',
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
              title: const Text('Groupé'),
              value: false, 
              groupValue: ungroup, 
              onChanged: (value){
                setState(() {
                  ungroup = value ?? false;
                });
                globals.hiveBox.put('ungroupDepartures', value);
                widget.update();
              },
            ),
            RadioListTile(
              title: const Text('Dégroupé'),
              value: true, 
              groupValue: ungroup, 
              onChanged: (value){
                setState(() {
                  ungroup = value ?? false;
                });
                globals.hiveBox.put('ungroupDepartures', value);
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
    ),
  );
}