// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icon.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/address/head.dart';
import 'package:navika/src/widgets/bottom_sheets/add_address.dart';
import 'package:navika/src/widgets/bottom_sheets/add_favorite.dart';
import 'package:navika/src/widgets/home/skelton.dart';
import 'package:navika/src/widgets/schedules/body.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

class SchedulesPanel extends StatefulWidget {
  final String id;
  final dynamic data;

  const SchedulesPanel({
    required this.id,
    required this.data,
    super.key,
  });

  @override
  State<SchedulesPanel> createState() => _SchedulesPanelState();
}

class _SchedulesPanelState extends State<SchedulesPanel> {
  bool ungroupDepartures = globals.hiveBox.get('ungroupDepartures');

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            if (widget.data != null && widget.data['status'] != null && widget.data['status'] != ApiStatus.ok)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(arrowBack),
                    tooltip: AppLocalizations.of(context)!.back,
                    color: accentColor(context),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            else if (widget.data == null || widget.data['value'] == null)
              const HomeHeaderSkelton()
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(arrowBack),
                          tooltip: AppLocalizations.of(context)!.back,
                          color: accentColor(context),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data['value']['place']['name'],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                fontFamily: fontFamily,
                                color: accentColor(context),
                              ),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                            Text(
                              widget.data['value']['place']['zip_code'] == '' || widget.data['value']['place']['zip_code'] == '40410'
                                  ? widget.data['value']['place']['town']
                                  : '${widget.data['value']['place']['zip_code']}, ${widget.data['value']['place']['town']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: accentColor(context),
                                fontFamily: fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: getDistanceWidget(widget.data['value']['place']['coord']['lat'], widget.data['value']['place']['coord']['lon']),
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SizedBox(
                                height: 40,
                                child: IconElevatedButton(
                                  icon: NavikaIcons.navi,
                                  text: AppLocalizations.of(context)!.go,
                                  margin: const EdgeInsets.only(left: 9, bottom: 4, top: 4),
                                  onPressed: () {
                                    initJourney(
                                        null,
                                        {
                                          'name': widget.data['value']['place']['name'],
                                          'id': '${widget.data['value']['place']['coord']['lat']};${widget.data['value']['place']['coord']['lon']}'
                                        },
                                        context);
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: IconElevatedButton(
                                icon: NavikaIcons.star,
                                text: AppLocalizations.of(context)!.save,
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: bottomSheetBorder,
                                    ),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) => BottomAddAddress(address: widget.data['value']['place']),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: IconElevatedButton(
                                icon: isFavorite(widget.data['value']['place']['id']) ? NavikaIcons.favorites : NavikaIcons.addBookmark,
                                text: AppLocalizations.of(context)!.add_to_favorites,
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer, backgroundColor: Theme.of(context).colorScheme.primaryContainer),
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: bottomSheetBorder,
                                    ),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) => BottomAddFavorite(
                                      id: widget.data['value']['place']['id'],
                                      name: widget.data['value']['place']['name'],
                                      lines: getLines(widget.data['value']!, ungroupDepartures),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
          ],
        ),
      );
}
