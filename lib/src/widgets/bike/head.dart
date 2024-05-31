// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
  final Function setPadding;
  final Function setData;
  final Function refreshMap;
  final PanelController panelController;

  const BikeHead({
    required this.id,
    required this.setPadding,
    required this.setData,
    required this.refreshMap,
    required this.panelController,
    super.key,
  });

  @override
  State<BikeHead> createState() => _BikeHeadState();
}

class _BikeHeadState extends State<BikeHead> with SingleTickerProviderStateMixin {
  String id = '';
  bool isLoading = true;

  final _key = GlobalKey();
  late Timer _timer;

  Map bikeStation = {};
  ApiStatus error = ApiStatus.ok;

  void init() {
    setState(() {
      id = widget.id;
    });
  }

  void _setPadding() {
    if (_key.currentContext != null) {
      widget.setPadding(_key.currentContext?.size?.height);
    }
  }

  Future<void> _getBikes() async {
    setState(() {
      isLoading = true;
    });
    widget.setData(null);

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getBikeStations(id);

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
        widget.panelController.animatePanelToSnapPoint();
        widget.refreshMap(bikeStation['bike_station']['coord']['lat'], bikeStation['bike_station']['coord']['lon']);
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
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          key: _key,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 15,
                bottom: 10,
              ),
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
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
                                fontWeight: FontWeight.w600,
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
      init();
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        _setPadding();
      });
      await _getBikes();
    });
  }

  @override
  void didUpdateWidget(BikeHead oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != id) {
      init();
      _getBikes();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
