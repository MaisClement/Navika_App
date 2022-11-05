import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/trafic_block.dart';
import '../widgets/home_body_fav_scroll.dart';
import '../data/global.dart' as globals;

import '../routing.dart';

class HomeBody extends StatelessWidget {
	final ScrollController scrollController;
	final List pointNearby;
  final Map index;

	const HomeBody({
		required this.scrollController,
		required this.pointNearby,
    required this.index,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(top:110),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.grey[200],
    ),
    child: Column(
      children: [
        SizedBox(
          height: 80,
          child: HomeBodyFavScroll(),
        ),
        SizedBox(
          height: 10,
        ),

        // Messages de l'index
        if (index['message'] != null)
          for (var message in index['message'])
            Container(
              padding: EdgeInsets.only(left:15.0, top:10, right:15.0, bottom:10.0),
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                color: getSlugBack(message['severity'], 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (message['message']['title'] != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right:5),
                            child: Image(
                              image: getSlugImage(message['severity'], 1),
                              height: 25,
                            ),
                          ),
                          Expanded(
                            child: Wrap(
                              children: [
                                Text(message['message']['title'],
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
                    
                  Text(message['message']['text'],
                    style: const TextStyle(
                      fontSize: 16
                    ),
                  ),
                ]
              ),
            )

        //
      ],
    )
  );
}