// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/icon.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/home/skelton.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:navika/src/data/global.dart' as globals;

class RouteScheduleHead extends StatefulWidget {
  final String id;
  final String routeId;
  final Function setData;
  final Map? data;
  final Function setColor;
  final dynamic color;
  final Function refreshMap;
  final Function openPanel;
  final Function moveMap;

  const RouteScheduleHead({
    required this.id,
    required this.routeId,
    required this.setData,
    required this.data,
    required this.setColor,
    required this.color,
    required this.refreshMap,
    required this.openPanel,
    required this.moveMap,
    super.key,
  });

  @override
  State<RouteScheduleHead> createState() => _RouteScheduleHeadState();
}

class _RouteScheduleHeadState extends State<RouteScheduleHead> with SingleTickerProviderStateMixin {
  bool isLoading = true;

  Map _data = {};
  ApiStatus error = ApiStatus.ok;

  Future<void> _getBikes() async {
    setState(() {
      isLoading = true;
    });
    widget.setData(null);

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getRouteSchedules(widget.id, widget.routeId);

    _data = result['value'];
    print(['INFO_', _data['geojson']]);

    if (mounted) {
      setState(() {
        error = result['status'];
      });

      if (result['value'] != null) {
        setState(() {
          _data = result['value'];
          isLoading = false;
        });

        widget.setData(_data);
        widget.setColor(HexColor.fromHex(_data['route']['color']));

        widget.openPanel();
        widget.refreshMap(_data['place']['coord']['lat'], _data['place']['coord']['lon']);
        widget.moveMap(_data['place']['coord']['lat'], _data['place']['coord']['lon']);
        
        try {
          final shapes = _data['geojson'];
          if (shapes != null && globals.addShapesCallback != null) {
            await globals.addShapesCallback!(shapes);
          }
        } catch (_) {}
      }
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            if (error != ApiStatus.ok)
              ErrorBlock(
                error: error,
              )
            else if (isLoading)
              const HomeHeaderSkelton()
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(arrowBack),
                          tooltip: AppLocalizations.of(context)!.back,
                          color: Theme.of(context).colorScheme.brightness == Brightness.dark 
                                            ? Colors.white
                                            : Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icones(
                              line: _data['route'],
                              i: 0,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ligne ${_data['route']['name']}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: fontFamily,
                                    color: HexColor.fromHex(_data['route']['color']),
                                  ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                                Text(
                                  _data['place']['name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: fontFamily,
                                    color: Theme.of(context).colorScheme.brightness == Brightness.dark 
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
      await _getBikes();
    });
  }

	@override
	void dispose() {
    try {
      if (globals.clearAllShapesCallback != null) {
        globals.clearAllShapesCallback!();
      }
    } catch (_) {}
		super.dispose();
	}
}
