import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';

import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/home/messages.dart';
import 'package:navika/src/widgets/trafic/block.dart';
import 'package:navika/src/data/global.dart' as globals;

class Trafic extends StatefulWidget {
  const Trafic({super.key});

  @override
  State<Trafic> createState() => _TraficState();
}

class _TraficState extends State<Trafic> {
  final String title = 'Info Trafic';

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  bool state = false;
  List trafic = [];
  ApiStatus error = ApiStatus.ok;

  Future<void> _getTrafic() async {
    if (globals.trafic.isNotEmpty) {
      setState(() {
        state = true;
        trafic = globals.trafic;
      });
    }

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getTrafic([]);
    
    if (mounted) {
      setState(() {
        state = true;
        trafic = result['value']['trafic'];
        globals.trafic = result['value']['trafic'];
        error = result['status'];
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title, style: appBarTitle),
        ),
        body: error != ApiStatus.ok
            ? ErrorBlock(
                error: error,
              )
            : Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: RefreshIndicator(
                  onRefresh: _getTrafic,
                  key: _refreshIndicatorKey,
                  child: ListView(
                    children: [

// Messages de l'index
                      if (globals.index?['message'] != null)
                        for (var message in globals.index?['message'])
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                            child: HomeMessage(
                              message: message,
                              isMarginDisabled: true,
                            ),
                          ),

// RER
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            padding: const EdgeInsets.all(10.0),
                            width: 45,
                            height: 45,
                            child: Image(
                              image: AssetImage(Brightness.dark ==
                                      Theme.of(context).colorScheme.brightness
                                  ? 'assets/img/icons/RER_light.png'
                                  : 'assets/img/icons/RER.png'),
                            ),
                          ),
                          Expanded(
                            child: Wrap(
                              children: [
                                TraficBlock(
                                  name: 'RER A',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'RER B',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'RER C',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'RER D',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'RER E',
                                  trafic: trafic,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      divider,

// TRAIN
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              padding: const EdgeInsets.all(10.0),
                              width: 45,
                              height: 45,
                              child: Image(
                                  image: AssetImage(Brightness.dark ==
                                          Theme.of(context)
                                              .colorScheme
                                              .brightness
                                      ? 'assets/img/icons/train_light.png'
                                      : 'assets/img/icons/train.png'))),
                          Expanded(
                            child: Wrap(
                              children: [
                                TraficBlock(
                                  name: 'TRANSILIEN H',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'TRANSILIEN J',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'TRANSILIEN K',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'TRANSILIEN L',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'TRANSILIEN N',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'TRANSILIEN P',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'TRANSILIEN R',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'TRANSILIEN U',
                                  trafic: trafic,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      divider,

// METRO
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            padding: const EdgeInsets.all(10.0),
                            width: 45,
                            height: 45,
                            child: Image(
                              image: AssetImage(Brightness.dark ==
                                      Theme.of(context).colorScheme.brightness
                                  ? 'assets/img/icons/metro_light.png'
                                  : 'assets/img/icons/metro.png'),
                            ),
                          ),
                          Expanded(
                            child: Wrap(
                              children: [
                                TraficBlock(
                                  name: 'METRO 1',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 2',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 3',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 3B',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 4',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 5',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 6',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 7',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 7B',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 8',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 9',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 10',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 11',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 12',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 13',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'METRO 14',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'CDG Val',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'Orly val',
                                  trafic: trafic,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      divider,

// TRAM
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            padding: const EdgeInsets.all(10.0),
                            width: 45,
                            height: 45,
                            child: Image(
                              image: AssetImage(Brightness.dark ==
                                      Theme.of(context).colorScheme.brightness
                                  ? 'assets/img/icons/tram_light.png'
                                  : 'assets/img/icons/tram.png'),
                            ),
                          ),
                          Expanded(
                            child: Wrap(
                              children: [
                                TraficBlock(
                                  name: 'T1',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T2',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T3A',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T3B',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T4',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T5',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T6',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T7',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T8',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T9',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T10',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T11',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T12',
                                  trafic: trafic,
                                ),
                                TraficBlock(
                                  name: 'T13',
                                  trafic: trafic,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _refreshIndicatorKey.currentState?.show());
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
