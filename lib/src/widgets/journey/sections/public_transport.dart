// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/extensions/datetime.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/journey/sections/boarding_position.dart';
import 'package:navika/src/widgets/utils/expander_trafic.dart';

class SectionPublicTransport extends StatefulWidget {
  final Map section;
  final Function zoomTo;

  const SectionPublicTransport({
    required this.section,
    required this.zoomTo,
    super.key,
  });


  @override
  State<SectionPublicTransport> createState() => _SectionPublicTransportState();
}

class _SectionPublicTransportState extends State<SectionPublicTransport> with SingleTickerProviderStateMixin {

  bool isStopExtended = false;
  double height = 50;
  final _key = GlobalKey();
  late Timer _timer;

  void _getSize() {
    final size = _key.currentContext!.size;
    if (size != null) {
      setState(() {
        height = size.height;
      });
    }
  }

  void handleOnTap() {
    setState(() {
      isStopExtended = !isStopExtended;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
        _getSize();
      });
    });
  }

  @override
  void dispose() async {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () {
      widget.zoomTo(
        widget.section['geojson']['coordinates'][0][1],
        widget.section['geojson']['coordinates'][0][0]
      );
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                 left: 17, right: 12
                ),
                child: LinesIcones(
                  line: widget.section['informations']['line'],
                  size: 30,
                  removeMargin: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                height: height,
                width: 4,
                decoration: BoxDecoration(
                  color: HexColor.fromHex(widget.section['informations']['line']['color']),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  )
              ),
                ),
            ],
          ),
          Expanded(
            child: Column(
              key: _key, 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(widget.section['from']['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 15, top: 0),
                      color: Theme.of(context).colorScheme.surface,
                      child: Text(getStringTime(widget.section['departure_date_time']),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                          fontSize: 16,
                        )
                      ),
                    ),
                  ]
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text('➜ ${widget.section['informations']['direction']['id'].substring(0, widget.section['informations']['direction']['id'].indexOf('('))}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                          color: HexColor.fromHex(widget.section['informations']['line']['color']),
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (widget.section['informations']['headsign'] != widget.section['informations']['trip_name'])
                  Row(
                    children: [
                      Text(widget.section['informations']['headsign'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Diode',
                        )
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(widget.section['informations']['trip_name'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Diode',
                        )
                      ),
                    ],
                  ),
                if ( DateTime.parse(widget.section['departure_date_time']).isToday() && widget.section['informations']['line']['severity'] != 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: ExpanderTrafic(
                      line: widget.section['informations']['line'],
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        globals.lineTrafic = widget.section['informations']['line'];
                        RouteStateScope.of(context).go('/trafic/details');
                      },
                    ),
                  ),
                if (widget.section['boarding_positions'] != null)
                  BoardingPosition(
                    position: widget.section['boarding_positions'],
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: InkWell(
                    onTap: () {
                      handleOnTap();
                    },
                    child: Column(
                      children: [
                        if (widget.section['stop_date_times'].length > 2)
                          Row(
                            children: [
                              AnimatedRotation(
                                turns: isStopExtended
                                  ? 0.25
                                  : 0,
                                duration: const Duration(milliseconds: 150),
                                child: Icon(NavikaIcons.chevron_right,
                                  size: 16,
                                  color: HexColor.fromHex(widget.section['informations']['line']['color']),
                                  ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              if (widget.section['stop_date_times'].length > 2)
                                Text(
                                  '${(widget.section['stop_date_times'].length - 2)} arrêts • ${getDuration(widget.section['duration'])}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: fontFamily,
                                    color: HexColor.fromHex(widget.section['informations']['line']['color']),
                                  ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                )
                            ],
                          )
                        else 
                          Text(
                            'Sans arrêts • ${getDuration(widget.section['duration'])}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: fontFamily,
                              color: HexColor.fromHex(widget.section['informations']['line']['color']),
                            ),
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        if (isStopExtended)
                          for (var stop in widget.section['stop_date_times'].sublist(1, widget.section['stop_date_times'].length - 1))
                            Row(
                              children: [
                                Text('•',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: fontFamily,
                                    color: HexColor.fromHex(widget.section['informations']['line']['color']),
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Expanded(
                                  child: Text(stop['stop_point']['name'],
                                    style: TextStyle(
                                      color: HexColor.fromHex(widget.section['informations']['line']['color']),
                                    ), 
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ]
                            )
                      ],
                    ),
                  ),
                )
                ,
              ],
            ),
          ),
        ]
      ),
  );
}
