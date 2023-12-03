import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/extensions/datetime.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/screens/routes_details.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/routes_schedules/list.dart';
import 'package:navika/src/widgets/utils/search_box.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:navika/src/data/global.dart' as globals;

String getDirection(schedules) {
  return schedules['stop_name'];
}

String getHeadsign(schedules) {
  if (schedules['direction'].length == 4) {
    return schedules['direction'];
  }
  return '';
}

List groupObjectsByHour(inputList) {
  Map groupedMap = {};

  for (var obj in inputList) {
    String hourKey = getHour(obj['departure_date_time']);

    if (groupedMap.containsKey(hourKey)) {
      groupedMap[hourKey]?.add(obj);
    } else {
      groupedMap[hourKey] = [obj];
    }
  }

  List groupedObjects = [];
  groupedMap.forEach((hour, objects) {
    groupedObjects.add(objects);
  });

  return groupedObjects;
}

int getPageToSlide(List line, String direction) {
  // foreach line, if in the direction, return the index of the line
  for (int i = 0; i < line.length; i++) {
    for (int y = 0; y < line[i].length; y++) {
      if (line[i][y]['stop_name'] == direction) {
        return i;
      }
    }
  }

  return 0;
}

class RoutesSchedules extends StatefulWidget {
  final String routeId;
  final String stopId;

  const RoutesSchedules(
      {required this.routeId, required this.stopId, super.key});

  @override
  State<RoutesSchedules> createState() => _RoutesSchedulesState();
}

class _RoutesSchedulesState extends State<RoutesSchedules> with SingleTickerProviderStateMixin {
  PageController controller = PageController();
  final AutoScrollController _scrollController = AutoScrollController(suggestedRowHeight: 150);
  bool isLoading = true;
  bool loadingNewDay = false;
  Map line = {};
  ApiStatus error = ApiStatus.ok;
  DateTime selectedDate = DateTime.now();
  bool isToday = true;

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        isToday = picked.isToday();
      });
      await _getLine();
    }
  }

  Future<void> _getLine() async {
    setState(() {
      loadingNewDay = true;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getLineSchedules(widget.routeId, widget.stopId, selectedDate);

    if (mounted) {
      setState(() {
        error = result['status'];
      });

      setState(() {
        line = result['value']?['line'];
        isLoading = false;
        loadingNewDay = false;
        
        if (globals.direction != null) {
          int page = getPageToSlide(line['schedules'], globals.direction!);
          controller = PageController(initialPage: page);
          globals.direction = null;
        }
        _scrollController.scrollToIndex(DateTime.now().hour,preferPosition: AutoScrollPosition.begin);
      });
    }
  }

  List getSchedulesBlock(context, controller, line, schedules) {
    List els = groupObjectsByHour(schedules);

    List res = [];

    for (var hour in els) {
      res.add(
        AutoScrollTag(
          key: ValueKey(getIntHour(hour[0]['departure_date_time'])),
          index: getIntHour(hour[0]['departure_date_time']),
          controller: controller,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  for (var schedule in hour)
                    RoutesSchedulesList(
                      schedule: schedule,
                      line: line,
                      stopId: widget.stopId,
                      isToday: isToday,
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return res;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getLine();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: isLoading
              ? const Text('Horaires', style: appBarTitle)
              : Text('Ligne ${line['name']}', style: appBarTitle),
        ),
        body: isLoading
            ? const LinearProgressIndicator()
            : Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Row(children: [
                        Icones(
                          line: line,
                          i: 0,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Text(
                          getTerminus(line),
                          style: TextStyle(
                              fontFamily: 'Segoe Ui',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: HexColor.fromHex(line['color'])),
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ))
                      ])),
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: SearchBox(
                      text: getDate(selectedDate),
                      icon: NavikaIcons.calendar,
                      onTap: () async {
                        await selectDate(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (line['schedules'].length > 1)
                    SmoothPageIndicator(
                      controller: controller, // PageController
                      count: line['schedules'].length,
                      effect: ExpandingDotsEffect(
                          offset: 6,
                          dotWidth: 6,
                          dotHeight: 6,
                          activeDotColor: accentColor(
                              context)), // HexColor.fromHex(line['color'])),
                    ),
                  if (loadingNewDay) const LinearProgressIndicator(),
                  Expanded(
                    child: PageView(
                      controller: controller,
                      children: [
                        if (line['schedules'].isEmpty)
                          const PlacesEmpty()
                        else
                          for (var schedule in line['schedules'])
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (line['schedules'].length > 1)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      '➜ ${getDirection(schedule[0])}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Segoe Ui',
                                        color: HexColor.fromHex(line['color']),
                                      ),
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                Expanded(
                                  child: ListView(
                                    controller: _scrollController,
                                    children: [
                                      ...getSchedulesBlock(context,
                                          _scrollController, line, schedule)
                                    ],
                                  ),
                                )
                              ],
                            )
                      ],
                    ),
                  ),
                ],
              ),
      );
}
