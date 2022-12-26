import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navika/src/widgets/departures/block.dart';
import 'package:flutter/foundation.dart';

import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/widgets/error_message.dart';
import 'package:navika/src/widgets/schedules/list.dart';
import 'package:navika/src/data/global.dart' as globals;

List getLines(data) {
  List l = [];
  if (data['departures'] != null) {
    for (var dschedules in data['departures']) {
      l.add({
        'id':	        dschedules['id'],
        'code':	      dschedules['code'],
        'name':	      dschedules['name'],
        'mode':	      dschedules['mode'],
        'color':	    dschedules['color'],
        'text_color':	dschedules['text_color'],
      });
    }
  }
  if (data['schedules'] != null) {
    for (var lschedules in data['schedules']) {
      l.add({
        'id':	        lschedules['id'],
        'code':	      lschedules['code'],
        'name':	      lschedules['name'],
        'mode':	      lschedules['mode'],
        'color':	    lschedules['color'],
        'text_color':	lschedules['text_color'],
      });
    }
  }
  return l;
}

class SchedulesBody extends StatefulWidget {
  final ScrollController scrollController;

  const SchedulesBody({
    required this.scrollController,
    super.key
    });

  @override
  State<SchedulesBody> createState() => _SchedulesBodyState();
}

class _SchedulesBodyState extends State<SchedulesBody>
    with SingleTickerProviderStateMixin {

  String name = globals.schedulesStopName;
  String id = globals.schedulesStopArea;
  List modes = globals.schedulesStopModes;
  late TabController _tabController;

  List schedules = [];
  List departures = [];
  late Timer _timer;
  late Timer _update;
  String error = '';

  @override
	void initState() {
		super.initState();
    _tabController = TabController(vsync: this, length: getModesLength(globals.schedulesStopModes));
    checkUpdates();  
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await _getSchedules();
      _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
        _getSchedules();
      });
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
    if (kDebugMode) {
      print({'INFO_', globals.schedulesStopArea});
    }
    try {
      if (mounted) {
        final response = await http.get(Uri.parse('${globals.API_SCHEDULES}?s=${globals.schedulesStopArea}'));

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
    _update = Timer(const Duration(milliseconds : 100), () {
      checkUpdates();
      if (id != globals.schedulesStopArea) {
        setState(() {
          id = globals.schedulesStopArea;
          schedules = [];
        });
        _getSchedules();
      }
    });
  }

  int getModesLength(List modes) {
    int i = 0;
    if (modes.contains('physical_mode:RapidTransit') ||
        modes.contains('physical_mode:Train') ||
        modes.contains('physical_mode:RailShuttle') ||
        modes.contains('physical_mode:LocalTrain') ||
        modes.contains('physical_mode:LongDistanceTrain')) {
      i++;
    }
    if (modes.contains('physical_mode:Metro') ||
        modes.contains('physical_mode:RailShuttle')) {
      i++;
    }
    if (modes.contains('physical_mode:Tramway')) {
      i++;
    }
    if (modes.contains('physical_mode:Bus')) {
      i++;
    }
    return i;
  }
  
  List<Widget> getModesTabs(List modes) {
    List<Widget> tabs = [];
    if (modes.contains('physical_mode:RapidTransit') ||
        modes.contains('physical_mode:Train') ||
        modes.contains('physical_mode:RailShuttle') ||
        modes.contains('physical_mode:LocalTrain') ||
        modes.contains('physical_mode:LongDistanceTrain')) {
      tabs.add(const Tab(
                icon: Icon(ScaffoldIcon.train),
                text: 'Train et RER',
                iconMargin: EdgeInsets.only(bottom: 5.0, top: 5)
              ));
    }
    if (modes.contains('physical_mode:Metro') ||
        modes.contains('physical_mode:RailShuttle')) {
      tabs.add(const Tab(
                icon: Icon(ScaffoldIcon.metro),
                text: 'Métro',
                iconMargin: EdgeInsets.only(bottom: 5.0, top: 5)
              ));
    }
    if (modes.contains('physical_mode:Tramway')) {
      tabs.add(const Tab(
                icon: Icon(ScaffoldIcon.tram),
                text: 'Tramway',
                iconMargin: EdgeInsets.only(bottom: 5.0, top: 5)
              ));
    }
    if (modes.contains('physical_mode:Bus')) {
      tabs.add(const Tab(
                icon: Icon(ScaffoldIcon.bus),
                text: 'Bus',
                iconMargin: EdgeInsets.only(bottom: 5.0, top: 5)
              ));
    }
    return tabs;
  }

  List<Widget> getModesView(List modes, schedules, departures, scrollController) {
    List<Widget> tabs = [];
    if (modes.contains('physical_mode:RapidTransit') ||
        modes.contains('physical_mode:Train') ||
        modes.contains('physical_mode:RailShuttle') ||
        modes.contains('physical_mode:LocalTrain') ||
        modes.contains('physical_mode:LongDistanceTrain')) {
      tabs.add(DepartureBlock(
                departures: departures,
                scrollController: scrollController,
                update: update,
              ));
    }
    if (modes.contains('physical_mode:Metro') ||
        modes.contains('physical_mode:RailShuttle')) {
      tabs.add(SchedulesList(
                schedules: schedules,
                modes: 'metro',
                scrollController: scrollController,
                update: update,
              ));
    }
    if (modes.contains('physical_mode:Tramway')) {
      tabs.add(SchedulesList(
                schedules: schedules,
                modes: 'tram',
                scrollController: scrollController,
                update: update,
              ));
    }
    if (modes.contains('physical_mode:Bus')) {
      tabs.add(SchedulesList(
                schedules: schedules,
                modes: 'bus',
                scrollController: scrollController,
                update: update,
              ));
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
        
      if ( getModesLength(globals.schedulesStopModes) > 1 )
        Container(
          margin: const EdgeInsets.only(top:10, right:10, left: 10, bottom: 10),
          height: 70, // kToolbarHeight + 8,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).colorScheme.primary),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: getModesTabs(globals.schedulesStopModes),
          ),
        ),
      Expanded(
        child: TabBarView(
          controller: _tabController,
          children: getModesView(modes, schedules, departures, widget.scrollController),
        ),
      ),
    ]
  );
}
