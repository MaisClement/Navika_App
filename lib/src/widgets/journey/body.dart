// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/widgets/journey/emission.dart';
import 'package:navika/src/widgets/journey/fare.dart';
import 'package:navika/src/widgets/journey/sections/arrival.dart';
import 'package:navika/src/widgets/journey/sections/public_transport.dart';
import 'package:navika/src/widgets/journey/sections/street_network.dart';
import 'package:navika/src/widgets/journey/sections/transfer.dart';
import 'package:navika/src/widgets/journey/sections/waiting.dart';

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
        res.add(SectionWaiting(section: section));
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
          if (journey['fare']!= null && journey['fare'] > 0)
            Fare(journey: journey),
          if (journey['co2_emission'] != null && journey['co2_emission'] > 0)
            Emission(journey: journey),
          const SizedBox(
            height: 30,
          ),
        ],
      );
}
