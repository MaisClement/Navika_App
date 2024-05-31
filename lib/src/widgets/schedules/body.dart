// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:sliding_up_panel/sliding_up_panel.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/home_search.dart';
import 'package:navika/src/widgets/departures/list.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/schedules/list.dart';

// 📦 Package imports:


List getLines(data) {
  bool ungroupDepartures = globals.hiveBox.get('ungroupDepartures');
  List l = [];
  if (data['departures'] != null) {
    if (ungroupDepartures) {
      for (var dschedules in data['departures']) {
        if (!l.any((item) => item['id'] == dschedules['informations']['line']['id'])) {
          l.add(dschedules['informations']['line']);
        }
      }
    } else {
      for (var dschedules in data['departures']) {
        l.add(<String, dynamic>{...dschedules}..remove('departures'));
      }
    }
  }
  if (data['schedules'] != null) {
    for (var lschedules in data['schedules']) {
      l.add(<String, dynamic>{...lschedules}..remove('schedules'));
    }
  }
  return l;
}

int getModesLength(List modes) {
  int i = 0;
  for (var allowes in allowedModes.entries) {
    if (modes.any((mode) => allowes.value.contains(mode))) {
      i++;
    }
  }

  return i;
}

List<Widget> getModesTabs(List modes) {
  List<Widget> tabs = [];

  for (var allowes in allowedModes.entries) {
    if (modes.any((mode) => allowes.value.contains(mode))) {
      tabs.add(
        Tab(icon: tabsModes[allowes.key]['icon'], iconMargin: const EdgeInsets.only(bottom: 5, top: 5)),
      );
    }
  }
  return tabs;
}

Map allowedModes = {
  'rail': [
    'physical_mode:RapidTransit',
    'physical_mode:Train',
    'physical_mode:RailShuttle',
    'physical_mode:LocalTrain',
    'physical_mode:LongDistanceTrain',
    'rail',
    'nationalrail'
  ],
  'metro': ['physical_mode:Metro', 'physical_mode:RailShuttle', 'metro', 'funicular'],
  'tram': ['physical_mode:Tramway', 'tram'],
  'bus': ['physical_mode:Bus', 'bus'],
};

Map tabsModes = {
  'rail': {
    'icon': const Icon(NavikaIcons.idfmTrainRer),
  },
  'metro': {
    'icon': const Icon(NavikaIcons.metro),
  },
  'tram': {
    'icon': const Icon(NavikaIcons.idfmTram),
  },
  'bus': {
    'icon': const Icon(NavikaIcons.idfmBus),
  },
};

class SchedulesBody extends StatefulWidget {
  final String id;
  final ScrollController scrollController;
  final PanelController? panelController;
  final double padding;
  final Function? setData;
  final Function? refreshMap;
  final bool hideProgressBar;

  const SchedulesBody({
    required this.id,
    required this.scrollController,
    this.panelController,
    this.padding = 0,
    this.setData,
    this.refreshMap,
    this.hideProgressBar = false,
    super.key,
  });

  @override
  State<SchedulesBody> createState() => _SchedulesBodyState();
}

class _SchedulesBodyState extends State<SchedulesBody> with SingleTickerProviderStateMixin {
  String id = '';
  List modes = [];
  late TabController _tabController;
  bool isLoading = true;

  List schedules = [];
  List departures = [];
  late Timer _timer;
  ApiStatus error = ApiStatus.ok;

  bool ungroupDepartures = globals.hiveBox.get('ungroupDepartures');

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      init();
      _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
        _getSchedules();
      });
      await _getSchedules();

      if (widget.panelController != null) {
        widget.panelController!.animatePanelToSnapPoint();
      }
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
    // Vérifiez si les paramètres ont changé, et si c'est le cas, appelez setState pour reconstruire le widget
    if (widget.id != id) {
      init();
      _getSchedules();
      
      if (widget.panelController != null) {
        widget.panelController!.animatePanelToSnapPoint();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  List<Widget> getModesView(List modes, schedules, departures, scrollController) {
    List<Widget> tabs = [];

    bool ungroupDepartures = globals.hiveBox.get('ungroupDepartures');

    for (var allowes in allowedModes.entries) {
      if (modes.any((mode) => allowes.value.contains(mode))) {
        if (allowes.key == 'rail') {
          tabs.add(DeparturesList(
              departures: departures,
              scrollController: scrollController,
              update: update,
              name: '',
              modes: modes,
              id: id,
              ungroupDepartures: ungroupDepartures));
        } else {
          tabs.add(SchedulesList(
            schedules: schedules,
            id: widget.id,
            modes: allowes.key,
            scrollController: scrollController,
            update: update,
          ));
        }
      }
    }
    return tabs;
  }

  Future<void> _getSchedules() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getSchedules(id, ungroupDepartures);

    if (mounted) {
      setState(() {
        error = result['status'];
      });

      if (widget.setData != null) {
        widget.setData!(result);
        if (globals.updateMap == false) {
          openMapPoint(result['value']['place']['coord']['lat'], result['value']['place']['coord']['lon']);
        }
        if (widget.refreshMap != null) {
          widget.refreshMap!(result['value']['place']['coord']['lat'], result['value']['place']['coord']['lon']);
        }
        globals.updateMap = false;
      }

      setState(() {
        if (result['value'] != null) {
          globals.schedulesStopLines = getLines(result['value']!);
        }
        if (result['value']?['schedules'] != null) {
          schedules = result['value']?['schedules'];
        }
        if (result['value']?['departures'] != null) {
          departures = result['value']?['departures'];
        }
        if (result['value']?['place']['modes'] != null) {
          modes = result['value']?['place']['modes'];
        }
      });

      if (isLoading) {
        _tabController = TabController(vsync: this, length: getModesLength(modes));
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  void update() {
    if (mounted) {
      setState(() {
        schedules = schedules;
        departures = departures;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: widget.padding,
          ),
          if (error != ApiStatus.ok)
            ErrorBlock(
              error: error,
              retry: _getSchedules,
            )
          else if (isLoading && !widget.hideProgressBar)
            const LinearProgressIndicator()
          else if (isLoading)
            Container()
          else ...[
            if (getModesLength(modes) > 1)
              TabBar(
                controller: _tabController,
                tabs: getModesTabs(modes),
              ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: getModesView(modes, schedules, departures, widget.scrollController),
              ),
            ),
          ]
        ],
      );
}
