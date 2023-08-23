
import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/icons/lines.dart';

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
  double height = 70;
  final _key = GlobalKey();
  late Timer _timer;

  void _getSize() {
    final size = _key.currentContext!.size;
    if (size != null) {
      height = size.height;
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
                margin: const EdgeInsets.only(
                 left: 5
                ),
                child: DottedLine(
                  direction: Axis.vertical,
                  lineLength: height,
                  lineThickness: 4.0,
                  dashColor: HexColor.fromHex(widget.section['informations']['line']['color']),
                  dashGapLength: 0,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              key: _key, 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.section['from']['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      '➜ ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe Ui',
                        color: HexColor.fromHex(widget.section['informations']['line']['color']),
                      ),
                    ),
                    Expanded(
                      child: Text( widget.section['informations']['direction']['id'].substring(0, widget.section['informations']['direction']['id'].indexOf('(')), 
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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
                                    fontFamily: 'Segoe Ui',
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
                              fontFamily: 'Segoe Ui',
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
                                    fontFamily: 'Segoe Ui',
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
          Container(
            padding: const EdgeInsets.only(left: 10, right: 15, top: 0),
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              children: [
                Text(getStringTime(widget.section['departure_date_time']),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Segoe Ui',
                    fontSize: 16,
                  )
                )
              ],
            ),
          ),
        ]
      ),
  );
}
