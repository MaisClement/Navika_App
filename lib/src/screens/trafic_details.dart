import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../data/trafic.dart';
import '../data/lines.dart';
import '../widgets/trafic_block.dart';

class TraficDetailsScreen extends StatelessWidget {
	final String? lineId;

	const TraficDetailsScreen({
		super.key,
		this.lineId,
	});

	@override
	Widget build(BuildContext context) {
		if (lineId == null) {
			return const Scaffold(
				body: Center(
					child: Text('Pas content'),
				),
			);
		}
		return Scaffold(
			appBar: AppBar(
				title: Text('Info Trafic'),
        centerTitle: true,
        elevation: 0,
			),
      body: Container(
        padding: EdgeInsets.only(left:20.0, top:20.0,right:20.0,bottom:20.0),
        color: Theme.of(context).colorScheme.secondary,
        width: double.infinity,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          child : Column(
            children: [
              
              Expanded(
                child: ListView(
                  children: [

                    Row(
                      children: [
                        Stack(
                          children: [

                            Container(
                              padding: EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
                              margin: EdgeInsets.only(left:15.0, top:15.0,right:15.0,bottom:15.0),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Color(0xffeeeeee),
                                borderRadius: BorderRadius.circular(10), //border corner radius
                                border: Border.all(
                                  width: 3.0,
                                  // assign the color to the border color
                                  color: getSlug(lineId),
                                ),
                              ),
                              child: Image(image: LINES.getLines(lineId).image),
                            ),
                            Positioned(
                              width: 20,
                              height: 20,
                              top: 43,
                              left: 43,
                              child: Image(image: getSlugImage(lineId)),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left:15.0),
                          child: Text(
                            getSlugTitle(lineId),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20
                            )
                          ),
                        )
                      ],
                    ),

// CTRAFIC 
                    Container(
                      padding: EdgeInsets.only(left:15.0, top:0, right:15.0, bottom:15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var ctrafic in TRAFIC.getLines(lineId).currentTraffic) 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                ctrafic['messages'][0]['title'] != null ? 
                                  Text(
                                    ctrafic['messages'][0]['title'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                    ),
                                  )
                                    :
                                  Text(''),
                                Text(
                                  ctrafic['messages'][0]['text'],
                                  style: const TextStyle(
                                    fontSize: 16
                                  ),
                                ),
                                ctrafic != TRAFIC.getLines(lineId).currentTraffic[TRAFIC.getLines(lineId).currentTraffic.length - 1] ?
                                  Container(
                                    margin: EdgeInsets.only(left:0.0, top:10.0,right:0.0,bottom:30.0),
                                    color: Color.fromARGB(255, 70, 70, 70),
                                    height: 1.5,
                                  )
                                  :
                                  Text('')

                              ]
                            ),
                        ]
                      )
                    ),

// CWORK
                    Container(
                      padding: EdgeInsets.only(left:15.0, top:15.0,right:15.0,bottom:15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var cwork in TRAFIC.getLines(lineId).currentWork) 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                cwork['messages'][0]['title'] != null ? 
                                  Text(
                                    cwork['messages'][0]['title'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                    ),
                                  )
                                    :
                                  Text(''),
                                Text(
                                  cwork['messages'][0]['text'],
                                  style: const TextStyle(
                                    fontSize: 16
                                  ),
                                ),
                                
                                cwork != TRAFIC.getLines(lineId).currentWork[TRAFIC.getLines(lineId).currentWork.length - 1] ?
                                  Container(
                                    margin: EdgeInsets.only(left:0.0, top:10.0,right:0.0,bottom:30.0),
                                    color: Color.fromARGB(255, 70, 70, 70),
                                    height: 1.5,
                                  )
                                  :
                                  Text('')

                              ]
                            ),
                        ]
                      )
                    ),

// FWORK
                    TRAFIC.getLines(lineId).futureWork.length > 0 ?
                     Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.only(left:15.0, top:15.0,right:15.0,bottom:15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('À venir',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Container(
                            height: 20,
                          ),

                          for (var fwork in TRAFIC.getLines(lineId).futureWork) 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                fwork['messages'][0]['title'] != null ? 
                                  Text(
                                    fwork['messages'][0]['title'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                    ),
                                  )
                                    :
                                  Text(''),
                                Text(
                                  fwork['messages'][0]['text'],
                                  style: const TextStyle(
                                    fontSize: 16
                                  ),
                                ),

                                fwork != TRAFIC.getLines(lineId).futureWork[TRAFIC.getLines(lineId).futureWork.length - 1] ?
                                  Container(
                                    margin: EdgeInsets.only(left:0.0, top:10.0,right:0.0,bottom:30.0),
                                    color: Color.fromARGB(255, 70, 70, 70),
                                    height: 1.5,
                                  )
                                  :
                                  Text('')
                              ]
                            ),
                        ],
                      )
                     )
                    :
                    Text('')
                
                  ],
                ),
              )
            ],
          )
        )
      )
    );
	}
}
