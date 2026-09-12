// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/home/fav_scroll.dart';
import 'package:navika/src/widgets/icons/icons.dart';

// 📦 Package imports:


IconData getPlaceIcon(Map place, bool isHistory) {
  if (isHistory) {
    return NavikaIcons.history;
  } else if (place['type'] == 'stop_area') {
    return NavikaIcons.trainFace;
  } else if (place['type'] == 'home') {
    return NavikaIcons.home;
  } else if (place['type'] == 'work') {
    return NavikaIcons.business;
  } else if (place['type'] == 'favorite') {
    if (place['icon'] == null || place['icon'] == '') {
      return NavikaIcons.star;
    }
    return getFavoriteIcon(place['icon']);
  } else if (place['type'] == 'address') {
    return NavikaIcons.marker;
  } else if (place['type'] == 'locality') {
    return NavikaIcons.city;
  } else if (place['type'] == 'current_pos') {
    return NavikaIcons.localisation;
  } else {
    return NavikaIcons.university;
  }
}

String formatTextDetails(List details) {
  return details.where((str) => str != null && str.isNotEmpty).join(', ');
}

String getTextDetails(Map place) {
  if (place['type'] == 'address') {
    return formatTextDetails([place['zip_code'], place['town'], place['department']]);
  }

  return formatTextDetails([place['town'], place['department'], place['region']]);
}

class PlacesListButton extends StatelessWidget {
  final bool isLoading;
  final bool isHistory;
  final Map place;
  final void Function() onTap;
  final void Function()? onLongPress;

  const PlacesListButton({
    required this.isLoading,
    this.isHistory = false,
    required this.place,
    required this.onTap,
    this.onLongPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Opacity(
          opacity: isLoading ? 0.4 : 1,
          child: Container(
            padding: const EdgeInsets.only(left: 20.0, top: 5.0, right: 5.0, bottom: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      getPlaceIcon(place, isHistory),
                      color: accentColor(context),
                      size: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        place['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: fontFamily,
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
                    margin: const EdgeInsets.only(left: 5.0, top: 4.0),
                    child: Row(
                      children: [
                        const Icon(NavikaIcons.walking, color: Colors.grey, size: 25),
                        Text(
                          '${place['distance']}m',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: fontFamily,
                          ),
                        ),
                        Container(
                          width: 20,
                        ),
                        Text(
                          getTextDetails(place),
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: fontFamily,
                          ),
                        ),
                      ],
                    ),
                  )
                else if (getTextDetails(place) != '')
                  Container(
                    margin: const EdgeInsets.only(left: 5.0, top: 4.0),
                    child: Row(
                      children: [
                        Text(
                          getTextDetails(place),
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: fontFamily,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const SizedBox(
                    height: 5,
                  ),
                Wrap(
                  children: [
                    for (var i = 0; i < place['lines'].length; i++)
                      Icones(
                          line: place['lines'][i],
                          prevLine: i > 0 ? place['lines'][i - 1] : place['lines'][i],
                          i: i,
                          brightness: Theme.of(context).colorScheme.brightness,),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
