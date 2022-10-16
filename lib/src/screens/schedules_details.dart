import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

import '../icons/scaffold_icon_icons.dart';
import '../data.dart';
import '../routing.dart';
import '../widgets/schedules_list.dart';
import '../widgets/departure_list.dart';
import '../data/global.dart' as globals;

class SchedulesDetailsScreen extends StatefulWidget {
	final String? navPos;

	const SchedulesDetailsScreen({
		this.navPos,
    super.key
  });

	@override
	State<SchedulesDetailsScreen> createState() => _SchedulesDetailsScreenState();
}

class _SchedulesDetailsScreenState extends State<SchedulesDetailsScreen>
		with SingleTickerProviderStateMixin {

	late TabController _tabController;
  bool state = false;
  int up = 0;
  Map schedules = Map();

  late Timer _timer;

  Future<void> _getSchedules() async {
    try {
      final response = await http.get(Uri.parse('${globals.API_SCHEDULES}?stoparea=${globals.stopArea}'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (mounted) {
          setState(() {
            state = true;
            schedules = data;
          });
        }
      }

      _timer = Timer(const Duration(seconds: 20), () {
        _getSchedules();
      });

    } on Exception catch (_) {
      print('OULA PAS CONTENT');

    }
	}

  int getModesLength(Map schedules) {
    int i = 0;
    if (schedules['modes'].contains('commercial_mode:LocalTrain') || schedules['modes'].contains('commercial_mode:RapidTransit') || schedules['modes'].contains('commercial_mode:regionalRail'))
      i++;
    if (schedules['modes'].contains('commercial_mode:Metro') || schedules['modes'].contains('commercial_mode:RailShuttle'))
      i++;      
    if (schedules['modes'].contains('commercial_mode:Tramway'))
      i++;      
    if (schedules['modes'].contains('commercial_mode:Bus'))
      i++;      

    return i;
  }

	@override
	void initState() {
		super.initState();
      
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await _getSchedules();
		_tabController = TabController(length: getModesLength(schedules), vsync: this)
			..addListener(_handleTabIndexChanged);
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

	@override
	Widget build(BuildContext context){
    if (state == false){
      return Scaffold(
        appBar: AppBar(
          title: Text(stopName),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        )
      );

    } else {
      return Scaffold(
				appBar: 
          schedules['modes'].length > 1 ? 
            AppBar(
              title: Text(globals.stopName),
              centerTitle: true,
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  if (schedules['modes'].contains('commercial_mode:LocalTrain') || schedules['modes'].contains('commercial_mode:RapidTransit') || schedules['modes'].contains('commercial_mode:regionalRail'))
                    const Tab(
                      text: 'Train/RER',
                      icon: Icon(Scaffold_icon.train),
                    ),

                  if (schedules['modes'].contains('commercial_mode:Metro') || schedules['modes'].contains('commercial_mode:RailShuttle'))
                    const Tab(
                      text: 'Métro',
                      icon: Icon(Scaffold_icon.metro),
                    ),

                  if (schedules['modes'].contains('commercial_mode:Tramway'))
                    const Tab(
                      text: 'Tram',
                      icon: Icon(Scaffold_icon.tram),
                    ),

                  if (schedules['modes'].contains('commercial_mode:Bus'))
                    const Tab(
                      text: 'Bus',
                      icon: Icon(Scaffold_icon.bus),
                    ),
                ],
              )
            )
          :
            AppBar(
              title: Text(globals.stopName),
              centerTitle: true,
            ),
        body: 
          schedules['modes'].length > 1 ? 
            TabBarView(
              controller: _tabController,
              children: [
                if (schedules['modes'].contains('commercial_mode:LocalTrain') || schedules['modes'].contains('commercial_mode:RapidTransit') || schedules['modes'].contains('commercial_mode:regionalRail'))
                  RefreshIndicator(
                    onRefresh: _getSchedules,
                    child: DepartureList(
                      departures: schedules['departures']
                    ),
                  ),

                if (schedules['modes'].contains('commercial_mode:Metro') || schedules['modes'].contains('commercial_mode:RailShuttle'))
                  RefreshIndicator(
                    onRefresh: _getSchedules,
                    child: SchedulesList(
                      modes: ['commercial_mode:Metro', 'commercial_mode:RailShuttle'],
                      schedules: schedules['schedules']
                    ),
                  ),

                if (schedules['modes'].contains('commercial_mode:Tramway'))
                  RefreshIndicator(
                    onRefresh: _getSchedules,
                    child: SchedulesList(
                      modes: ['commercial_mode:Tramway'],
                      schedules: schedules['schedules']
                    ),
                  ),

                if (schedules['modes'].contains('commercial_mode:Bus'))
                  RefreshIndicator(
                    onRefresh: _getSchedules,
                    child: SchedulesList(
                      modes: ['commercial_mode:Bus'],
                      schedules: schedules['schedules']
                    ),
                  ),

              ],
            )
          :
          Container(
            child: (schedules['modes'].contains('commercial_mode:LocalTrain') || schedules['modes'].contains('commercial_mode:RapidTransit') || schedules['modes'].contains('commercial_mode:regionalRail') ?
              Text('data')
              :
              RefreshIndicator(
                onRefresh: _getSchedules,
                child: SchedulesList(
                  modes: ['commercial_mode:Metro', 'commercial_mode:RailShuttle', 'commercial_mode:Tramway', 'commercial_mode:Bus'],
                  schedules: schedules['schedules']
                ),
              )
          )
        )
			);
    }

/*
    } else if ( si gare){

    } else if ( si correspondance){

    }
*/

  }

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