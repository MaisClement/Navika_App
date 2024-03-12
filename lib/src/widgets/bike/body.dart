import 'dart:async';
import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';

class BikeBody extends StatefulWidget {
  final String id;
  final ScrollController scrollController;

  const BikeBody({
    required this.id,
    required this.scrollController,
    super.key
  });

  @override
  State<BikeBody> createState() => _BikeBodyState();
}

class _BikeBodyState extends State<BikeBody> with SingleTickerProviderStateMixin {

  String name = '';
  String id = '';
  bool isLoading = true;

  Map bikeStation = {};
  late Timer _update;
  ApiStatus error = ApiStatus.ok;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      init();
      await _getBikes();
    });
  }
  
  @override
  void didUpdateWidget(BikeBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != id) {
      init();
      _getBikes();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _update.cancel();
  }

  void init() {
    setState(() {
      name = globals.schedulesStopName;
      id = widget.id;
    });
  }

  Future<void> _getBikes() async {
    setState(() {
      isLoading = true;
    });
    
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
      }
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 60),
          if (isLoading)
            const Column(
              children: [
                SizedBox(height: 20),
                LinearProgressIndicator(),
              ]
            )
          else
            Container(
              padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 10.0),
              child: Column(
                children: [
                  if (bikeStation['bike'] != null)
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Vélo disponible',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Segoe Ui',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffb7dcae)),
                          child: Row(
                            children: [
                              Icon(NavikaIcons.bike,
                                  color: Theme.of(context).colorScheme.onSurface, size: 25),
                              Container(
                                width: 30,
                                margin:
                                    const EdgeInsets.only(left: 7, bottom: 2),
                                child: Text(
                                  bikeStation['bike'].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Segoe Ui',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (bikeStation['bike'] != null)
                    const SizedBox(
                      height: 5,
                    ),
                  if (bikeStation['mechanical'] != null)
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Vélo mécanique',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Segoe Ui',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: getMechanicalBike(context),
                          ),
                          child: Row(
                            children: [
                              Icon(NavikaIcons.bike,
                                  color: Theme.of(context).colorScheme.onSurface, size: 25),
                              Container(
                                width: 30,
                                margin:
                                    const EdgeInsets.only(left: 7, bottom: 2),
                                child: Text(
                                  bikeStation['mechanical'].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Segoe Ui',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (bikeStation['mechanical'] != null)
                    const SizedBox(
                      height: 5,
                    ),
                  if (bikeStation['ebike'] != null)
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Vélo électriques',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Segoe Ui',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: getElecBike(context),
                          ),
                          child: Row(
                            children: [
                              Icon(NavikaIcons.ebike,
                                  color: Theme.of(context).colorScheme.onSurface, size: 25),
                              Container(
                                width: 30,
                                margin:
                                    const EdgeInsets.only(left: 7, bottom: 2),
                                child: Text(
                                  bikeStation['ebike'].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Segoe Ui',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (bikeStation['ebike'] != null)
                    const SizedBox(
                      height: 5,
                    ),
                  if (bikeStation['capacity'] != null)
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Places disponibles',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Segoe Ui',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: getParkBike(context),
                          ),
                          child: Row(
                            children: [
                              Icon(NavikaIcons.parking,
                                  color: Theme.of(context).colorScheme.onSurface, size: 25),
                              Container(
                                width: 30,
                                margin:
                                    const EdgeInsets.only(left: 7, bottom: 2),
                                child: Text(
                                  bikeStation['capacity'].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Segoe Ui',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            )
        ],
      );
}
