import 'dart:async';

import 'package:flutter/material.dart';

import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/home_search.dart';
import 'package:navika/src/widgets/departures/list.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/schedules/list.dart';

// This function processes the provided data to extract and return a list of lines
/// Extracts lines from API response `data`.
List<Map<String, dynamic>> getLines(Map<String, dynamic> data, bool ungroupDepartures) {
  final List<Map<String, dynamic>> lines = [];

  if (data['departures'] != null && data['departures'] is List) {
    final List departures = data['departures'];
    if (ungroupDepartures) {
      for (final departure in departures) {
        final line = departure['informations']?['line'];
        if (line is Map<String, dynamic> && !lines.any((l) => l['id'] == line['id'])) {
          lines.add(line);
        }
      }
    } else {
      for (final departure in departures) {
        if (departure is Map) {
          final copy = <String, dynamic>{...Map<String, dynamic>.from(departure)};
          copy.remove('departures');
          lines.add(copy);
        }
      }
    }
  }

  if (data['schedules'] != null && data['schedules'] is List) {
    for (final schedule in data['schedules']) {
      if (schedule is Map) {
        final copy = <String, dynamic>{...Map<String, dynamic>.from(schedule)};
        copy.remove('schedules');
        lines.add(copy);
      }
    }
  }

  return lines;
}

int getModesLength(List modes) {
  var count = 0;
  for (final allowes in allowedModes.entries) {
    if (modes.any((mode) => allowes.value.contains(mode))) count++;
  }
  return count;
}

List<Widget> getModesTabs(List modes) {
  final List<Widget> tabs = [];
  for (final allowes in allowedModes.entries) {
    if (modes.any((mode) => allowes.value.contains(mode))) {
      tabs.add(Tab(icon: tabsModes[allowes.key]!['icon'] as Widget, iconMargin: const EdgeInsets.only(bottom: 5, top: 5)));
    }
  }
  return tabs;
}

final Map allowedModes = {
  'rail': [
    'physical_mode:RapidTransit',
    'physical_mode:Train',
    'physical_mode:RailShuttle',
    'physical_mode:LocalTrain',
    'physical_mode:LongDistanceTrain',
    'rail',
    'nationalrail',
  ],
  'metro': ['physical_mode:Metro', 'physical_mode:RailShuttle', 'metro', 'funicular'],
  'tram': ['physical_mode:Tramway', 'tram'],
  'bus': ['physical_mode:Bus', 'bus'],
};

final Map<String, Map<String, Widget>> tabsModes = {
  'rail': {'icon': const Icon(NavikaIcons.idfmTrainRer)},
  'metro': {'icon': const Icon(NavikaIcons.metro)},
  'tram': {'icon': const Icon(NavikaIcons.idfmTram)},
  'bus': {'icon': const Icon(NavikaIcons.idfmBus)},
};

class SchedulesBody extends StatefulWidget {
  final String id;
  final ScrollController scrollController;
  final bool ungroupDepartures;
  final double padding;
  final Function? setData;
  final Function? refreshMap;
  final Function? moveMap;
  final Function? openPanel;
  final bool hideProgressBar;

  const SchedulesBody({
    required this.id,
    required this.scrollController,
    required this.ungroupDepartures,
    this.padding = 0,
    this.setData,
    this.refreshMap,
    this.moveMap,
    this.openPanel,
    this.hideProgressBar = false,
    super.key,
  });

  @override
  State<SchedulesBody> createState() => _SchedulesBodyState();
}

class _SchedulesBodyState extends State<SchedulesBody> with TickerProviderStateMixin {
  String id = '';
  bool hasRun = false;
  List modes = [];
  TabController? _tabController;
  bool isLoading = true;

  List schedules = [];
  late Timer _timer;
  ApiStatus error = ApiStatus.ok;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
      _timer = Timer.periodic(const Duration(seconds: 30), (_) => _getSchedules());
      _getSchedules();
    });
  }

  void init() {
    setState(() {
      isLoading = true;
      id = widget.id;
      globals.schedulesStopLines = [];
    });
  }

  @override
  void didUpdateWidget(SchedulesBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != id) {
      init();
      _getSchedules();
      if (widget.openPanel != null) {
        widget.openPanel!();
      }
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _tabController?.dispose();
    _tabController = null;
    super.dispose();
  }

  List<Widget> getModesView(
    List modes,
    schedules,
    ScrollController scrollController,
    bool ungroupDepartures, {
    bool shrinkWrap = false,
    ScrollPhysics? physics,
    int activeIndex = 0,
  }) {
    List<Widget> views = [];
    int viewIdx = 0;
    for (final allowes in allowedModes.entries) {
      if (modes.any((mode) => allowes.value.contains(mode))) {
        final ScrollController controllerToUse = (viewIdx == activeIndex) ? scrollController : ScrollController();

        if (allowes.key == 'rail') {
          views.add(
            DeparturesList(
              schedules: schedules,
              update: update,
              id: id,
              mode: allowes.key,
              ungroupDepartures: ungroupDepartures,
              scrollController: controllerToUse,
            ),
          );
        } else {
          views.add(
            SchedulesList(
              schedules: schedules,
              id: widget.id,
              mode: allowes.key,
              scrollController: controllerToUse,
              update: update,
            ),
          );
        }
        viewIdx += 1;
      }
    }
    return views;
  }

  Future<void> _getSchedules() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getSchedules(id);

    if (mounted) {
      setState(() {
        error = result['status'];
      });

      if (result['value'] != null) {
        Map data = result['value'];

        final lat = data['place']['coord']['lat'];
        final lon = data['place']['coord']['lon'];

        if (widget.setData != null) {
          widget.setData!(result);
        }
        if (globals.updateMap == false) {
          openMapPoint(lat, lon);
        }
        if (widget.openPanel != null && !hasRun) {
          widget.openPanel!();
        }
        if (widget.moveMap != null && !hasRun) {
          widget.moveMap!(lat, lon, zoom: 15.0);
        }
        hasRun = true;

        globals.updateMap = false;


        List _modes = data['place']['modes'];
        List _schedules = data['schedules'];
        globals.schedulesStopLines = getLines(result['value']!, widget.ungroupDepartures);

        setState(() {
          schedules = _schedules;
          modes = _modes;
          isLoading = false;

          final int newLength = getModesLength(_modes);
          final int preservedIndex = (_tabController?.index ?? 0).clamp(0, newLength - 1);
          _tabController?.dispose();
          _tabController = TabController(vsync: this, length: newLength, initialIndex: preservedIndex);
        });
      }
    }
  }

  void update() {
    if (mounted) {
      setState(() {
        schedules = schedules;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final views = getModesView(
      modes,
      schedules,
      widget.scrollController,
      widget.ungroupDepartures,
      activeIndex: _tabController?.index ?? 0,
    );

    if (error != ApiStatus.ok) {
      return Expanded(
        child: ListView(
          controller: widget.scrollController,
          children: [
            ErrorBlock(
              error: error,
              retry: _getSchedules,
            ),
          ],
        ),
      );
    }

    // No views but OK
    if (views.isEmpty && !isLoading) {
      return Expanded(
        child: ListView(
          controller: widget.scrollController,
          children: [PlacesEmpty()],
        ),
      );
    }

    // Loading state
    if (isLoading && !widget.hideProgressBar) {
      return Expanded(
        child: ListView(
          controller: widget.scrollController,
          children: [
            const LinearProgressIndicator(),
          ],
        ),
      );
    } else if (isLoading) {
      return Expanded(
        child: ListView(
          controller: widget.scrollController,
          children: [
            const SizedBox(height: 20),
          ],
        ),
      );
    }

    if (views.length == 1) {
      return Expanded(
        child: views.first,
      );
    }

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            controller: _tabController!,
            tabs: getModesTabs(modes),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController!,
              children: views,
            ),
          ),
        ],
      ),
    );
  }
}
