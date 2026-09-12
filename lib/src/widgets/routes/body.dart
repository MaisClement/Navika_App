// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/widgets/utils/button_large_trafic.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:navika/src/data/global.dart' as globals;

// 🌎 Project imports:
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/routes_schedules/list.dart';
import 'package:navika/src/screens/routes_schedules.dart';

Map<String, dynamic> groupDeparturesByDirection(Map? data) {
  final Map<String, List<dynamic>> departures = {};
  final List<Map<String, dynamic>> directions = [];
  final Set<String> seen = {};

  if (data == null) return {'departures': {}, 'directions': []};
  final deps = data['departures'];
  if (deps == null || deps is! List) return {'departures': {}, 'directions': []};

  for (final item in deps) {
    if (item is! Map) continue;
    final info = item['informations'];
    if (info == null || info is! Map) continue;
    final dir = info['direction'];
    if (dir == null || dir is! Map) continue;

    final dirIdVal = dir['direction_id'];
    final dirKey = dirIdVal != null ? dirIdVal.toString() : (dir['id'] ?? '').toString();

    departures.putIfAbsent(dirKey, () => []).add(item);

    if (!seen.contains(dirKey)) {
      seen.add(dirKey);
      directions.add({
        'id': dir['id'],
        'name': dir['name'],
        'direction_id': dirIdVal,
      });
    }
  }

  return {'departures': departures, 'directions': directions};
}

class RouteSchedulePanel extends StatefulWidget {
  final String id;
  final String routeId;
  final Function setData;
  final Map? data;
  final Function setColor;
  final dynamic color;

  const RouteSchedulePanel({
    required this.id,
    required this.routeId,
    required this.setData,
    required this.data,
    required this.setColor,
    required this.color,
    super.key,
  });

  @override
  State<RouteSchedulePanel> createState() => _RouteSchedulePanelState();
}

class _RouteSchedulePanelState extends State<RouteSchedulePanel> {
  Map line = {};
  late PageController controller;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.data != null && widget.data is Map && widget.data!['route'] != null) {
      line = widget.data!['route'];
    } else {
      line = {};
    }

    int initialPage = 0;
    try {
      if (line['schedules'] != null && line['schedules'] is List && line['schedules'].isNotEmpty) {
        initialPage = 0;
      }
    } catch (_) {}
    controller = PageController(initialPage: initialPage);
  }

  @override
  void dispose() {
    controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
      final routeData = widget.data!['route'] ?? {};
      final grouped = groupDeparturesByDirection(routeData);
      final List directions = (grouped['directions'] as List?) ?? const [];
      final int pageCount = directions.length;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ButtonLargeTrafic(
              line: widget.data!['route'],
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                globals.lineTrafic = widget.data!['route'];
                RouteStateScope.of(context).go('/trafic/details');
              },
            ),
          ),
          SizedBox(height: 10),
          if (pageCount > 1)
            Row(
              children: [
                SizedBox(width: 15),
                SmoothPageIndicator(
                  controller: controller,
                  count: pageCount,
                  effect: ExpandingDotsEffect(
                    offset: 6,
                    dotWidth: 6,
                    dotHeight: 6,
                    activeDotColor: invertedSchedulesBlock(context, HexColor.fromHex(routeData['color'])),
                  ),
                ),
              ],
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView(
              controller: controller,
              children: [
                if (pageCount == 0)
                  const PlacesEmpty()
                else
                  for (var direction in directions)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                          child: Text(
                            "➜ ${direction['name']}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              fontFamily: fontFamily,
                              color: invertedSchedulesBlock(context, HexColor.fromHex(routeData['color'])),
                            ),
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ],
      );
    }
    return Container();
  }
}
