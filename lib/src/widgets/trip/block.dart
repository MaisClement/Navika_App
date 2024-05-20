// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

// 🌎 Project imports:
import 'package:navika/src/screens/trip_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';

class TripBlock extends StatelessWidget {
  final int id;
  final AutoScrollController controller;
  final String time;
  final String newtime;
  final String arrivaltime;
  final String newarrivaltime;
  final String name;
  final String? message;
  final String? departureState;
  final String? arrivalState;
  final String type;
  final TripBlockStatus status;

  const TripBlock({
    required this.id,
    required this.controller,
    required this.time,
    this.newtime = '',
    required this.arrivaltime,
    this.newarrivaltime = '',
    required this.name,
    this.message,
    this.departureState,
    this.arrivalState,
    required this.type,
    this.status = TripBlockStatus.active,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AutoScrollTag(
    key: ValueKey(id),
    index: id,
    controller: controller,
    child: Column(
      children: [
        if (type != 'origin' && type != 'terminus')
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (departureState == 'deleted' && arrivalState == 'deleted')
                    SizedBox(
                      width: 90,
                      child: Center(
                        child: Text(
                          getTime(arrivaltime),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: fontFamily,
                              fontSize: 17,
                              color: const Color(0xff808080),
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                    )
                  else if (arrivalState == 'delayed' && time != newtime)
                    SizedBox(
                      width: 90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Text(
                              getTime(newarrivaltime),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: fontFamily,
                                fontSize: 14,
                                color: getActiveColor(context, status),
                              ),
                            ),
                          ),
                          Center(
                          child: Text(
                            '+${getDelay(newarrivaltime, arrivaltime)} min',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: fontFamily,
                              fontSize: 14,
                              color: const Color(0xfff68f53),
                            ),
                          ),
                        )
                        ],
                      ),
                    )
                  else
                    SizedBox(
                      width: 90,
                      child: Center(
                        child: Text(
                          getTime(arrivaltime),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: fontFamily,
                            fontSize: 14,
                            color: getArrivalActiveColor(context, status),
                          ),
                        ),
                      ),
                    ),
              Container(
                height: departureState == 'delayed' && getTime(time) != getTime(newtime) ? 40 : 30,
                width: 10,
                color: getArrivalActiveColor(context, status),
              ),
            ],
          ),
    
        if (type == 'terminus')
        Row(
            children: [
              const SizedBox(
                width: 90,
              ),
              Container(
                height: 20,
                width: 10,
                color: getArrivalActiveColor(context, status),
              ),
            ],
          ),
    
        Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
    // Time display
                if (departureState == 'deleted' && arrivalState == 'deleted')
                  SizedBox(
                    width: 90,
                    child: Center(
                      child: Text(
                        getTime(time),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: fontFamily,
                            fontSize: 17,
                            color: const Color(0xff808080),
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  )
                else if ((departureState == 'delayed' || arrivalState == 'delayed') && getTime(time) != getTime(newtime))
                  SizedBox(
                    width: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: Text(
                            getTime(newtime),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: fontFamily,
                              fontSize: 17,
                              color: getActiveColor(context, status),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            '+${getDelay(newtime, time)} min',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: fontFamily,
                              fontSize: 14,
                              color: const Color(0xfff68f53),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                else
                  SizedBox(
                    width: 90,
                    child: Center(
                      child: Text(
                        getTime(time),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: fontFamily,
                          fontSize: 17,
                          color: getActiveColor(context, status),
                        ),
                      ),
                    ),
                  ),
    
    // Route schema
                if (type == 'origin' || type == 'terminus')
                  Container(
                    margin: type == 'origin'
                        ? const EdgeInsets.only(top: 7)
                        : const EdgeInsets.only(bottom: 5),
                    height: type == 'origin'
                        ? 45
                        : 17,
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
                              top: 1, bottom: 36, left: 1, right: 1)
                          : const EdgeInsets.only(
                              top: 8, bottom: 1, left: 1, right: 1),
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
                          ? const EdgeInsets.only(top: 5, bottom: 0)
                          : const EdgeInsets.only(top: 0, bottom: 5),
                      width: 44,
                      height: 10,
                      decoration: BoxDecoration(
                        color: mainColor(context),
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
                                top: 1, bottom: 36, left: 1, right: 1)
                            : const EdgeInsets.only(
                                top: 36, bottom: 1, left: 1, right: 1),
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
                          top: 8, bottom: 34, left: 1, right: 1),
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
                  padding: const EdgeInsets.only(top:1.5, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: getStyleByEffect(departureState, arrivalState),
                      ),
                      ...getMessage(context, departureState, arrivalState, message),
                    ],
                  ),
                ),
              ],
            ),
      ],
    ),
  );
}

TextStyle getStyleByEffect(departureState, arrivalState) {
  if (departureState == 'deleted' && arrivalState == 'deleted') {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: const Color(0xff808080),
        decoration: TextDecoration.lineThrough);
  } else {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: fontFamily,
    );
  }
}

List<Widget> getMessage(context, departureState, arrivalState, message) {
  List<Widget> res = [];

  if (message != null && message != '') {
    res.add(
      Text(
        message,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
          fontSize: 12,
        ),
      ),
    );
  }

  if (departureState == null || arrivalState == null) {
    return res;
  }

  String status = departureState;

  if (arrivalState != departureState) {
    if (departureState == 'deleted') {
      status = 'terminus_deleted';
    }

    if (arrivalState == 'deleted') {
      status = 'origin_deleted';
    }
  }

  if (getState(context)[status] != null) {
    res.add(
      Container(
        padding: const EdgeInsets.only(left: 4, top: 0, right: 4, bottom: 2),
        decoration: BoxDecoration(
          color: getState(context)[status]['color'].withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          getState(context)[status]['text'],
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: fontFamily,
            fontSize: 12,
            color: getState(context)[status]['color'],
          ),
        ),
      ),
    );
  }

  return res;
}

Map getState(context) {
  return {
    'added': {
      'text': AppLocalizations.of(context)!.additional_stop,
      'color': const Color(0xff005bbc),
    },
    'deleted': {
      'text': AppLocalizations.of(context)!.stop_deleted,
      'color': const Color(0xffeb2031),
    },
    'origin_added': {
      'text': AppLocalizations.of(context)!.new_departure_station,
      'color': const Color(0xff005bbc),
    },
    'origin_deleted': {
      'text': AppLocalizations.of(context)!.new_departure_station,
      'color': const Color(0xffeb2031),
    },
    'terminus_added': {
      'text': 'Terminus exceptionel',
      'color': const Color(0xff005bbc),
    },
    'terminus_deleted': {
      'text': 'Terminus exceptionel',
      'color': const Color(0xffeb2031),
    }
  };
}
