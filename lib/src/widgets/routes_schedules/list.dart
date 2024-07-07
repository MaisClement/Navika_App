// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';

// 🌎 Project imports:
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/routes_schedules.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/utils/real_time.dart';

class RoutesSchedulesList extends StatelessWidget {
  final Map schedule;
  final Map line;
  final String stopId;
  final bool isToday;

  const RoutesSchedulesList({
    required this.schedule,
    required this.line,
    required this.stopId,
    required this.isToday,
    super.key,
  });

  handleTapDetails(context, schedule) {
    if (schedule['id'] != null && schedule['id'] != '') {
      RouteStateScope.of(context).go('/trip/details/${schedule['id']}/from/$stopId');
    } else {
      floatingSnackBar(
        message: 'Les details ne sont pas disponibles pour ce trajet.',
        context: context,
        textStyle: TextStyle(
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        duration: const Duration(milliseconds: 4000),
        backgroundColor: mainColor(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: InkWell(
          onTap: () {
            handleTapDetails(context, schedule);
          },
          child: schedule['date_time'] != null
          ? Row(
            children: [
              if (getSchedulesLate(schedule['date_time']['departure_date_time'], schedule['departure_date_time']) > 0)
                Padding(
                padding: const EdgeInsets.only(right: 7),
                  child: Text(
                    getTime(schedule['departure_date_time']),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: fontFamily,
                      color: const Color(0xffa9a9a9),
                      decoration: TextDecoration.lineThrough
                    ),
                  ),
                ),
              
              Text(
                getTime(schedule['date_time']['departure_date_time']),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: fontFamily,
                  decoration: schedule['date_time']['state'] == 'cancelled'
                    ? TextDecoration.lineThrough
                    : null,
                  color: getSchedulesColorByStateList(schedule['date_time']['state'], getSchedulesLate(schedule['date_time']['departure_date_time'], schedule['departure_date_time']) > 0, context),
                ),
              ),
              if (schedule['date_time']['state'] != 'theorical')
                RealTime(
                  color: getSchedulesColorByStateList(schedule['date_time']['state'], getSchedulesLate(schedule['date_time']['departure_date_time'], schedule['departure_date_time']) > 0, context),
                  height: 18,
                ),
              if (getHeadsign(schedule) != '')
                const SizedBox(
                  width: 10,
                ),
              Text(getHeadsign(schedule),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Diode', //
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  '➜ ${getDirection(schedule)}',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: fontFamily,
                    color: HexColor.fromHex(line['color']),
                  ),
                ),
              ),
            ],
          )
          : Row(
            children: [
              Text(
                getTime(schedule['departure_date_time']),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: fontFamily,
                  color: isToday && isInPast(schedule['departure_date_time'])
                      ? const Color(0xffa9a9a9)
                      : Theme.of(context).colorScheme.onBackground,
                ),
              ),
              if (getHeadsign(schedule) != '')
                const SizedBox(
                  width: 10,
                ),
              Text(getHeadsign(schedule),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Diode', //
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  '➜ ${getDirection(schedule)}',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: fontFamily,
                    color: isToday && isInPast(schedule['departure_date_time'])
                        ? const Color(0xffa9a9a9)
                        : HexColor.fromHex(line['color']),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
