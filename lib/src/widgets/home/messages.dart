import 'package:flutter/material.dart';

import '../trafic/block.dart';

class Home_Messages extends StatelessWidget {
  Map message;
  void Function()? onTap;

	Home_Messages({
    required this.message,
    this.onTap,
		super.key,
	});

  String getPlaceIcon(type){
    if (type == 'stop_area'){
      return "assets/train.svg";
    } else if (type == 'address'){
      return "assets/marker.svg";
    } else if (type == 'administrative_region'){
      return "assets/city.svg";
    } else {
      return "assets/null.png";
    } 
  }

	@override
	Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left:15.0, top:10, right:15.0, bottom:10.0),
    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                  margin: const EdgeInsets.only(right:5),
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
  );
}
