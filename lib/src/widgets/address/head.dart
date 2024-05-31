// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:here_sdk/core.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icon.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/home_search.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/home/skelton.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

Widget getDistanceWidget(double lat, double lon) {
  if (globals.position == null) {
    return Container();
  }

  int distance = calculateDistance(lat, lon, globals.position!.latitude, globals.position!.longitude).toInt();
  int duration = distance ~/ 1.3;

  if (distance >= 1000 ) {
    return Container();
  }

  return Row(
    children: [
      Row(
        children: [
          const Icon(NavikaIcons.walking, color: Colors.grey, size: 25),
          Text(
            getDistanceText(distance),
            style: TextStyle(
              color: Colors.grey,
              fontFamily: fontFamily,
            ),
          ),
          if (duration < 3600) ...[
            const SizedBox(width: 10),
            const Icon(NavikaIcons.clock, color: Colors.grey, size: 25),
            Text(
              getDuration(duration),
              style: TextStyle(
                color: Colors.grey,
                fontFamily: fontFamily,
              ),
            ),
          ]
        ],
      )
    ],
  );
}

class AddressHead extends StatefulWidget {
  final String id;
  final Function onDispose;
  final Function setPadding;
  final Function setData;
  final Function refreshMap;
  final PanelController panelController;

  const AddressHead({
    required this.id,
    required this.onDispose,
    required this.setPadding,
    required this.setData,
    required this.refreshMap,
    required this.panelController,
    super.key,
  });

  @override
  State<AddressHead> createState() => _AddressHeadState();
}

class _AddressHeadState extends State<AddressHead> with SingleTickerProviderStateMixin {
  String id = '';
  bool isLoading = true;

  final _key = GlobalKey();
  late Timer _timer;

  Map address = {};
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

  Future<void> _getAddress() async {
    setState(() {
      isLoading = true;
    });
    widget.setData(null);

    GeoCoordinates geoCoordinates = GeoCoordinates(double.parse(id.split(';')[0]), double.parse(id.split(';')[1]));

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getAddress(geoCoordinates);

    if (mounted) {
      setState(() {
        error = result['status'];
      });

      if (result['value'] != null) {
        setState(() {
          address = result['value'];
          isLoading = false;
        });

        //
        widget.setData(address);
        widget.panelController.animatePanelToSnapPoint();
        widget.refreshMap(address['place']['coord']['lat'], address['place']['coord']['lon']);
        if (globals.updateMap == false) {
          openMapPoint(address['place']['coord']['lat'], address['place']['coord']['lon'], true);
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
                              address['place']['name'],
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
                              address['place']['zip_code'] == '' ? address['place']['town'] : '${address['place']['zip_code']}, ${address['place']['town']}',
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
                        getDistanceWidget(address['place']['coord']['lat'], address['place']['coord']['lon']),
                        const SizedBox(height: 7),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: IconElevatedButton(
                                icon: NavikaIcons.navi,
                                text: AppLocalizations.of(context)!.go,
                                onPressed: () {
                                  initJourney(null, {'name': address['place']['name'], 'id': address['place']['id']}, context);
                                },
                              ),
                            ),
                            //TODO Padding(
                            //TODO   padding: const EdgeInsets.only(right: 5),
                            //TODO   child: IconElevatedButton(
                            //TODO     icon: NavikaIcons.star,
                            //TODO     text: AppLocalizations.of(context)!.save,
                            //TODO     style: ElevatedButton.styleFrom(
                            //TODO       foregroundColor : Theme.of(context).colorScheme.onPrimaryContainer,
                            //TODO       backgroundColor : Theme.of(context).colorScheme.primaryContainer
                            //TODO     ),
                            //TODO     onPressed: () {
                            //TODO       initJourney(null, {'name': address['place']['name'], 'id': address['place']['id']}, context);
                            //TODO     },
                            //TODO   ),
                            //TODO ),
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
      await _getAddress();
    });
  }

  @override
  void didUpdateWidget(AddressHead oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != id) {
      init();
      _getAddress();
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose();
    _timer.cancel();
  }
}
