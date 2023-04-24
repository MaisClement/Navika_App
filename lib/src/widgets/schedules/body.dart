import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/widgets/departures/list.dart';
import 'package:navika/src/widgets/error_message.dart';
import 'package:navika/src/widgets/schedules/list.dart';
import 'package:navika/src/data/global.dart' as globals;

List getLines(data) {
  List l = [];
  if (data['departures'] != null) {
    for (var dschedules in data['departures']) {
      l.add({
        'id': dschedules['id'],
        'code': dschedules['code'],
        'name': dschedules['name'],
        'mode': dschedules['mode'],
        'color': dschedules['color'],
        'text_color': dschedules['text_color'],
      });
    }
  }
  if (data['schedules'] != null) {
    for (var lschedules in data['schedules']) {
      l.add({
        'id': lschedules['id'],
        'code': lschedules['code'],
        'name': lschedules['name'],
        'mode': lschedules['mode'],
        'color': lschedules['color'],
        'text_color': lschedules['text_color'],
      });
    }
  }
  return l;
}

Map allowedModes = {
  'rail': ['physical_mode:RapidTransit', 'physical_mode:Train', 'physical_mode:RailShuttle', 'physical_mode:LocalTrain', 'physical_mode:LongDistanceTrain', 'rail', 'nationalrail'],
  'metro': ['physical_mode:Metro', 'physical_mode:RailShuttle', 'metro', 'funicular'],
  'tram': ['physical_mode:Tramway', 'tram'],
  'bus': ['physical_mode:Bus', 'bus'],
};

Map tabsModes = {
  'rail': {
    'icon': const Icon(NavikaIcons.train_rer),
    'label': 'Train et RER',
  },
  'metro': {
    'icon': const Icon(NavikaIcons.metro),
    'label': 'Métro',
  },
  'tram': {
    'icon': const Icon(NavikaIcons.tram),
    'label': 'Tramway',
  },
  'bus': {
    'icon': const Icon(NavikaIcons.bus),
    'label': 'Bus',
  },
};


class SchedulesBody extends StatefulWidget {
  final ScrollController scrollController;
  final bool addMargin;

  const SchedulesBody(
      {required this.scrollController, this.addMargin = false, super.key});

  @override
  State<SchedulesBody> createState() => _SchedulesBodyState();
}

class _SchedulesBodyState extends State<SchedulesBody> with SingleTickerProviderStateMixin {

  String name = globals.schedulesStopName;
  String id = globals.schedulesStopArea;
  List modes = globals.schedulesStopModes;
  late TabController _tabController;

  List schedules = [];
  List departures = [];
  late Timer _timer;
  late Timer _update;
  String error = '';

  bool ungroupDepartures = globals.hiveBox.get('ungroupDepartures') ?? false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: getModesLength(globals.schedulesStopModes));
    checkUpdates();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
        _getSchedules();
      });
      await _getSchedules();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _update.cancel();
  }

  Future<void> _getSchedules() async {
    String url = '${globals.API_SCHEDULES}?s=${globals.schedulesStopArea}';
    if (ungroupDepartures) {
      url += '&ungroupDepartures=true';
    }
    try {
      if (mounted) {
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          if (mounted) {
            setState(() {
              if (data['schedules'] != null) {
                schedules = data['schedules'];
              }
              if (data['departures'] != null) {
                departures = data['departures'];
              }
              globals.schedulesStopLines = getLines(data);
              error = '';
            });
          }
        } else {
          setState(() {
            error = 'Récupération des informations impossible.';
          });
        }
      }
    } on Exception catch (_) {
      setState(() {
        error = "Une erreur s'est produite.";
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

  void checkUpdates() {
    _update = Timer(const Duration(milliseconds: 100), () {
      checkUpdates();
      if (mounted) {
        if (id != globals.schedulesStopArea) {
          setState(() {
            id = globals.schedulesStopArea;
            schedules = [];
          });
          _getSchedules();
        }
      }
    });
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
        tabs.add(Tab(
          icon: tabsModes[allowes.key]['icon'],
          text: tabsModes[allowes.key]['label'],
          iconMargin: const EdgeInsets.only(bottom: 5, top: 5))
        );
      }
    }
    return tabs;
  }

  List<Widget> getModesView(List modes, schedules, departures, scrollController) {
    List<Widget> tabs = [];

    bool ungroupDepartures = globals.hiveBox.get('ungroupDepartures') ?? false;

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
            ungroupDepartures: ungroupDepartures
          ));

        } else {
          tabs.add(SchedulesList(
            schedules: schedules,
            modes: allowes.key,
            scrollController: scrollController,
            update: update,
          ));
        }
        
      }
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (error != '')
            ErrorMessage(
              error: error,
            ),
          if (widget.addMargin)
            const SizedBox(
              height: 80,
            ),
          if (getModesLength(globals.schedulesStopModes) > 1)
            TabBar(
              controller: _tabController,
              tabs: getModesTabs(globals.schedulesStopModes),
            ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: getModesView(
                  modes, schedules, departures, widget.scrollController),
            ),
          ),
        ],
      );
}
