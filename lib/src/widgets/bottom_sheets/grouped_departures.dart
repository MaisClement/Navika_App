// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';

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
  
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)), boxShadow: [
            BoxShadow(
              color: accentColor(context).withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ]),
          child: Container(
            padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.display_your_trains,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
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
                Text(
                  AppLocalizations.of(context)!.group_trains_by_line,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontFamily: fontFamily,
                    color: accentColor(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Load a Lottie file from your assets
                Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                    'assets/lottie/departures.json',
                    controller: _animationController,
                    onLoaded: (composition) {
                      _animationController.duration = composition.duration;
                      if (ungroup) {
                      _animationController.forward();
                      }
                    },
                    width: 200,
                    ),
                  ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                RadioTiles(
                  tiles: [
                  {'name': AppLocalizations.of(context)!.grouped, 'value': false, 'icon': NavikaIcons.group},
                  {'name': AppLocalizations.of(context)!.ungrouped, 'value': true, 'icon': NavikaIcons.list},
                  ],
                  value: ungroup,
                  onTileChange: (value) {
                  setState(() {
                    ungroup = value as bool;
                    if (ungroup) {
                    _animationController.forward();
                    } else {
                    _animationController.reverse();
                    }
                  });
                  globals.hiveBox.put('ungroupDepartures', value);
                  widget.update();
                  },
                ),

                const SizedBox(
                  height: 20,
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
