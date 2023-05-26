import 'package:flutter/material.dart';
import 'package:navika/src/screens/trip_details.dart';
import 'package:navika/src/style/style.dart';

Color getActiveColor(context, status) {
  if (status == TripBlockStatus.inactive){
    return const Color(0xff808080);
  }  
  return Theme.of(context).colorScheme.primary;
}

class TripBlock extends StatelessWidget {
  final String time;
  final String newtime;
  final String name;
  final String type;
  final TripBlockEffect effect;
  final TripBlockStatus status;

  const TripBlock({
    required this.time,
    this.newtime = '',
    required this.name,
    required this.type,
    this.effect = TripBlockEffect.none,
    this.status = TripBlockStatus.active,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
// Time display
          if (effect == TripBlockEffect.deleted)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                time,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Segoe Ui',
                    fontSize: 17,
                    color: Color(0xffeb2031),
                    decoration: TextDecoration.lineThrough),
              ),
            )
          else if (effect == TripBlockEffect.delayed && time != newtime)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    newtime,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Segoe Ui',
                      fontSize: 17,
                      color: Color(0xfff68f53),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    time,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Segoe Ui',
                      fontSize: 14,
                      color: Color(0xff808080),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                )
              ],
            )
          else
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Segoe Ui',
                  fontSize: 17,
                  color: status == TripBlockStatus.inactive
                      ? const Color(0xff808080)
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),

// Route schema
          if (type == 'origin' || type == 'terminus')
            Container(
              margin: type == 'origin'
                  ? const EdgeInsets.only(top: 20)
                  : const EdgeInsets.only(bottom: 20),
              height: 30,
              width: 10,
              decoration: BoxDecoration(
                color: getActiveColor(context, status),
                borderRadius: type == 'origin'
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                      )
                    : const BorderRadius.only(
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
              ),
              child: Container(
                margin: type == 'origin'
                    ? const EdgeInsets.only(top: 1, bottom: 21, left: 1, right: 1)
                    : const EdgeInsets.only(top: 21, bottom: 1, left: 1, right: 1),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
            
          else if (status == TripBlockStatus.origin || status == TripBlockStatus.terminus)
            Container(
              height: 50,
              width: 10,
              color: const Color(0xff808080),
              child: Container(
                margin: status == TripBlockStatus.origin
                ? const EdgeInsets.only(top: 21, bottom: 0)
                :  const EdgeInsets.only(top: 0, bottom: 21),
                width: 29,
                height: 10,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: status == TripBlockStatus.origin
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                      )
                    : const BorderRadius.only(
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                ),
                child: Container(
                  margin: status == TripBlockStatus.origin
                    ? const EdgeInsets.only( top: 1, bottom: 20, left: 1, right: 1)
                    : const EdgeInsets.only( top: 20, bottom: 1, left: 1, right: 1),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            )

          else
            Container(
              height: 50,
              width: 10,
              color: getActiveColor(context, status),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 21, 
                  bottom: 21, 
                  left: 1, 
                  right: 1),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),


          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Segoe Ui',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
