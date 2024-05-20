// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/icon.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/address/head.dart';
import 'package:navika/src/widgets/bottom_sheets/add_favorite.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/home/skelton.dart';
import 'package:navika/src/widgets/schedules/body.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';

class SchedulesPannel extends StatefulWidget {
  final String id;
  final dynamic data;
  final Function setPadding;

  const SchedulesPannel({
    required this.id,
    required this.data,
    required this.setPadding,
    super.key,
  });

  @override
  State<SchedulesPannel> createState() => _SchedulesPannelState();
}

class _SchedulesPannelState extends State<SchedulesPannel> {
  final _key = GlobalKey();
  late Timer _timer;

  void _setPadding() {
    if (_key.currentContext != null) {
      widget.setPadding(_key.currentContext?.size?.height);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          key: _key,
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
            if (widget.data != null && widget.data['status'] != null && widget.data['status'] != ApiStatus.ok)
              ErrorBlock(
                error: widget.data['status'],
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
                        Text(
                          widget.data['value']['place']['name'],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: fontFamily,
                            color: accentColor(context),
                          ),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              child: IconElevatedButton(
                                icon: NavikaIcons.navi,
                                text: AppLocalizations.of(context)!.go,
                                onPressed: () {
                                  initJourney(null, {'name': widget.data['value']['place']['name'], 'id': widget.data['value']['place']['id']}, context);
                                },
                              ),
                            ),
                            //TODO Padding(
                            //TODO   padding: const EdgeInsets.only(left: 5),
                            //TODO   child: IconElevatedButton(
                            //TODO     icon: NavikaIcons.star,
                            //TODO     text: AppLocalizations.of(context)!.save,
                            //TODO     onPressed: () {
                            //TODO       initJourney(null, {'name': widget.data['value']['place']['name'], 'id': widget.data['place']['id']}, context);
                            //TODO     },
                            //TODO   ),
                            //TODO ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: IconElevatedButton(
                                icon: isFavorite(widget.data['value']['place']['id']) ? NavikaIcons.favorites : NavikaIcons.addBookmark,
                                text: AppLocalizations.of(context)!.add_to_favorites,
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
                                      lines: getLines(widget.data['value']!),
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        _setPadding();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
