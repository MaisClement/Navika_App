// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/data/lines.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/screens/routes_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/bottom_sheets/notifications.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/trafic_details/disruptions.dart';
import 'package:navika/src/widgets/trafic_details/works.dart';
import 'package:navika/src/widgets/utils/button_large.dart';

class TraficDetails extends StatefulWidget {
  const TraficDetails({super.key});

  @override
  State<TraficDetails> createState() => _TraficDetailsState();
}

class _TraficDetailsState extends State<TraficDetails> {
  bool _isFavorite = isFavoriteLine(globals.lineTrafic['id']);
  bool _isAlert = isAlertLine(globals.lineTrafic['id']);

  void update() {
    setState(() {
      _isFavorite = isFavoriteLine(globals.lineTrafic['id']);
      _isAlert = isAlertLine(globals.lineTrafic['id']);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: getNavigationBar(context),
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: preferredCrossAxisAlignment,
            children: [
              Text(AppLocalizations.of(context)!.traffic_info, style: appBarTitle),
              if (LINES.getLines(globals.lineTrafic) != null && LINES.getLines(globals.lineTrafic)!['name'] != '')
                Text(LINES.getLines(globals.lineTrafic)!['name'], style: appBarSubtitle),
            ],
          ),
          actions: [
            if (_isFavorite)
              IconButton(
                icon: _isAlert ? const Icon(NavikaIcons.bellFilled) : const Icon(NavikaIcons.bellAdd),
                tooltip: AppLocalizations.of(context)!.notifications,
                onPressed: () => addNotification(globals.lineTrafic, _isAlert, context),
              ),
            IconButton(
              icon: _isFavorite ? const Icon(NavikaIcons.starFilled) : const Icon(NavikaIcons.star),
              tooltip: AppLocalizations.of(context)!.add_to_favorites,
              onPressed: () => addLineToFavorite(globals.lineTrafic, context, update),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          width: double.infinity,
          child: ListView(
            children: [
// Head
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        margin: const EdgeInsets.all(15.0),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 3.0,
                            color: getSlug(globals.lineTrafic['severity'] ?? 0, true),
                          ),
                        ),
                        child: LinesIcones(
                          line: globals.lineTrafic,
                          removeMargin: true,
                          size: 30,
                        ),
                      ),
                      Positioned(
                        width: 20,
                        height: 20,
                        top: 43,
                        left: 43,
                        child: Image(image: getSlugImage(globals.lineTrafic['severity'], 1)),
                      )
                    ],
                  ),
                  Text(getSlugTitle(context, globals.lineTrafic['severity']), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                ],
              ),

              ButtonLarge(
                icon: NavikaIcons.route,
                text: AppLocalizations.of(context)!.line_details,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  RouteStateScope.of(context).go('/routes/details/${globals.lineTrafic['id']}');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonLarge(
                icon: NavikaIcons.work,
                text: AppLocalizations.of(context)!.works_calendar,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  RouteStateScope.of(context).go('/trafic/work-schedule');
                },
              ),
// CTRAFIC
              if (globals.lineTrafic['reports'] != null)
                TraficDisruptions(
                  reports: [...globals.lineTrafic['reports']['current_trafic'], ...globals.lineTrafic['reports']['current_work']],
                ),

// FWORK
              if (globals.lineTrafic['reports'] != null && globals.lineTrafic['reports']!['future_work'].length > 0)
                TraficWorks(
                  reports: globals.lineTrafic['reports']['future_work'],
                ),
            ],
          ),
        ),
      );
}
