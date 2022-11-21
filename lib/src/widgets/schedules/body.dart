import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../../icons/scaffold_icon_icons.dart';
import 'list.dart';
import '../../data/global.dart' as globals;

import '../../routing.dart';
class Schedules_Body extends StatefulWidget {
  const Schedules_Body({super.key});

  @override
  State<Schedules_Body> createState() => _Schedules_BodyState();
}

class _Schedules_BodyState extends State<Schedules_Body>
    with SingleTickerProviderStateMixin {

  final String name = globals.schedulesStopName;
  final String id = globals.schedulesStopArea;
  final List modes = globals.schedulesStopModes;
  late TabController _tabController;

  List schedules = [];
  late Timer _timer;

  @override
	void initState() {
		super.initState();

    _tabController = TabController(vsync: this, length: getModesLength(globals.schedulesStopModes))
    ..addListener(_handleTabIndexChanged);
      
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await _getSchedules();
    });
	}

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();

		final newPath = _routeState.route.pathTemplate;
		if (newPath.startsWith('/schedules/details')) {
			_tabController.index = 0;
		} else if (newPath.startsWith('/schedules/details')) {
			_tabController.index = 1;
		} 
	}

	@override
	void dispose() {
		super.dispose();
		_tabController.removeListener(_handleTabIndexChanged);
    _timer.cancel();
	}

  Future<void> _getSchedules() async {
    print({'INFO_', globals.schedulesStopArea});
    try {
      final response = await http.get(Uri.parse('${globals.API_SCHEDULES}?s=${globals.schedulesStopArea}'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (mounted) {
          setState(() {
            schedules = data['schedules'];
          });
        }
      }

      _timer = Timer(const Duration(seconds: 30), () {
        _getSchedules();
      });
    } on Exception catch (_) {
      print('OULA PAS CONTENT');
    }
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
                icon: Icon(Scaffold_icon.train),
                text: 'Train et RER',
              ));
    }
    if (modes.contains('physical_mode:Metro') ||
        modes.contains('physical_mode:RailShuttle')) {
      tabs.add(const Tab(
                icon: Icon(Scaffold_icon.metro),
                text: 'Métro',
              ));
    }
    if (modes.contains('physical_mode:Tramway')) {
      tabs.add(const Tab(
                icon: Icon(Scaffold_icon.tram),
                text: 'Tramway',
              ));
    }
    if (modes.contains('physical_mode:Bus')) {
      tabs.add(const Tab(
                icon: Icon(Scaffold_icon.bus),
                text: 'Bus',
              ));
    }
    return tabs;
  }

  List<Widget> getModesView(List modes, schedules) {
    List<Widget> tabs = [];
    if (modes.contains('physical_mode:RapidTransit') ||
        modes.contains('physical_mode:Train') ||
        modes.contains('physical_mode:RailShuttle') ||
        modes.contains('physical_mode:LocalTrain') ||
        modes.contains('physical_mode:LongDistanceTrain')) {
      tabs.add(Schedules_List(
                schedules: schedules,
                modes: 'rail',
              ));
    }
    if (modes.contains('physical_mode:Metro') ||
        modes.contains('physical_mode:RailShuttle')) {
      tabs.add(Schedules_List(
                schedules: schedules,
                modes: 'metro',
              ));
    }
    if (modes.contains('physical_mode:Tramway')) {
      tabs.add(Schedules_List(
                schedules: schedules,
                modes: 'tram',
              ));
    }
    if (modes.contains('physical_mode:Bus')) {
      tabs.add(Schedules_List(
                schedules: schedules,
                modes: 'bus',
              ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      if ( getModesLength(globals.schedulesStopModes) > 1 )
        Container(
          margin: const EdgeInsets.all(10),
          height: kToolbarHeight + 8,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).colorScheme.secondary),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: getModesTabs(globals.schedulesStopModes),
          ),
        ),
      Expanded(
        child: TabBarView(
          controller: _tabController,
          children: getModesView(modes, schedules),
        ),
      ),
    ]
  );

  RouteState get _routeState => RouteStateScope.of(context);

	void _handleTabIndexChanged() {
		switch (_tabController.index) {
			case 1:
				_routeState.go('/schedules/details');
				break;
			case 0:
			default:
				_routeState.go('/schedules/details');
				break;
		}
	}
}
