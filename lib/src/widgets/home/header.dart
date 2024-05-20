// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/widgets/address/head.dart';
import 'package:navika/src/widgets/bike/head.dart';
import 'package:navika/src/widgets/home/default_pannel.dart';
import 'package:navika/src/widgets/schedules/header.dart';
import 'package:navika/src/widgets/utils/search_box.dart';

class HomeHeader extends StatelessWidget {
  final String? id;
  final String? type;
  final dynamic data;
  final double padding;
  final Function removePointMarker;
  final Function setPadding;
  final Function setData;
  final PanelController panelController;

  const HomeHeader({
    required this.id,
    required this.type,
    required this.data,
    required this.padding,
    required this.removePointMarker,
    required this.setPadding,
    required this.setData,
    required this.panelController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (id == null && type == null) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 15,
                bottom: 10,
              ),
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SearchBox(
                  onTap: () {
                    // panelController.animatePanelToPosition(0);
                    RouteStateScope.of(context).go('/home/search');
                    // initJourney(null, null, context);
                  },
                  icon: NavikaIcons.search,
                  text: AppLocalizations.of(context)!.where_are_we_going,
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
        setPadding: setPadding,
        setData: setData,
        panelController: panelController,
      );
    } else if (type == 'bike') {
      return BikeHead(
        id: id!,
        setPadding: setPadding,
        setData: setData,
        panelController: panelController,
      );
    } else if (type == 'stops') {
      return SchedulesPannel(
        id: id!,
        setPadding: setPadding,
        data: data,
      );
    }
    return const DefaultPannel();
  }
}
