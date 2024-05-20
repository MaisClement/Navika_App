// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icon.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/remove_favorite.dart';
import 'package:navika/src/widgets/departures/block.dart';
import 'package:navika/src/widgets/error_message.dart';
import 'package:navika/src/widgets/schedules/block.dart';
import 'package:navika/src/widgets/schedules/skelton.dart';

class FavoriteBody extends StatefulWidget {
  final String id;
  final String name;
  final String line;
  final Function update;
  final bool removeSeparator;

  const FavoriteBody({required this.id, required this.name, required this.line, required this.update, this.removeSeparator = false, super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> with SingleTickerProviderStateMixin {
  List schedules = [];
  String mode = '';
  ApiStatus error = ApiStatus.ok;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
        _getSchedules();
      });
      await _getSchedules();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Future<void> _getSchedules() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getSchedulesLines(widget.id, widget.line);

    if (mounted) {
      setState(() {
        error = result['status'];
      });

      setState(() {
        if (result['value']?['schedules'] != null) {
          schedules = result['value']?['schedules'];
          mode = result['value']?['schedules'][0]['mode'];
        }
        if (result['value']?['departures'] != null) {
          schedules = result['value']?['departures'];
          mode = result['value']?['departures']?[0]?['mode'];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!widget.removeSeparator)
            const Divider(
              color: Color(0xff808080),
              thickness: 1.5,
              indent: 20,
              endIndent: 20,
            ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
            child: GestureDetector(
              onTap: () {
                globals.schedulesStopName = widget.name;
                RouteStateScope.of(context).go('/schedules/stops/${widget.id}');
              },
              child: Row(
                children: [
                  Icon(NavikaIcons.trainFace, color: accentColor(context), size: 25),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: fontFamily,
                        color: accentColor(context),
                      ),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  IconButton(
                    icon: Icon(more),
                    color: Theme.of(context).colorScheme.onSurface,
                    tooltip: AppLocalizations.of(context)!.remove_favorite,
                    onPressed: () {
                      showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: bottomSheetBorder,
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) => BottomRemoveFavorite(
                          id: widget.id,
                          name: widget.name,
                          line: widget.line,
                          update: widget.update,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          if (error != ApiStatus.ok)
            ErrorMessage(
              error: error,
            )
          else if (mode == '' && schedules.isEmpty)
            const SchedulesSkelton()
          else if (mode == 'rail' || mode == 'nationalrail')
            Column(
              children: [
                for (var line in schedules)
                  DeparturesBlock(
                    line: line,
                    id: widget.id,
                    name: widget.name,
                    update: widget.update,
                    limited: true,
                  ),
                Center(
                  child: ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.view_all_schedules),
                    onPressed: () {
                      globals.schedulesStopName = widget.name;
                      RouteStateScope.of(context).go('/schedules/stops/${widget.id}');
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            )
          else
            Column(
              children: [
                for (var line in schedules)
                  SchedulesBlock(
                    line: line,
                    id: widget.id,
                    update: widget.update,
                    limited: true,
                  ),
                Center(
                  child: ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.view_all_schedules),
                    onPressed: () {
                      globals.schedulesStopName = widget.name;
                      RouteStateScope.of(context).go('/schedules/stops/${widget.id}');
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            )
        ],
      );
}
