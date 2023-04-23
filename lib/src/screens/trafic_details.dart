import 'package:flutter/material.dart';

import 'package:navika/src/data/lines.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/trafic_details/disruptions.dart';
import 'package:navika/src/widgets/trafic_details/works.dart';

class TraficDetails extends StatelessWidget {
  final String lineId;

  const TraficDetails({
    super.key,
    required this.lineId,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Info Trafic', style: appBarTitle),
              if (LINES.getLines(lineId).libelle != '')
                Text(LINES.getLines(lineId).libelle, style: appBarSubtitle),
            ],
          ),
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
                            color: getSlug(getSeverity(lineId), 1),
                          ),
                        ),
                        child: Image(
                            image: AssetImage(
                                getIconLine(context, LINES.getLines(lineId)))),
                      ),
                      Positioned(
                        width: 20,
                        height: 20,
                        top: 43,
                        left: 43,
                        child:
                            Image(image: getSlugImage(getSeverity(lineId), 1)),
                      )
                    ],
                  ),
                  Text(getSlugTitle(getSeverity(lineId)),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20)),
                ],
              ),

// CTRAFIC
              if (getTraficLines(LINES.getLines(lineId).id)['reports'] != null)
                TraficDisruptions(
                  reports: getTraficLines(LINES.getLines(lineId).id)['reports'],
                ),

// FWORK
              if (getReports(lineId) != null && getReports(lineId)!['future_work'].length > 0)
                TraficWorks(
                  reports: getReports(lineId)!,
                ),
            ],
          ),
        ),
      );
}
