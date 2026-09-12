// 🐦 Flutter imports:
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/journeys_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/bottom_sheets/remove_recurent_journeys.dart';
import 'package:navika/src/widgets/journey/lines.dart';

class RecurrentJourneyCard extends StatefulWidget {
  final Map recurrent;
  final Function update;

  const RecurrentJourneyCard({
    required this.recurrent,
    required this.update,
    super.key,
  });

  @override
  State<RecurrentJourneyCard> createState() => _RecurrentJourneyCardState();
}

class _RecurrentJourneyCardState extends State<RecurrentJourneyCard> {
  Map? journey;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    final String from = widget.recurrent['from']['id'];
    final String to = widget.recurrent['to']['id'];
    final String type = widget.recurrent['type'] ?? 'default';
    final List savedLines = widget.recurrent['lines'] ?? [];

    final String travelerType = globals.hiveBox.get('travelerType') ?? 'standard';
    final List allowedModes = globals.hiveBox.get('allowedModes') ?? [];

    NavikaApi api = NavikaApi();
    Map result = await api.getJourneys(
      from,
      to,
      DateTime.now(),
      travelerType,
      'departure',
      [],
      allowedModes,
    );

    if (!mounted) return;

    if (result['status'] == ApiStatus.ok && result['value']?['journeys'] != null) {
      List journeys = result['value']['journeys'];
      Map? selected;

      if (type == 'same') {
        selected = _findSameLineJourney(journeys, savedLines);
      } else if (type == 'fastest') {
        selected = _findFastestJourney(journeys);
      } else {
        // 'default': first journey (recommended by API)
        selected = journeys.isNotEmpty ? journeys[0] : null;
      }

      selected ??= journeys.isNotEmpty ? journeys[0] : null;

      setState(() {
        journey = selected;
        isLoading = false;
      });
    } else {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  /// Finds the journey whose lines best match the saved line IDs.
  Map? _findSameLineJourney(List journeys, List savedLines) {
    if (savedLines.isEmpty) return journeys.isNotEmpty ? journeys[0] : null;

    final List<String> savedIds = savedLines.map<String>((l) => l['id'].toString()).toList();

    // Exact match: all saved lines are present
    for (var j in journeys) {
      final List<String> journeyIds = getLineByJourney(j).map<String>((l) => l['id'].toString()).toList();
      if (savedIds.every((id) => journeyIds.contains(id))) return j;
    }

    // Partial match: at least one line matches
    for (var j in journeys) {
      final List<String> journeyIds = getLineByJourney(j).map<String>((l) => l['id'].toString()).toList();
      if (savedIds.any((id) => journeyIds.contains(id))) return j;
    }

    return journeys.isNotEmpty ? journeys[0] : null;
  }

  /// Finds the journey with the shortest travel duration.
  Map? _findFastestJourney(List journeys) {
    if (journeys.isEmpty) return null;
    return journeys.reduce((a, b) {
      final int dA = DateTime.parse(a['arrival_date_time']).difference(DateTime.parse(a['departure_date_time'])).inMinutes;
      final int dB = DateTime.parse(b['arrival_date_time']).difference(DateTime.parse(b['departure_date_time'])).inMinutes;
      return dA <= dB ? a : b;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (hasError || journey == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: InkWell(
        onTap: () {
          globals.journey = journey!;
          RouteStateScope.of(context).go('/home/journeys/details');
        },
        onLongPress: () {
          showModalBottomSheet<void>(
              shape: const RoundedRectangleBorder(
                borderRadius: bottomSheetBorder,
              ),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) => BottomRemoveRecurrentJourneys(
                    recurrent: widget.recurrent,
                    update: widget.update,
                  ));
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Partez dans ',
                    style: TextStyle(
                      // fontSize: 17,
                      fontWeight: FontWeight.w800,
                      fontFamily: fontFamily,
                      color: accentColor(context),
                    ),
                  ),
                  AnimatedFlipCounter(
                    duration: const Duration(milliseconds: 500),
                    value: getTimeDifference(journey!['departure_date_time']),
                    suffix: ' min',
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: fontFamily,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getStringTime(journey!['departure_date_time']),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          fontFamily: fontFamily,
                          color: accentColor(context),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        getStringTime(journey!['arrival_date_time']),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          fontFamily: fontFamily,
                          color: accentColor(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.recurrent['from']['name'],
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: fontFamily,
                            color: accentColor(context),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '➜ ${widget.recurrent['to']['name']}',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            fontFamily: fontFamily,
                            color: accentColor(context),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      RouteLines(
                        sections: filterSection(journey!['sections']),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeWidgetRecurrentJourneys extends StatelessWidget {
  final List recurrentJourneys;
  final Function update;

  const HomeWidgetRecurrentJourneys({
    required this.recurrentJourneys,
    required this.update,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: recurrentJourneys
            .map<Widget>(
              (r) => RecurrentJourneyCard(
                recurrent: r,
                update: update,
              ),
            )
            .toList(),
      );
}
