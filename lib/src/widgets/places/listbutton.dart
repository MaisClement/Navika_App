// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/icons/icons.dart';

IconData getPlaceIcon(type){
  if (type == 'stop_area'){
    return NavikaIcons.trainFace;
  } else if (type == 'home'){
    return NavikaIcons.home;
  } else if (type == 'work'){
    return NavikaIcons.business;
  } else if (type == 'favorite'){
    return NavikaIcons.star;
  } else if (type == 'address'){
    return NavikaIcons.marker;
  } else if (type == 'locality'){
    return NavikaIcons.city;
  } else if (type == 'current_pos'){
    return NavikaIcons.localisation;
  } else if (type == 'history'){
    return NavikaIcons.history;
  } else {
    return NavikaIcons.university;
  } 
}

String formatTextDetails(List details) {
  return details.where((str) => str != null && str.isNotEmpty).join(', ');
}

String getTextDetails(Map place) {
  if (place['type'] == 'address') {
    return formatTextDetails([
      place['zip_code'],
      place['town'],
      place['department']
    ]);
  }

  return formatTextDetails([
    place['town'],
    place['department'],
    place['region']
  ]);
}

class PlacesListButton extends StatelessWidget {
  final bool isLoading;
  final Map place;
  final void Function() onTap;

	const PlacesListButton({
    required this.isLoading,
    required this.place,
    required this.onTap,
		super.key,
	});

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
                  color: accentColor(context),
                  size: 25,
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
                      color: accentColor(context),
                    ),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            
            if (place['distance'] != 0)
              Container(
                margin: const EdgeInsets.only(left:5.0, top:4.0),
                child: Row(
                  children: [
                    const Icon(NavikaIcons.walking,
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
                    Text(getTextDetails(place),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Segoe Ui',
                      ),
                    ),
                  ],
                )
              )
            else 
              Container(
                margin: const EdgeInsets.only(left:5.0, top:4.0),
                child: Row(
                  children: [
                    Text(getTextDetails(place),
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
                    prevLine: i > 0 ? place['lines'][i - 1] : place['lines'][i],
                    i: i,
                    brightness: Theme.of(context).colorScheme.brightness
                  )
                
              ]
            )
          ]
        )
      ),
    ),                
  );
}
