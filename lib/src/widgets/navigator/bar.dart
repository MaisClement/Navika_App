// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:location/location.dart' as gps;

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/icons/mode.dart';

enum NaviState{
  unknown,
  gettingLocation,
  lowLocationAccuracy,
  ok,
  unknownException
}

bool isLoading(state) {
  if (state == NaviState.gettingLocation) {
    return true;
  }
  return false;
}

Color getColor(state) {
  if (state == NaviState.unknown || state == NaviState.gettingLocation || state == NaviState.lowLocationAccuracy) {
    return Colors.amber;
  }
  return const Color(0xff1f8837);
}

class NaviBar extends StatefulWidget implements PreferredSizeWidget {
  const NaviBar({
    super.key,
  });
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  NaviState state = NaviState.unknown; 
  late gps.LocationData locationData;
  late DateTime locationUpdate;
  gps.Location location = gps.Location();

  Map journey = {};
  List<Widget> instructions = [];

  late Timer _timer;

  Future<void> _startNavigator() async {
    bool serviceEnabled;
    if (!globals.isSetLocation) {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }
    } 

    journey = globals.journey;

    setState(() {
      state = NaviState.gettingLocation;
    });

    locationData = await location.getLocation();
    location.onLocationChanged.listen((gps.LocationData currentLocation) {
      _updateLocationData(currentLocation);
    });
    
    _updateLocationData(locationData);
  }

  Widget _getInstruction() {
    // if before departure

    if (state == NaviState.gettingLocation) {
      return Expanded(
        child: Text(AppLocalizations.of(context)!.locating_your_position,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: fontFamily,
          ),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
      );
    }


    // Avant le départ
    if (getTimeDifference(journey['departure_date_time']) > 0) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Départ dans ${getDuration(getTimeDifference(journey['departure_date_time']) * 60)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily,
              ),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),

            Row(
              children: [
                Text('Rejoingnez ${journey['sections'][0]['to']['name']}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
                ModeIcones(
                  line: journey['sections'][1]['informations']['line'],
                  i: 0,
                  brightness: Brightness.light,
                ),
                LinesIcones(line: journey['sections'][1]['informations']['line'])
              ],
            )
              
          ],
        ),
      );
    }

    return Expanded(
      child: Text('Coucou',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        maxLines: 1,
        softWrap: false,
        overflow: TextOverflow.fade,
      ),
    );

  }

  void _updateLocationData(locationData) {
    setState(() {
      if (locationData.accuracy != null && locationData.accuracy! > 200) {
        state = NaviState.lowLocationAccuracy;
      }
      state = NaviState.ok;
    });
  }

  @override
  void initState() {
    super.initState();
    _startNavigator();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _getInstruction();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) => AppBar(
      backgroundColor:  getColor(state), // Color(0xff1f8837),
      surfaceTintColor: getColor(state), // Color(0xff1f8837),
      title: Row(
        children: [
          if (isLoading(state))
            const SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          else
            const Icon(
              NavikaIcons.navi,
              color: Colors.white,
              size: 25,
            ),
          const SizedBox(width: 10,),

          _getInstruction()

        ],
      ),
    );
}
