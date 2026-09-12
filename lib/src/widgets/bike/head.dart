// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icon.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/home_search.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/address/head.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/home/skelton.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

class BikeHead extends StatefulWidget {
  final String id;
  final Function setData;
  final Function refreshMap;
  final Function openPanel;
  final Function moveMap;
  final dynamic panelController;
  
  const BikeHead({
    required this.id,
    required this.setData,
    required this.refreshMap,
    required this.openPanel,
    required this.moveMap,
    required this.panelController,
    super.key,
  });

  @override
  State<BikeHead> createState() => _BikeHeadState();
}

class _BikeHeadState extends State<BikeHead> with SingleTickerProviderStateMixin {
  bool isLoading = true;

  Map bikeStation = {};
  ApiStatus error = ApiStatus.ok;

  Future<void> _getBikes() async {
    setState(() {
      isLoading = true;
    });
    widget.setData(null);

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getBikeStations(widget.id);

    if (mounted) {
      setState(() {
        error = result['status'];
      });

      if (result['value'] != null) {
        setState(() {
          bikeStation = result['value'];
          isLoading = false;
        });

        //
        widget.setData(bikeStation);
        widget.openPanel();
        widget.refreshMap(bikeStation['bike_station']['coord']['lat'], bikeStation['bike_station']['coord']['lon']);
        widget.moveMap(bikeStation['bike_station']['coord']['lat'], bikeStation['bike_station']['coord']['lon']);
        
        if (globals.updateMap == false) {
          openMapPoint(bikeStation['bike_station']['coord']['lat'], bikeStation['bike_station']['coord']['lon']);
        }
        
        globals.updateMap = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            if (error != ApiStatus.ok)
              ErrorBlock(
                error: error,
              )
            else if (isLoading)
              const HomeHeaderSkelton()
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(arrowBack),
                          tooltip: AppLocalizations.of(context)!.back,
                          color: accentColor(context),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bikeStation['bike_station']['name'],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                fontFamily: fontFamily,
                                color: accentColor(context),
                              ),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                            Text(
                              bikeStation['bike_station']['zip_code'] == ''
                                  ? bikeStation['bike_station']['town']
                                  : '${bikeStation['bike_station']['zip_code']}, ${bikeStation['bike_station']['town']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: accentColor(context),
                                fontFamily: fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 7),
                        getDistanceWidget(bikeStation['bike_station']['coord']['lat'], bikeStation['bike_station']['coord']['lon']),
                        const SizedBox(height: 7),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: IconElevatedButton(
                                icon: NavikaIcons.navi,
                                text: AppLocalizations.of(context)!.go,
                                onPressed: () {
                                  initJourney(
                                      null,
                                      {
                                        'name': bikeStation['bike_station']['name'],
                                        'id': '${bikeStation['bike_station']['coord']['lat']};${bikeStation['bike_station']['coord']['lon']}'
                                      },
                                      context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getBikes();
    });
  }
}
