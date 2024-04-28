// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/app.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style.dart';

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
              Text(AppLocalizations.of(context)!.app_theme,
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
                title: Text(AppLocalizations.of(context)!.system_settings),
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
                title: Text(AppLocalizations.of(context)!.light),
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
                title: Text(AppLocalizations.of(context)!.dark),
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
