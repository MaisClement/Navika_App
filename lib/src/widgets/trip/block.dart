import 'package:flutter/material.dart';
import 'package:navika/src/screens/trip_details.dart';
import 'package:navika/src/style/style.dart';

class TripBlock extends StatelessWidget {
  final String time;
  final String newtime;
  final String name;
  final String? message;
  final String type;
  final TripBlockEffect effect;
  final TripBlockStatus status;

  const TripBlock({
    required this.time,
    this.newtime = '',
    required this.name,
    this.message = '',
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
            SizedBox(
              width: 90,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  time,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Segoe Ui',
                      fontSize: 17,
                      color: Color(0xff808080),
                      decoration: TextDecoration.lineThrough),
                ),
              ),
            )
          else if (effect == TripBlockEffect.delayed && time != newtime)
            SizedBox(
              width: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
              ),
            )
          else
            SizedBox(
              width: 90,
              child: Padding(
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
                    ? const EdgeInsets.only(
                        top: 1, bottom: 21, left: 1, right: 1)
                    : const EdgeInsets.only(
                        top: 21, bottom: 1, left: 1, right: 1),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          else if (status == TripBlockStatus.origin ||
              status == TripBlockStatus.terminus)
            Container(
              height: 50,
              width: 10,
              color: const Color(0xff808080),
              child: Container(
                margin: status == TripBlockStatus.origin
                    ? const EdgeInsets.only(top: 21, bottom: 0)
                    : const EdgeInsets.only(top: 0, bottom: 21),
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
                      ? const EdgeInsets.only(
                          top: 1, bottom: 20, left: 1, right: 1)
                      : const EdgeInsets.only(
                          top: 20, bottom: 1, left: 1, right: 1),
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
                    top: 21, bottom: 21, left: 1, right: 1),
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

// Name
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: getStyleByEffect(effect),
                ),
                ...getMessage(effect, message),
              ],
            ),
          ),
        ],
      );
}

TextStyle getStyleByEffect(effect) {
  if (effect == TripBlockEffect.deleted) {
    return const TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Segoe Ui',
        fontSize: 15,
        color: Color(0xff808080),
        decoration: TextDecoration.lineThrough);
  } else {
    return const TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: 'Segoe Ui',
      fontSize: 15,
    );
  }
}

List<Widget> getMessage(effect, message) {
  List<Widget> res = [];

  if (state[effect] != null) {
    res.add(
      Container(
        padding: const EdgeInsets.only(left:4, top:2, right:4, bottom:2),
        decoration: BoxDecoration(
          color: state[effect]['color'].withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          state[effect]['text'],
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Segoe Ui',
            fontSize: 12,
            color: state[effect]['color'],
          ),
        ),
      )
    );
  }

  return res;
}

Map state = {
  TripBlockEffect.added: {
    'text': 'Arrêt supplémentaire',
    'color': Color(0xff005bbc),
  },
  TripBlockEffect.deleted: {
    'text': 'Arrêt supprimé',
    'color': Color(0xffeb2031),
  }
};