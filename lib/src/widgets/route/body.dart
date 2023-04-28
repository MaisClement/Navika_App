import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/route/lines.dart';
import 'package:navika/src/widgets/route/sections/public_transport.dart';
import 'package:navika/src/widgets/route/sections/street_network.dart';
import 'package:navika/src/widgets/route/sections/transfer.dart';
import 'package:navika/src/widgets/route/sections/waiting.dart';

class RouteBody extends StatelessWidget {
  final ScrollController scrollController;
  final Map journey;

  const RouteBody({
    required this.scrollController,
    required this.journey,
    super.key,
  });

  List<Widget> getRouteBlock(journey) {
    List<Widget> res = []; 

    for (var i = 0; i < journey['sections'].length; i++) {
      Map section = journey['sections'][i];

      if (section['type'] == 'street_network') {
        res.add(
          SectionStreetNetwork(
            section: section,
            nextSection: journey['sections'][i + 1],
          )
        );
      } else if (section['type'] == 'public_transport') {
        res.add(
          SectionPublicTransport(
            section: section,
          )
        );
      } else if (section['type'] == 'transfer') {
        res.add(
          SectionTransfer(
            section: section,
          )
        );
      }else if (section['type'] == 'waiting') {
        res.add(
          SectionWaiting(
            section: section,
            nextSection: journey['sections'][i + 1],
          )
        );
      }
      else {
        res.add(
          Text(section['type'])
        );
      }



    }
    return res;
  }

  @override
  Widget build(BuildContext context) => ListView(
        controller: scrollController,
        padding: const EdgeInsets.only(top: 90),
        children: getRouteBlock(journey),
      );
}
