// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:sliding_up_panel/sliding_up_panel.dart';

// 🌎 Project imports:
import 'package:navika/src/widgets/address/body.dart';
import 'package:navika/src/widgets/bike/body.dart';
import 'package:navika/src/widgets/home/body.dart';
import 'package:navika/src/widgets/schedules/body.dart';

class HomePannel extends StatelessWidget {
  final String? id;
  final String? type;
  final Map index;
  final ScrollController scrollController;
  final PanelController panelController;
  final dynamic data;
  final double padding;
  final Function setPadding;
  final Function setData;
  final Function refreshMap;

  const HomePannel({
    required this.id,
    required this.type,
    required this.index,
    required this.scrollController,
    required this.panelController,
    required this.data,
    required this.padding,
    required this.setPadding,
    required this.setData,
    required this.refreshMap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (type == null && id == null) {
      return HomeBody(
        scrollController: scrollController,
        index: index,
      );
    } else if (type == 'stops') {
      return SchedulesBody(
        id: id!,
        padding: padding,
        setData: setData,
        refreshMap: refreshMap,
        panelController: panelController,
        scrollController: scrollController,
        hideProgressBar: true,
      );
    } else if (type == 'bike') {
      return BikeBody(
        padding: padding,
        scrollController: scrollController,
        data: data,
      );
    } else if (type == 'address') {
      return AddressBody(
        padding: padding,
        scrollController: scrollController,
        data: data,
      );
    }
    return Container();
  }
}
