import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RoutesSchedules extends StatefulWidget {
  final String routeId;
  final String stopId;

  const RoutesSchedules(
      {required this.routeId, required this.stopId, super.key});

  @override
  State<RoutesSchedules> createState() => _RoutesSchedulesState();
}

class _RoutesSchedulesState extends State<RoutesSchedules>
    with SingleTickerProviderStateMixin {
  final PageController controller = PageController();
  bool isLoading = true;
  Map line = {};
  ApiStatus error = ApiStatus.ok;

  Future<void> _getLine() async {
    NavikaApi navikaApi = NavikaApi();
    Map result =
        await navikaApi.getLineSchedules(widget.routeId, widget.stopId);

    if (mounted) {
      setState(() {
        error = result['status'];
      });

      setState(() {
        line = result['value']?['line'];
        isLoading = false;
      });
    }
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
        bottomNavigationBar: getNavigationBar(context),
        appBar: AppBar(
          title: isLoading
              ? const Text('Horaires', style: appBarTitle)
              : Text('Ligne ${line['name']}', style: appBarTitle),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(6.0),
            child: SmoothPageIndicator(
              controller: controller, // PageController
              count: 2,
              effect: ExpandingDotsEffect(
                  offset: 10,
                  dotWidth: 10,
                  dotHeight: 10.0,
                  activeDotColor: mainColor(context)),
            ),
          ),
        ),
        body: isLoading
            ? const LinearProgressIndicator()
            : PageView(
                controller: controller,
                children: [
                  for (var schedule in line['schedules'])
                    ListView(
                      children: [
                        for (var t in schedule)
                          Card(
                            child: Row(
                              children: [
                                Text(getTime(t['departure_date_time']),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Segoe Ui',
                                    color: accentColor(context),
                                  ),
                                ),
                                Text(t['direction']),
                              ],
                            ),
                          )
                      ],
                    )
                ],
              ),
      );
}
