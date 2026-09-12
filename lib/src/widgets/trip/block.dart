// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';
import 'package:navika/src/widgets/trip/panel.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

// 🌎 Project imports:
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';

class TripBlock extends StatelessWidget {
  final int id;
  final int length;
  final AutoScrollController controller;
  final String time;
  final String newtime;
  final String arrivaltime;
  final String newarrivaltime;
  final String name;
  final String? message;
  final String? departureState;
  final String? arrivalState;
  final String? state;
  final bool isOffRoute;
  final TripBlockStatus status;
  final Color? color;

  const TripBlock({
    required this.id,
    required this.length,
    required this.controller,
    required this.time,
    this.newtime = '',
    required this.arrivaltime,
    this.newarrivaltime = '',
    required this.name,
    this.message,
    this.departureState,
    this.arrivalState,
    this.state,
    this.isOffRoute = false,
    this.status = TripBlockStatus.active,
    this.color,
    super.key,
  });

  bool get isDeleted => state == 'deleted' || (departureState == 'deleted' && arrivalState == 'deleted');

  @override
  Widget build(BuildContext context) {
    final Color schemaColor = isOffRoute ? const Color(0xff808080) : getActiveColor(context, status, color);
    final Color arrivalSchemaColor = isOffRoute ? const Color(0xff808080) : getArrivalActiveColor(context, status, color);
    final Color timeColor = isDeleted ? getDeletedColor(status) : getActiveColor(context, status, color);
    final Color arrivalTimeColor = isDeleted ? getDeletedArrivalColor(status) : getArrivalActiveColor(context, status, color);

    return AutoScrollTag(
      key: ValueKey(id),
      index: id,
      controller: controller,
      child: Column(
        children: [
          if (id != 0 && (id != length - 1))
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isDeleted)
                  SizedBox(
                    width: 90,
                    child: Center(
                      child: Text(
                        getTime(arrivaltime),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontFamily: fontFamily,
                          fontSize: 14,
                          color: arrivalTimeColor,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: arrivalTimeColor,
                        ),
                      ),
                    ),
                  )
                else if (getDelay(newarrivaltime, arrivaltime) > 0 && time != newtime)
                  SizedBox(
                    width: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: Text(
                            getTime(newarrivaltime),
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontFamily: fontFamily,
                              fontSize: 14,
                              color: timeColor,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            '+${getDelay(newarrivaltime, arrivaltime)} min',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
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
                          fontWeight: FontWeight.w800,
                          fontFamily: fontFamily,
                          fontSize: 14,
                          color: arrivalTimeColor,
                        ),
                      ),
                    ),
                  ),
                Container(
                  height: getDelay(newarrivaltime, arrivaltime) > 0 && getTime(time) != getTime(newtime) ? 40 : 30,
                  width: 10,
                  color: arrivalSchemaColor,
                ),
              ],
            ),
          
          if (id == length - 1)
            Row(
              children: [
                const SizedBox(
                  width: 90,
                ),
                Container(
                  height: 20,
                  width: 10,
                  color: arrivalSchemaColor,
                ),
              ],
            ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time display
              if (isDeleted)
                SizedBox(
                  width: 90,
                  child: Center(
                    child: Text(
                      getTime(time),
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: fontFamily,
                        fontSize: 17,
                        color: timeColor,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: timeColor,
                      ),
                    ),
                  ),
                )
              else if (getDelay(newtime, time) > 0 && getTime(time) != getTime(newtime))
                SizedBox(
                  width: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          getTime(newtime),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: fontFamily,
                            fontSize: 17,
                            color: timeColor,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '+${getDelay(newtime, time)} min',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
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
                        fontWeight: FontWeight.w800,
                        fontFamily: fontFamily,
                        fontSize: 17,
                        color: timeColor,
                      ),
                    ),
                  ),
                ),

              // Route schema
              if (id == 0 || (id == length - 1))
                Container(
                  margin: id == 0 ? const EdgeInsets.only(top: 7) : const EdgeInsets.only(bottom: 5),
                  height: id == 0 ? 45 : 17,
                  width: 10,
                  decoration: BoxDecoration(
                    color: schemaColor,
                    borderRadius: id == 0
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
                    margin: id == 0 ? const EdgeInsets.only(top: 1, bottom: 36, left: 1, right: 1) : const EdgeInsets.only(top: 8, bottom: 1, left: 1, right: 1),
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
                    margin: status == TripBlockStatus.origin ? const EdgeInsets.only(top: 5, bottom: 0) : const EdgeInsets.only(top: 0, bottom: 5),
                    width: 44,
                    height: 10,
                    decoration: BoxDecoration(
                      color: isOffRoute ? const Color(0xff808080) : (color ?? mainColor(context)),
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
                          ? const EdgeInsets.only(top: 1, bottom: 36, left: 1, right: 1)
                          : const EdgeInsets.only(top: 36, bottom: 1, left: 1, right: 1),
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
                  color: schemaColor,
                  child: Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 34, left: 1, right: 1),
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
                padding: const EdgeInsets.only(top: 1.5, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 120,
                      child: Text(
                        name,
                        style: getStopNameStyle(isDeleted, timeColor),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ...getMessage(context, state, departureState, arrivalState, message),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

TextStyle getStopNameStyle(bool isDeleted, Color color) {
  if (isDeleted) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      fontFamily: fontFamily,
      color: color,
      decoration: TextDecoration.lineThrough,
      decorationColor: color,
    );
  }

  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );
}

List<Widget> getMessage(context, state, departureState, arrivalState, message) {
  List<Widget> res = [];

  if (message != null && message != '') {
    res.add(
      Text(
        message,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontFamily: fontFamily,
          fontSize: 12,
        ),
      ),
    );
  }

  String? status = getStateKey(state, departureState, arrivalState);

  if (status == null) {
    return res;
  }

  Map states = getState(context);

  if (states[status] != null) {
    res.add(
      Container(
        padding: const EdgeInsets.only(left: 4, top: 0, right: 4, bottom: 2),
        decoration: BoxDecoration(
          color: states[status]['color'].withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          states[status]['text'],
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontFamily: fontFamily,
            fontSize: 12,
            color: states[status]['color'],
          ),
        ),
      ),
    );
  }

  return res;
}

// The state of the stop tells alone how the itinerary has been modified there.
// The departure and arrival states are only read for the payloads which do not
// carry it.
String? getStateKey(state, departureState, arrivalState) {
  if (state == 'exceptional_terminus' || state == 'exceptional_origin' || state == 'added' || state == 'deleted') {
    return state;
  }

  if (departureState == null || arrivalState == null) {
    return null;
  }

  if (arrivalState != departureState) {
    // The vehicle arrives but never leaves : it ends its trip here.
    if (departureState == 'deleted') {
      return 'terminus_deleted';
    }

    // The vehicle leaves but never arrives : it starts its trip here.
    if (arrivalState == 'deleted') {
      return 'origin_deleted';
    }
  }

  return departureState;
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
    'exceptional_origin': {
      'text': AppLocalizations.of(context)!.exceptional_origin,
      'color': const Color(0xffeb2031),
    },
    'exceptional_terminus': {
      'text': AppLocalizations.of(context)!.exceptional_terminus,
      'color': const Color(0xffeb2031),
    },
    'origin_added': {
      'text': AppLocalizations.of(context)!.new_departure_station,
      'color': const Color(0xff005bbc),
    },
    'origin_deleted': {
      'text': AppLocalizations.of(context)!.exceptional_origin,
      'color': const Color(0xffeb2031),
    },
    'terminus_added': {
      'text': AppLocalizations.of(context)!.exceptional_terminus,
      'color': const Color(0xff005bbc),
    },
    'terminus_deleted': {
      'text': AppLocalizations.of(context)!.exceptional_terminus,
      'color': const Color(0xffeb2031),
    }
  };
}
