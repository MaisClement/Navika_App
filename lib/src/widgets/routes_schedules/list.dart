import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/routes_schedules.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/utils/real_time.dart';
import 'package:shimmer/shimmer.dart';

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
      RouteStateScope.of(context).go('/trip/details/${schedule['id']}/from/${stopId}');
    } else {
      FloatingSnackBar(
        message: 'Les details ne sont pas disponibles pour ce trajet.',
        context: context,
        textColor: mainColor(context),
        textStyle: const TextStyle(
          color: Color(0xffffffff),
          fontWeight: FontWeight.w600,
          fontFamily: 'Segoe Ui',
        ),
        duration: const Duration(milliseconds: 4000),
        backgroundColor: const Color(0xff272727),
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
              if (getSchedulesLate(schedule['date_time']['departure_date_time'], schedule['date_time']['base_departure_date_time']) > 0)
                Padding(
                padding: const EdgeInsets.only(right: 7),
                  child: Text(
                    getTime(schedule['date_time']['base_departure_date_time']),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      color: Color(0xffa9a9a9),
                      decoration: TextDecoration.lineThrough
                    ),
                  ),
                ),
              
              Text(
                getTime(schedule['date_time']['departure_date_time']),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                  decoration: schedule['date_time']['state'] == 'cancelled'
                    ? TextDecoration.lineThrough
                    : null,
                  color: getSchedulesColorByStateList(schedule['date_time']['state'], context),
                ),
              ),
              if (schedule['date_time']['state'] != 'theorical')
                RealTime(
                  color: getSchedulesColorByStateList(schedule['date_time']['state'], context),
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
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
                  fontFamily: 'Segoe Ui',
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
                    fontFamily: 'Segoe Ui',
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
