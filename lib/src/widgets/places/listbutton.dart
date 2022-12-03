import 'package:flutter/material.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';

import 'package:navika/src/widgets/icons/icons.dart';

class PlacesListButton extends StatelessWidget {
  bool isLoading;
  Map place;
  void Function() onTap;

	PlacesListButton({
    required this.isLoading,
    required this.place,
    required this.onTap,
		super.key,
	});

  IconData getPlaceIcon(type){
    if (type == 'stop_area'){
      return ScaffoldIcon.train_2;
    } else if (type == 'address'){
      return ScaffoldIcon.marker;
    } else if (type == 'administrative_region'){
      return ScaffoldIcon.city;
    } else {
      return ScaffoldIcon.university;
    } 
  }

	@override
	Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Opacity(
      opacity: isLoading ? 0.4 : 1,
      child: Container(
        padding: const EdgeInsets.only(left:20.0, top:5.0,right:5.0,bottom:5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(getPlaceIcon(place['type']),
                  color: Theme.of(context).colorScheme.primary,
                  size: 25
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(place['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            
            if (place['distance'] == 0)
              Container(
                margin: const EdgeInsets.only(left:5.0, top:4.0),
                child: Text( place['zip_code'] == '' ? place['town'] : '${place['zip_code']}, ${place['town']}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Segoe Ui',
                  ),
                ),
              ),

            if (place['distance'] != 0)
              Container(
                margin: const EdgeInsets.only(left:5.0, top:4.0),
                child: Row(
                  children: [
                    const Icon(ScaffoldIcon.walking,
                      color: Colors.grey,
                      size: 25
                    ),
                    Text('${place['distance']}m',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Segoe Ui',
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    Text( place['zip_code'] == '' ? place['town'] : '${place['zip_code']}, ${place['town']}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Segoe Ui',
                      ),
                    ),
                  ],
                )
              ),

            Wrap( 
              children: [
                for (var i = 0; i < place['lines'].length; i++)
                
                  Icones(
                    line: place['lines'][i],
                    oldLine: i > 0 ? place['lines'][i - 1] : place['lines'][i],
                    i: i,
                  )
                
              ]
            )
          ]
        )
      ),
    ),                
  );
}
