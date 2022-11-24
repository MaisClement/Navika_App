import 'package:flutter/material.dart';

import '../data/lines.dart';
import '../widgets/trafic/block.dart';

class TraficDetails extends StatelessWidget {
	final String lineId;

	const TraficDetails({
		super.key,
		required this.lineId,
	});

  String getTime(String time){
    DateTime dttime = DateTime.parse(time);

    String dtday = dttime.day < 10 ? "0" + dttime.day.toString() : dttime.day.toString();
    String dtmonth = dttime.month < 10 ? "0" + dttime.month.toString() : dttime.month.toString();
    String dtyear = dttime.year.toString();
    String dthour = dttime.hour < 10 ? "0" + dttime.hour.toString() : dttime.hour.toString();
    String dtminute = dttime.minute < 10 ? "0" + dttime.minute.toString() : dttime.minute.toString();

    return '$dtday/$dtmonth/$dtyear $dthour:$dtminute';
  }

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
				title: const Text('Info Trafic'),
        // centerTitle: true,
        elevation: 0,
			),
      body: Container(
        padding: const EdgeInsets.only(left:20.0, top:20.0,right:20.0,bottom:20.0),
        color: Theme.of(context).colorScheme.secondary,
        width: double.infinity,
        child: ListView(
          children: [
            
            Container(
              margin: const EdgeInsets.only(top: 5, right:5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
                        margin: const EdgeInsets.only(left:15.0, top:15.0,right:15.0,bottom:15.0),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 3.0,
                            color: getSlug(LINES.getLines(lineId).id, 1),
                          ),
                        ),
                        child: Image(image: LINES.getLines(lineId).image),
                      ),
                      Positioned(
                        width: 20,
                        height: 20,
                        top: 43,
                        left: 43,
                        child: Image(image: getSlugImage(LINES.getLines(lineId).id, 1)),
                      )
                    ],
                  ),
                  Expanded(
                    child: Wrap(
                      children: [
                        Text('${LINES.getLines(lineId).libelle} : ${getSlugTitle(LINES.getLines(lineId).id)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                          )
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),

// CTRAFIC 
            if (getTraficLines(LINES.getLines(lineId).id)['reports'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var ctrafic in getTraficLines(LINES.getLines(lineId).id)['reports']['current_trafic']) 
                    Container(
                      padding: const EdgeInsets.only(left:15.0, top:10, right:15.0, bottom:10.0),
                      margin: const EdgeInsets.only(top: 5, right:5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (ctrafic['message']['title'] != null)
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right:5),
                                    child: Image(
                                      image: getSlugImage(ctrafic['severity']),
                                      height: 25,
                                    ),
                                  ),
                                  Expanded(
                                    child: Wrap(
                                      children: [
                                        Text(ctrafic['message']['title'],
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                            
                          Text(ctrafic['message']['text'],
                            style: const TextStyle(
                              fontSize: 16
                            ),
                          ),

                          Text('Mis à jour: ${getTime(ctrafic['updated_at'])}',
                            style: const TextStyle(
                              fontSize: 12
                            ),
                          )
                        ]
                      ),
                    ),
                ]
              ),

// CWORK
            if (getTraficLines(LINES.getLines(lineId).id)['reports'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var ctrafic in getTraficLines(LINES.getLines(lineId).id)['reports']['current_work']) 
                    Container(
                      padding: const EdgeInsets.only(left:15.0, top:10, right:15.0, bottom:10.0),
                      margin: const EdgeInsets.only(top: 5, right:5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (ctrafic['message']['title'] != null)
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right:5),
                                    child: Image(
                                      image:  getSlugImage(ctrafic['severity']),
                                      height: 25,
                                    ),
                                  ),
                                  Expanded(
                                    child: Wrap(
                                      children: [
                                        Text(ctrafic['message']['title'],
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                            
                          Text(ctrafic['message']['text'],
                            style: const TextStyle(
                              fontSize: 16
                            ),
                          ),

                          Text('Mis à jour: ${getTime(ctrafic['updated_at'])}',
                            style: const TextStyle(
                              fontSize: 12
                            ),
                          )
                        ]
                      ),
                    ),
                ]
              ),

// FWORK
            if (getTraficLines(LINES.getLines(lineId).id)['reports'] != null && getTraficLines(LINES.getLines(lineId).id)['reports']['future_work'].length > 0)
              Container(
                padding: const EdgeInsets.only(left:15.0, top:15.0,right:15.0,bottom:15.0),
                      margin: const EdgeInsets.only(top: 5, right:5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('À venir',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    const Divider(
                        height: 25, //height spacing of divider
                        thickness: 3, //thickness of divier line
                        indent: 0, //spacing at the start of divider
                        endIndent: 25, //spacing at the end of divider
                    ),
                    for (var ctrafic in getTraficLines(LINES.getLines(lineId).id)['reports']['future_work']) 
                      Container(
                        margin: const EdgeInsets.only(top: 5, right:5, bottom:15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (ctrafic['message']['title'] != null)
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right:5),
                                      child: Image(
                                        image: getSlugImage(ctrafic['severity']),
                                        height: 25,
                                      ),
                                    ),
                                    Expanded(
                                      child: Wrap(
                                        children: [
                                          Text(ctrafic['message']['title'],
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700
                                            ),
                                          ),
                                        ],
                                      )
                                    )
                                  ],
                                ),
                              ),
                              
                            Text(ctrafic['message']['text'],
                              style: const TextStyle(
                                fontSize: 16
                              ),
                            ),

                            Text('Mis à jour: ${getTime(ctrafic['updated_at'])}',
                              style: const TextStyle(
                                fontSize: 12
                              ),
                            )
                          ]
                        ),
                      ),
                  ],
                )
              )
        
          ],
        )
      )
    );
	}
}
