// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style.dart';

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
            Text(AppLocalizations.of(context)!.display_your_trains,
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
            Text(AppLocalizations.of(context)!.group_trains_by_line,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily,
                color: accentColor(context),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            
            RadioListTile(
              title: Text(AppLocalizations.of(context)!.grouped),
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
              title: Text(AppLocalizations.of(context)!.ungrouped),
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
                child: Text(AppLocalizations.of(context)!.close),
                onPressed: () => Navigator.pop(context),
              ),  
            )
          ],
        ),
      ),
    ),
  );
}
