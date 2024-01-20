import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';

String getPosition(List position) {
  String res = '';
  if (position.isEmpty) {
    res = '';
  } else if (position.length == 1) {
    res = position[0];
  } else if (position.length == 2) {
    res = '${position[0]} et ${position[1]}';
  } else {
    
    for (int i = 0; i < position.length - 1; i++) {
      res += '${position[i]}, ';
    }
    
    res += 'et ${position.last}';
  }
  
  res = res.replaceAll('back', 'Arrière');
  res = res.replaceAll('middle', 'Milieu');
  res = res.replaceAll('front', 'Avant');
  
  return res;
}

class BoardingPosition extends StatelessWidget {
  final List position;

  const BoardingPosition({
    required this.position,
    super.key
  });

  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.only(
      top: 10, right: 10
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        right: 15, left: 15, top: 5, bottom: 7
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Où monter ?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                )
              ),
              const SizedBox(
                width: 10,
              ),
              Text(getPosition(position),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                  color: accentColor(context),
                )
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Icon(NavikaIcons.position_back,
                size: 50,
                color: position.contains('back') ? accentColor(context) : Colors.grey,
              ),
              Icon(NavikaIcons.position_middle,
                size: 50,
                color: position.contains('middle') ? accentColor(context) : Colors.grey,
              ),
              Icon(NavikaIcons.position_front,
                size: 50,
                color: position.contains('front') ? accentColor(context) : Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10, top: 15
                ),
                child: Icon(NavikaIcons.avance,
                  size: 20,
                  color: accentColor(context),
                ),
              ),
            ],
          )
          
        ],
      ),
    ),
    );
}
