import 'package:flutter/material.dart';

import 'package:navika/src/data/lines.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/home/messages.dart';
import 'package:navika/src/widgets/trafic/block.dart';

Color getSlugBack(severity, [type]){
  if (severity == 0 && (type == null || type == 0)){
    return Colors.transparent;
  } else if (severity == 0 && type != null && type == 1){
    return const Color(0xff008b5b).withOpacity(0.1);
  } else if (severity == 5){
    return const Color(0xffeb2031).withOpacity(0.1);
  } else if (severity == 4){
    return const Color(0xfff68f53).withOpacity(0.1);
  } else if (severity == 3){
    return const Color(0xfff68f53).withOpacity(0.1);
  } else if (severity == 2){
    return const Color(0xfff68f53).withOpacity(0.1);
  } else if (severity == 1){
    return const Color(0xff005bbc).withOpacity(0.1);
  } else if (type != null && type == 1) {
    return const Color(0xff008b5b).withOpacity(0.1);
  } else {
    return Colors.transparent;
  }
}

class TraficDetails extends StatelessWidget {
	final String lineId;

	const TraficDetails({
		super.key,
		required this.lineId,
	});

  String getTime(String time){
    DateTime dttime = DateTime.parse(time);

    String dtday = dttime.day < 10 ? '0${dttime.day}' : dttime.day.toString();
    String dtmonth = dttime.month < 10 ? '0${dttime.month}' : dttime.month.toString();
    String dtyear = dttime.year.toString();
    String dthour = dttime.hour < 10 ? '0${dttime.hour}' : dttime.hour.toString();
    String dtminute = dttime.minute < 10 ? '0${dttime.minute}' : dttime.minute.toString();

    return '$dtday/$dtmonth/$dtyear $dthour:$dtminute';
  }

	@override
	Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Info Trafic',
            style: appBarTitle
          ),

          if (LINES.getLines(lineId).libelle != '')
            Text(LINES.getLines(lineId).libelle,
              style: appBarSubtitle
            ),
        ],
      ),
    ),
    body: Container(
      padding: const EdgeInsets.only(left:10.0, right:10.0),
      width: double.infinity,
      child: ListView(
        children: [
          
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
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
                          color: getSlug( getTraficLines(LINES.getLines(lineId).id)['severity'] , 1),
                        ),
                      ),
                      child: Image(image: AssetImage(LINES.getLines(lineId).image)),
                    ),
                    Positioned(
                      width: 20,
                      height: 20,
                      top: 43,
                      left: 43,
                      child: Image(image: getSlugImage( getTraficLines(LINES.getLines(lineId).id)['severity'] , 1)),
                    )
                  ],
                ),
                Expanded(
                  child: Wrap(
                    children: [
                      Text(getSlugTitle( getTraficLines(LINES.getLines(lineId).id)['severity'] ),
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
            for (var ctrafic in getTraficLines(LINES.getLines(lineId).id)['reports']['current_trafic']) 
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Container(
                    padding: const EdgeInsets.only(left:15.0, top:10, right:15.0, bottom:10.0),
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: getSlugBack( ctrafic['severity'], 1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5), 
                      ),
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
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:  getSlugColor( ctrafic['severity'], 1),
                    )
                  ),
              ]
            ),

// CWORK
          if (getTraficLines(LINES.getLines(lineId).id)['reports'] != null)
            for (var ctrafic in getTraficLines(LINES.getLines(lineId).id)['reports']['current_work']) 
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left:15.0, top:10, right:15.0, bottom:10.0),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: getSlugBack( ctrafic['severity'], 1),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5), 
                      ),
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
                Container(
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:  getSlugColor( ctrafic['severity'], 1),
                  )
                ),
              ]
            ),

// FWORK
          if (getTraficLines(LINES.getLines(lineId).id)['reports'] != null && getTraficLines(LINES.getLines(lineId).id)['reports']['future_work'].length > 0)
            Container(
              padding: const EdgeInsets.only(left:15.0, top:15.0,right:15.0,bottom:15.0),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: accentColor(context).withOpacity(0.1),
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
