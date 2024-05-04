// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:here_sdk/core.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icon.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

Widget getDistance(id) {
  if (globals.locationData == null) {
    return Container();
  }
  
  int distance = calculateDistance(double.parse(id.split(';')[0]), double.parse(id.split(';')[1]), globals.locationData!.latitude!, globals.locationData!.longitude!).toInt();
  int duration = distance ~/ 1.3;

  return Row(
    children: [
      Row(
        children: [
          const Icon(NavikaIcons.walking,
            color: Colors.grey,
            size: 25
          ),
          Text(getDistanceText(distance),
            style: TextStyle(
              color: Colors.grey,
              fontFamily: fontFamily,
            ),
          ),
          if (duration < 3600)
            ...[
              const SizedBox(width: 10),
              const Icon(NavikaIcons.clock,
                color: Colors.grey,
                size: 25
              ),
              Text(getDuration(duration),
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

class AddressBody extends StatefulWidget {
  final String id;
  final ScrollController scrollController;
  final Function onDispose;

  const AddressBody({
    required this.id,
    required this.scrollController,
    required this.onDispose,
    super.key
  });

  @override
  State<AddressBody> createState() => _AddressBodyState();
}

class _AddressBodyState extends State<AddressBody> with SingleTickerProviderStateMixin {

  String name = '';
  String id = '';
  bool isLoading = true;

  Map address = {};
  ApiStatus error = ApiStatus.ok;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      init();
      await _getAddress();
    });
  }
  
  @override
  void didUpdateWidget(AddressBody oldWidget) {
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
  }

  void init() {
    setState(() {
      name = globals.schedulesStopName;
      id = widget.id;
    });
  }

  Future<void> _getAddress() async {
    setState(() {
      isLoading = true;
    });

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
      }
    }
  }

  @override
  Widget build(BuildContext context) => ListView(
        controller: widget.scrollController,
        padding: const EdgeInsets.only(top: 35),
        children: [
          if (error != ApiStatus.ok)
            ErrorBlock(
              error: error,
            )
          else if (isLoading)
            const Column(
              children: [
                LinearProgressIndicator(),
              ]
            )
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
                          Text(address['place']['name'],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: fontFamily,
                              color: accentColor(context),
                            ),
                          ),
                          Text( address['place']['zip_code'] == '' ? address['place']['town'] : '${address['place']['zip_code']}, ${address['place']['town']}',
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
                      getDistance(id),
                      const SizedBox(height: 7),

                      IconElevatedButton(
                        icon: NavikaIcons.navi,
                        text: AppLocalizations.of(context)!.go,
                        onPressed: () {
                          initJourney(
                            null,
                            {
                              'name': address['place']['name'],
                              'id': address['place']['id']
                            },
                            context
                          );
                        },
                      ),
                      
                    ],
                  ),
                ),

                

                

                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(AppLocalizations.of(context)!.nearby,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: fontFamily,
                      color: accentColor(context),
                    ),
                  ),
                ),
                if (address['near_stops'].isNotEmpty)
                  for (var place in address['near_stops'])
                    PlacesListButton(
                      isLoading: false,
                      place: place,
                      onTap: () {
                        globals.schedulesStopName = place['name'];
                        RouteStateScope.of(context).go('/stops/${place['id']}');
                      },
                    ),
              ]
            ),
        ],
      );
}
