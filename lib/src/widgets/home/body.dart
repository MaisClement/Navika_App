// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/home_settings.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/favorites/body.dart';
import 'package:navika/src/widgets/home/fav_scroll.dart';
import 'package:navika/src/widgets/home/widget/journeys.dart';
import 'package:navika/src/widgets/home/widget/message.dart';
import 'package:navika/src/widgets/home/widget/recurrent_journeys.dart';
import 'package:navika/src/widgets/home/widget/sponsor.dart';
import 'package:navika/src/widgets/home/widget/trafic.dart';
import 'package:navika/src/widgets/utils/button_large.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

Widget getWidgetHead(BuildContext context, id) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Text(
          getBlockName(context, id),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            fontFamily: fontFamily,
            color: accentColor(context),
          ),
        ),
      ),
    ],
  );
}

class HomeBody extends StatefulWidget {
  final Map index;

  const HomeBody({
    required this.index,
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List favs = [];
  List address = [];
  List recurrent = [];
  List lines = [];
  List journeys = [];
  List blocks = [];

  void update() {
    favs = globals.hiveBox?.get('stopsFavorites');
    address = globals.hiveBox?.get('savedAddress');
    recurrent = globals.hiveBox?.get('recurrentJourneys');
    lines = globals.hiveBox?.get('linesFavorites');
    journeys = sortJourneys(getFutureJourneys(globals.hiveBox?.get('journeys')));
    blocks = globals.hiveBox?.get('homepageOrder');
  }

  List<Widget> _buildHome(context) {
    List<Widget> res = [];

    for (var block in blocks) {
      // HomeWidgetMessages
      if (block['id'] == 'message' && block['enabled'] == true && widget.index['message'] != null) {
        res.add(HomeWidgetMessages(messages: widget.index['message']));
      }

      // HomeWidgetSponsor
      if (block['id'] == 'sponsor' && block['enabled'] == true) {
        res.add(HomeWidgetSponsor(
          canBeDeactivated: true,
        ));
      }

      // HomeWidgetRecurrentJourneys
      if (block['id'] == 'recurrentJourneys' && block['enabled'] == true && recurrent.isNotEmpty) {
        res.add(getWidgetHead(context, block['id']));
        res.add(
          HomeWidgetRecurrentJourneys(
            recurrentJourneys: recurrent,
            update: update,
          ),
        );
      }

      // HomeWidgetJourneys
      if (block['id'] == 'punctualJourneys' && block['enabled'] == true) {
        res.add(getWidgetHead(context, block['id']));
        res.add(const HomeWidgetJourneys());
      }

      // HomeWidgetTrafic
      if (block['id'] == 'trafic' && block['enabled'] == true && lines.isNotEmpty) {
        res.add(getWidgetHead(context, block['id']));
        res.add(HomeWidgetTrafic(lines: lines));
      }

      // Schedules
      if (block['id'] == 'schedules' && block['enabled'] == true && favs.isNotEmpty) {
        res.add(getWidgetHead(context, block['id']));

        for (var fav in favs.sublist(0, getMaxLength(2, favs))) {
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
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontFamily: fontFamily,
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
  Widget build(BuildContext context) => Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 85,
        child: HomeBodyFavScroll(
          address: address,
        ),
      ),
      const SizedBox(height: 10),
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
          backgroundColor: Colors.transparent,
          foregroundColor: accentColor(context),
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        text: AppLocalizations.of(context)!.reorganize_this_page,
        onPressed: () {
          RouteStateScope.of(context).go('/home/settings');
        },
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }
}
