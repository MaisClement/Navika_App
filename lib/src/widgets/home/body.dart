// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/home_settings.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/favorites/body.dart';
import 'package:navika/src/widgets/home/fav_scroll.dart';
import 'package:navika/src/widgets/home/widget/journeys.dart';
import 'package:navika/src/widgets/home/widget/message.dart';
import 'package:navika/src/widgets/home/widget/sponsor.dart';
import 'package:navika/src/widgets/home/widget/trafic.dart';
import 'package:navika/src/widgets/utils/button_large.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

Widget getWidgetHead(BuildContext context, id) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Text(getBlockName(context, id),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Segoe Ui',
            color: accentColor(context),
          ),
        ),
      ),
          
    ],
  );
}

class HomeBody extends StatelessWidget {
  final ScrollController scrollController;
  final Map index;
  final List address;
  final List favs;
  final List lines;
  final List trafic;
  final List journeys;
  final List blocks;
  final Function update;

  const HomeBody({
    required this.scrollController,
    required this.index,
    required this.address,
    required this.favs,
    required this.lines,
    required this.trafic,
    required this.journeys,
    required this.blocks,
    required this.update,
    super.key,
  });
  

  List<Widget> _buildHome(context) {
    List<Widget> res = [];

    for (var block in blocks) {

      // HomeWidgetMessages
      if (block['id'] == 'message' && block['enabled'] == true && index['message'] != null) {
        res.add(
          HomeWidgetMessages(messages: index['message'])
        );
      }
      
      // HomeWidgetSponsor
      if (block['id'] == 'sponsor' && block['enabled'] == true) {
        res.add(
          HomeWidgetSponsor(
            canBeDeactivated: true,
          )
        );
      }

      //TODO // HomeWidgetJourneys
      //TODO if (block['id'] == 'recurrentJourneys' && block['enabled'] == true) {
      //TODO   res.add(getWidgetHead(context, block['id']));
      //TODO   res.add(
      //TODO     HomeWidgetJourneys(
      //TODO       journeys: journeys, 
      //TODO       update: update,
      //TODO     )
      //TODO   );
      //TODO }

      // HomeWidgetJourneys
      if (block['id'] == 'punctualJourneys' && block['enabled'] == true) {
        res.add(getWidgetHead(context, block['id']));
        res.add(
          HomeWidgetJourneys(
            journeys: journeys, 
            update: update,
          )
        );
      }

      // HomeWidgetTrafic
      if (block['id'] == 'trafic' && block['enabled'] == true && lines.isNotEmpty) {
        res.add(getWidgetHead(context, block['id']));
        res.add(
          HomeWidgetTrafic(
            lines: lines,
            trafic: trafic,
          )
        );
      }

      // Schedules
      if (block['id'] == 'schedules' && block['enabled'] == true && favs.isNotEmpty) {
        res.add(getWidgetHead(context, block['id']));

        for (var fav in favs.sublist(0, getMaxLength(2, favs) )) {
          res.add(
            FavoriteBody(
              id: fav['id'],
              key: ValueKey(fav['id']),
              name: fav['name'],
              line: fav['line'],
              update: update,
              removeSeparator: true,
            ),
          );
        }
      }

      // Maps
      if (block['id'] == 'map' && block['enabled'] == true) {
        res.add(getWidgetHead(context, block['id']));
        res.add(
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ButtonLarge(
              icon: NavikaIcons.map,
              text: AppLocalizations.of(context)!.maps,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                RouteStateScope.of(context).go('/maps');
              },
            ),
          ),
        );
      }
    }

    return res;
  }

  @override
  Widget build(BuildContext context) => ListView(
    controller: scrollController,
    padding: const EdgeInsets.only(top: 90),
    children: [
      SizedBox(
        height: 85,
        child: HomeBodyFavScroll(
          address: address,
        ),
      ),
      const SizedBox(
        height: 10,
      ),

      ..._buildHome(context),

      const Divider(
        color: Color(0xff808080),
        thickness: 1.5,
        indent: 20,
        endIndent: 20,
      ),
    
      IconElevatedButton(
        icon: NavikaIcons.settings,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: accentColor(context),
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        text: AppLocalizations.of(context)!.reorganize_this_page,
        onPressed: () {
          RouteStateScope.of(context).go('/home/settings');
        },
      ),
    ],
  );
}
