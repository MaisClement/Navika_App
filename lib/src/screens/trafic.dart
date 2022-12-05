import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/trafic/block.dart';
import 'package:navika/src/data/global.dart' as globals;

class Trafic extends StatefulWidget {
  const Trafic({super.key});

  @override
  State<Trafic> createState() => _TraficState();
}

class _TraficState extends State<Trafic> {
  final String title = 'Info Trafic';

  bool state = false;
  List trafic = [];
  String error = '';

  Future<void> _getTrafic() async {
    if (globals.trafic.isNotEmpty) {
      setState(() {
        state = true;
        trafic = globals.trafic;
      });
    }

    try {
      final response = await http.get(Uri.parse(globals.API_TRAFIC));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        globals.trafic = data['trafic'];

        if (mounted) {
          setState(() {
            state = true;
            trafic = data['trafic'];
            error = '';
          });
        }
      } else {
        setState(() {
          error = 'Récupération des informations impossible.';
        });
      }
    } catch (e) {
      setState(() {
        error = "Une erreur s'est produite.";
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(title, style: appBarTitle),
      ),
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: state
              ? Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: RefreshIndicator(
                    onRefresh: _getTrafic,
                    child: ListView(children: [
// RER
                      Row(children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 0.0, top: 5.0, right: 0.0, bottom: 0.0),
                            padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 10.0,
                                right: 10.0,
                                bottom: 10.0),
                            width: 45,
                            height: 45,
                            child: const Image(
                                image:
                                    AssetImage('assets/icons/RER_dark.png'))),
                        Expanded(
                            child: Wrap(children: const [
                          TraficBlock(
                            name: 'RER A',
                          ),
                          TraficBlock(
                            name: 'RER B',
                          ),
                          TraficBlock(
                            name: 'RER C',
                          ),
                          TraficBlock(
                            name: 'RER D',
                          ),
                          TraficBlock(
                            name: 'RER E',
                          ),
                        ])),
                      ]),

                      Container(
                        margin: const EdgeInsets.only(
                            left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                        color: const Color.fromARGB(255, 70, 70, 70),
                        height: 1.5,
                      ),

// TRAIN
                      Row(children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 0.0, top: 5.0, right: 0.0, bottom: 0.0),
                            padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 10.0,
                                right: 10.0,
                                bottom: 10.0),
                            width: 45,
                            height: 45,
                            child: const Image(
                                image:
                                    AssetImage('assets/icons/TRAIN_dark.png'))),
                        Expanded(
                            child: Wrap(children: const [
                          TraficBlock(
                            name: 'TRANSILIEN H',
                          ),
                          TraficBlock(
                            name: 'TRANSILIEN J',
                          ),
                          TraficBlock(
                            name: 'TRANSILIEN K',
                          ),
                          TraficBlock(
                            name: 'TRANSILIEN L',
                          ),
                          TraficBlock(
                            name: 'TRANSILIEN N',
                          ),
                          TraficBlock(
                            name: 'TRANSILIEN P',
                          ),
                          TraficBlock(
                            name: 'TRANSILIEN R',
                          ),
                          TraficBlock(
                            name: 'TRANSILIEN U',
                          ),
                        ])),
                      ]),

                      Container(
                        margin: const EdgeInsets.only(
                            left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                        color: const Color.fromARGB(255, 70, 70, 70),
                        height: 1.5,
                      ),

// METRO
                      Row(children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 0.0, top: 5.0, right: 0.0, bottom: 0.0),
                            padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 10.0,
                                right: 10.0,
                                bottom: 10.0),
                            width: 45,
                            height: 45,
                            child: const Image(
                                image:
                                    AssetImage('assets/icons/METRO_dark.png'))),
                        Expanded(
                            child: Wrap(children: const [
                          TraficBlock(
                            name: 'METRO 1',
                          ),
                          TraficBlock(
                            name: 'METRO 2',
                          ),
                          TraficBlock(
                            name: 'METRO 3',
                          ),
                          TraficBlock(
                            name: 'METRO 3B',
                          ),
                          TraficBlock(
                            name: 'METRO 4',
                          ),
                          TraficBlock(
                            name: 'METRO 5',
                          ),
                          TraficBlock(
                            name: 'METRO 6',
                          ),
                          TraficBlock(
                            name: 'METRO 7',
                          ),
                          TraficBlock(
                            name: 'METRO 7B',
                          ),
                          TraficBlock(
                            name: 'METRO 8',
                          ),
                          TraficBlock(
                            name: 'METRO 9',
                          ),
                          TraficBlock(
                            name: 'METRO 10',
                          ),
                          TraficBlock(
                            name: 'METRO 11',
                          ),
                          TraficBlock(
                            name: 'METRO 12',
                          ),
                          TraficBlock(
                            name: 'METRO 13',
                          ),
                          TraficBlock(
                            name: 'METRO 14',
                          ),
                          TraficBlock(
                            name: 'CDG Val',
                          ),
                          TraficBlock(
                            name: 'Orly val',
                          ),
                        ])),
                      ]),

                      Container(
                        margin: const EdgeInsets.only(
                            left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                        color: const Color.fromARGB(255, 70, 70, 70),
                        height: 1.5,
                      ),

// TRAM
                      Row(children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 0.0, top: 5.0, right: 0.0, bottom: 0.0),
                            padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 10.0,
                                right: 10.0,
                                bottom: 10.0),
                            width: 45,
                            height: 45,
                            child: const Image(
                                image:
                                    AssetImage('assets/icons/TRAM_dark.png'))),
                        Expanded(
                            child: Wrap(children: const [
                          TraficBlock(
                            name: 'T1',
                          ),
                          TraficBlock(
                            name: 'T2',
                          ),
                          TraficBlock(
                            name: 'T3A',
                          ),
                          TraficBlock(
                            name: 'T3B',
                          ),
                          TraficBlock(
                            name: 'T4',
                          ),
                          TraficBlock(
                            name: 'T5',
                          ),
                          TraficBlock(
                            name: 'T6',
                          ),
                          TraficBlock(
                            name: 'T7',
                          ),
                          TraficBlock(
                            name: 'T8',
                          ),
                          TraficBlock(
                            name: 'T9',
                          ),
                          TraficBlock(
                            name: 'T11',
                          ),
                          TraficBlock(
                            name: 'T13',
                          ),
                        ])),
                      ]),
                    ]),
                  ))
                  
              : error != ''
                ? ErrorBlock(
                    error: error,
                  )
                        
                : Container(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Column(children: [
                        const CircularProgressIndicator(),
                        Text(
                          'Chargement...',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                    ))));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getTrafic());
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
