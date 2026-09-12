// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/widgets/address/head.dart';
import 'package:navika/src/widgets/bike/head.dart';
import 'package:navika/src/widgets/home/default_panel.dart';
import 'package:navika/src/widgets/schedules/header.dart';
import 'package:navika/src/widgets/routes/head.dart';
import 'package:navika/src/widgets/trip/head.dart';
import 'package:navika/src/widgets/utils/search_box.dart';
import 'package:navika/src/controller/mapbox_controller.dart';

class HomeHeader extends StatelessWidget {
  final String? id;
  final String? type;
  final String? routeId;
  final String? fromId;
  final String? toId;
  final Function setData;
  final dynamic data;
  final Function setColor;
  final dynamic color;
  final Function removePointMarker;
  final Function refreshMap;
  final Function openPanel;
  final Function moveMap;
  final dynamic panelController;
  final MapboxController? Function() getMapController;

  const HomeHeader({
    required this.id,
    required this.type,
    this.routeId,
    this.fromId,
    this.toId,
    required this.setData,
    required this.data,
    required this.setColor,
    required this.color,
    required this.removePointMarker,
    required this.refreshMap,
    required this.openPanel,
    required this.moveMap,
    required this.panelController,
    required this.getMapController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (id == null && type == null) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SearchBox(
                  onTap: () {
                    RouteStateScope.of(context).go('/home/search');
                  },
                  icon: NavikaIcons.search,
                  text: AppLocalizations.of(context)!.home_search,
                  borderRadius: BorderRadius.circular(15)),
            ),
            Container(
              height: 7,
            ),
          ],
        ),
      );
    } else if (type == 'address') {
      return AddressHead(
        id: id!,
        onDispose: removePointMarker,
        setData: setData,
        refreshMap: refreshMap,
        moveMap: moveMap,
        openPanel: openPanel,
        panelController: panelController,
      );
    } else if (type == 'bike') {
      return BikeHead(
        id: id!,
        setData: setData,
        refreshMap: refreshMap,
        openPanel: openPanel,
        moveMap: moveMap,
        panelController: panelController,
      );
    } else if (type == 'stops') {
      return SchedulesPanel(
        id: id!,
        data: data,
      );
    } else if (type == 'stops_route') {
      return RouteScheduleHead(
        id: id!,
        routeId: routeId!,
        data: data,
        setData: setData,
        color: color,
        setColor: setColor,
        openPanel: openPanel,
        refreshMap: refreshMap,
        moveMap: moveMap,
      );
    } else if (type == 'trip') {
      return TripHead(
        tripId: id!,
        fromId: fromId,
        toId: toId,
        data: data,
        setData: setData,
        getMapController: getMapController,
      );
    }
    return const DefaultPanel();
  }
}
