import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/route/sections/access_point.dart';

class SectionStreetNetwork extends StatefulWidget {
  final Map section;
  final Function zoomTo;

  const SectionStreetNetwork({
    required this.section,
    required this.zoomTo,
    super.key,
  });

  @override
  State<SectionStreetNetwork> createState() => _SectionStreetNetworkState();
}

class _SectionStreetNetworkState extends State<SectionStreetNetwork> {

  double height = 70;
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
              const Padding(
                padding: EdgeInsets.only(
                  top: 10, left: 20, right: 20
                ),
                child: Icon(NavikaIcons.walking,
                    color: Color(0xff616161),
                    size: 25),
              ),
              SizedBox(
                child: DottedLine(
                  direction: Axis.vertical,
                  lineLength: height,
                  lineThickness: 4.0,
                  dashColor: Color(0xff616161),
                  dashLength: 4.0,
                  dashRadius: 999,
                  dashGapLength: 4.0,
                ),
              )
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
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
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
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          fontSize: 16,
                        )
                      ),
                    )
                  ],
                ),
                Text('${getDistanceText(widget.section['geojson']['properties'][0]['length'])} • ${getDuration(widget.section['duration'])}'),
            
                if (widget.section['access_point'] != null)
                  AccessPoint(
                    accessPoint: widget.section['access_point'],
                  ),
              ],
            ),
          )
        ]
      ),
  );
}
