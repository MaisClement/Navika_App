import 'package:flutter/material.dart';
import 'package:navika/src/app.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';

class BottomThemeMode extends StatefulWidget {

	const BottomThemeMode({super.key});

  @override
  State<BottomThemeMode> createState() => _BottomThemeModeState();
}

class _BottomThemeModeState extends State<BottomThemeMode> with SingleTickerProviderStateMixin {

  String? hide = globals.hiveBox?.get('themeMode');

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
              Text('Thème de l’application',
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
              
              RadioListTile(
                title: const Text('Selon les paramètres du système'),
                value: 'default', 
                groupValue: hide, 
                onChanged: (value){
                  setState(() {
                    hide = value!;
                  });
                  globals.hiveBox.put('themeMode', value);
                  NavikaApp.updateThemeMode(context);
                },
              ),
              RadioListTile(
                title: const Text('Clair'),
                value: 'light', 
                groupValue: hide, 
                onChanged: (value){
                  setState(() {
                    hide = value!;
                  });
                  globals.hiveBox.put('themeMode', value);
                  NavikaApp.updateThemeMode(context);
                },
              ),
              RadioListTile(
                title: const Text('Sombre'),
                value: 'dark', 
                groupValue: hide, 
                onChanged: (value){
                  setState(() {
                    hide = value!;
                  });
                  globals.hiveBox.put('themeMode', value);
                  NavikaApp.updateThemeMode(context);
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