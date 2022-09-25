import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'package:getwidget/getwidget.dart';

import 'dart:convert';

import '../icons/scaffold_icon_icons.dart';

import '../data.dart';
import '../routing.dart';

import '../widgets/schedules_list.dart';

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
  Map schedules = Map();

  Future<void> _getSchedules() async {
    final response = await http.get(Uri.parse('${globals.API_SCHEDULES}?stoparea=${globals.stopArea}'));
    final data = json.decode(response.body);

    if (mounted) {
      setState(() {
        state = true;
        schedules = data;
      });
    }
	}

	@override
	void initState() {
		super.initState();
		_tabController = TabController(length: 2, vsync: this)
			..addListener(_handleTabIndexChanged);
      
    WidgetsBinding.instance.addPostFrameCallback((_) => _getSchedules());
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
		_tabController.removeListener(_handleTabIndexChanged);
		super.dispose();
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
          child: GFLoader(),
        )
      );

    } else if (schedules['modes'].contains('commercial_mode:Bus') && schedules['modes'].contains('commercial_mode:LocalTrain')){
      return Scaffold(
				appBar: AppBar(
					title: Text(globals.stopName),
          centerTitle: true,
					bottom: TabBar(
						controller: _tabController,
						tabs: const [
							Tab(
								text: 'Gare',
								icon: Icon(Scaffold_icon.gare),
							),
							Tab(
								text: 'Correspondance',
								icon: Icon(Scaffold_icon.correspondance),
							),
						],
					),
				),
				body: TabBarView(
					controller: _tabController,
					children: [
						Text('1'),
            RefreshIndicator(
              onRefresh: _getSchedules,
              child: SchedulesList(
                schedules: schedules['schedules']
              ),
            )
					],
				),
			);
    } else if (schedules['modes'].contains('commercial_mode:Bus')){
      return Scaffold(
				appBar: AppBar(
					title: Text(globals.stopName),
          centerTitle: true,
				),
				body: RefreshIndicator(
          onRefresh: _getSchedules,
          child: SchedulesList(
            schedules: schedules['schedules']
          ),
        )
			);
    }  else if (schedules['modes'].contains('commercial_mode:LocalTrain')){
      return Scaffold(
				appBar: AppBar(
					title: Text(globals.stopName),
          centerTitle: true,
				),
				body: Center(
          child: Text('Sommething is missing 👀'),
        ),
			);
    } else {
      return Text('pas content');
    }
/*
    } else if ( si gare){

    } else if ( si correspondance){

    }
*/

  }

	RouteState get _routeState => RouteStateScope.of(context);

	void _handleBookTapped(Book book) {
		_routeState.go('/book/${book.id}');
	}

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
