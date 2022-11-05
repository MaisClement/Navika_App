import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

import '../widgets/trafic_block.dart';
import '../data/global.dart' as globals;

class TraficScreen extends StatefulWidget {
	const TraficScreen({super.key});

	@override
	State<TraficScreen> createState() => _TraficScreenState();
}

class _TraficScreenState extends State<TraficScreen> {
	final String title = 'Info Trafic';

  bool state = false;
  List trafic = [];

	Future<void> _getTrafic() async {
    if(!globals.trafic.isEmpty) {
      setState(() {
        state = true;
        trafic = globals.trafic;
      });
    }

    final response = await http.get(Uri.parse(globals.API_TRAFIC));
    final data = json.decode(response.body);

    globals.trafic = data['trafic'];
    
    if (mounted) {
      setState(() {
        state = true;
        trafic = data['trafic'];
      });
    }
	}

	@override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(
			title: Text(title),
      centerTitle: true,
      elevation: 0,
		),
		body: Container(
			padding: EdgeInsets.only(left:20.0, top:20.0,right:20.0,bottom:20.0),
			color: Theme.of(context).colorScheme.secondary,
			width: double.infinity,
			child: Container(

				child: state ?
				Container(
					padding: EdgeInsets.only(left:10.0, top:10.0,right:10.0,bottom:10.0),
					decoration: BoxDecoration(
						color: Colors.white,
						borderRadius: BorderRadius.circular(5),
					),
					child: RefreshIndicator(
            onRefresh: _getTrafic,
            child: ListView(
						children: [
              
// RER
							Row( 
                children: [
                  Container(
                    margin: EdgeInsets.only(left:0.0, top:5.0,right:0.0,bottom:0.0),
                    padding: EdgeInsets.only(left:10.0, top:10.0,right:10.0,bottom:10.0),
                    width: 45,
                    height: 45,
                    child: Image(image: const AssetImage('assets/idfm/RER_dark.png'))
                  ),
                  Expanded(
                    child: Wrap( 
                        children: [
                          Container(
                            child: const TraficBlock(
                              name: "RER A", 
                            )
                          ),
                          Container(
                            child: const TraficBlock(
                              name: "RER B", 
                            )
                          ),
                          Container(
                            child: const TraficBlock(
                              name: "RER C", 
                            )
                          ),
                          Container(
                            child: const TraficBlock(
                              name: "RER D", 
                            )
                          ),
                          Container(
                            child: const TraficBlock(
                              name: "RER E", 
                            )
                          ),
                        ]
                      )
                  ),
                ]
              ),

              Container(
                  margin: EdgeInsets.only(left:0.0, top:10.0,right:0.0,bottom:10.0),
                  color: Color.fromARGB(255, 70, 70, 70),
                  height: 1.5,
                ),

// TRAIN
      Row( 
        children: [
          Container(
            margin: EdgeInsets.only(left:0.0, top:5.0,right:0.0,bottom:0.0),
            padding: EdgeInsets.only(left:10.0, top:10.0,right:10.0,bottom:10.0),
            width: 45,
            height: 45,
            child: Image(image: const AssetImage('assets/idfm/TRAIN_dark.png'))
          ),
          Expanded(
            child: Wrap( 
              children: [
                Container(
                  child: const TraficBlock(
                    name: "TRANSILIEN H", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "TRANSILIEN J", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "TRANSILIEN K", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "TRANSILIEN L", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "TRANSILIEN N", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "TRANSILIEN P", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "TRANSILIEN R", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "TRANSILIEN U", 
                  )
                ),
              ]
            )
          ),
        ]
      ),

              Container(
                  margin: EdgeInsets.only(left:0.0, top:10.0,right:0.0,bottom:10.0),
                  color: Color.fromARGB(255, 70, 70, 70),
                  height: 1.5,
                ),

// METRO
      Row( 
        children: [
          Container(
            margin: EdgeInsets.only(left:0.0, top:5.0,right:0.0,bottom:0.0),
            padding: EdgeInsets.only(left:10.0, top:10.0,right:10.0,bottom:10.0),
            width: 45,
            height: 45,
            child: Image(image: const AssetImage('assets/idfm/METRO_dark.png'))
          ),
          Expanded(
            child: Wrap( 
              children: [
                Container(
                  child: const TraficBlock(
                    name: "METRO 1", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 2", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 3", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 3B", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 4", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 5", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 6", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 7", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 7B", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 8", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 9", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 10", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 11", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 12", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 13", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "METRO 14", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "CDG Val", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "Orly val", 
                  )
                ),
              ]
            )
          ),
        ]
      ),

      Container(
                  margin: EdgeInsets.only(left:0.0, top:10.0,right:0.0,bottom:10.0),
                  color: Color.fromARGB(255, 70, 70, 70),
                  height: 1.5,
                ),

// TRAM
      Row( 
        children: [
          Container(
            margin: EdgeInsets.only(left:0.0, top:5.0,right:0.0,bottom:0.0),
            padding: EdgeInsets.only(left:10.0, top:10.0,right:10.0,bottom:10.0),
            width: 45,
            height: 45,
            child: Image(image: const AssetImage('assets/stif/TRAM_dark.png'))
          ),
          Expanded(
            child: Wrap( 
              children: [
                Container(
                  child: const TraficBlock(
                    name: "T1", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T2", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T3A", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T3B", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T4", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T5", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T6", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T7", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T8", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T9", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T11", 
                  )
                ),
                Container(
                  child: const TraficBlock(
                    name: "T13", 
                  )
                ),
              ]
            )
          ),
        ]
      ),

              
						]
					),

            )
          )
          :
          Container(
					padding: EdgeInsets.only(left:10.0, top:10.0,right:10.0,bottom:10.0),
					decoration: BoxDecoration(
						color: Colors.white,
						borderRadius: BorderRadius.circular(5),
					),
          child : Center(
            child: Column(
              children: [
                const CircularProgressIndicator(),
                Text('Chargement...', 
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ]
            ),
          )
        )
        )
      )
    );

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