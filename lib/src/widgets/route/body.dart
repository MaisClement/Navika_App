import 'package:flutter/material.dart';
import 'package:navika/src/widgets/route/fare.dart';
import 'package:navika/src/widgets/route/sections/arrival.dart';
import 'package:navika/src/widgets/route/sections/public_transport.dart';
import 'package:navika/src/widgets/route/sections/street_network.dart';
import 'package:navika/src/widgets/route/sections/transfer.dart';
import 'package:navika/src/widgets/route/sections/waiting.dart';

import 'emission.dart';

class RouteBody extends StatelessWidget {
  final ScrollController scrollController;
  final Map journey;
  final Function zoomTo;

  const RouteBody({
    required this.scrollController,
    required this.journey,
    required this.zoomTo,
    super.key,
  });

  List<Widget> getRouteBlock(journey) {
    List<Widget> res = [];

    for (var i = 0; i < journey['sections'].length; i++) {
      Map section = journey['sections'][i];

      if (section['type'] == 'street_network') {
        res.add(SectionStreetNetwork(section: section, zoomTo: zoomTo));
      } else if (section['type'] == 'public_transport') {
        res.add(SectionPublicTransport(section: section, zoomTo: zoomTo));
      } else if (section['type'] == 'transfer') {
        res.add(SectionTransfer(section: section, zoomTo: zoomTo));
      } else if (section['type'] == 'waiting') {
        res.add(SectionWaiting(
          section: section,
        ));
      }

      if (i == journey['sections'].length - 1) {
        res.add(SectionArrival(section: section, zoomTo: zoomTo));
      }
    }

    return res;
  }

  @override
  Widget build(BuildContext context) => ListView(
        controller: scrollController,
        padding: const EdgeInsets.only(top: 90),
        children: [
          ...getRouteBlock(journey),
          Fare(journey: journey),
          Emission(journey: journey),
          SizedBox(
            height: 30,
          ),
        ],
      );
}
