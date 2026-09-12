// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:navika/src/widgets/trip/panel.dart';

// 📦 Package imports:

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/address/body.dart';
import 'package:navika/src/widgets/bike/body.dart';
import 'package:navika/src/widgets/home/body.dart';
import 'package:navika/src/widgets/routes/body.dart';
import 'package:navika/src/widgets/schedules/body.dart';

class HomePanel extends StatefulWidget {
  final String? id;
  final String? type;
  final String? routeId;
  final String? fromId;
  final String? toId;
  final Map index;
  final dynamic panelController;
  final ScrollController scrollController;
  final dynamic data;
  final Function setData;
  final dynamic color;
  final Function setColor;
  final Function refreshMap;
  final Function openPanel;
  final Function moveMap;

  const HomePanel({
    required this.id,
    required this.type,
    this.routeId,
    this.fromId,
    this.toId,
    required this.index,
    required this.panelController,
    required this.scrollController,
    required this.data,
    required this.setData,
    required this.color,
    required this.setColor,
    required this.refreshMap,
    required this.moveMap,
    required this.openPanel,
    super.key,
  });

  @override
  State<HomePanel> createState() => _HomePanelState();
}

class _HomePanelState extends State<HomePanel> {
  bool ungroupDepartures = globals.hiveBox.get('ungroupDepartures');
  
  @override
  Widget build(BuildContext context) {
    if (widget.type == 'stops') {
      return SchedulesBody(
        id: widget.id!,
        ungroupDepartures: ungroupDepartures,
        setData: widget.setData,
        refreshMap: widget.refreshMap,
        openPanel: widget.openPanel,
        moveMap: widget.moveMap,
        scrollController: widget.scrollController,
        hideProgressBar: true,
      );
    } else {
      return 
        Expanded(
          child: ListView(
            controller: widget.scrollController,
            children: [
              if (widget.type == null && widget.id == null)
                HomeBody(
                  index: widget.index,
                ),

              if (widget.type == 'bike')
                BikeBody(
                  data: widget.data,
                ),

              if (widget.type == 'address')
                AddressBody(
                  data: widget.data,
                ),

              if (widget.type == 'stops_route')
                RouteSchedulePanel(
                  id: widget.id!,
                  routeId: widget.routeId!,
                  data: widget.data,
                  setData: widget.setData,
                  color: widget.color,
                  setColor: widget.setColor,
                ),

              if (widget.type == 'trip')
                TripPanel(
                  tripId: widget.id!,
                  fromId: widget.fromId,
                  toId: widget.toId,
                  data: widget.data,
                  setData: widget.setData,
                ),
            ],
          ),
        );
    }
  }
}
