import 'package:flutter/material.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/lines.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';

class TraficWorks extends StatelessWidget {
  final Map reports;

  const TraficWorks({
    required this.reports,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: accentColor(context).withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'À venir',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const Divider(height: 25, thickness: 1.5),
            for (var ctrafic in reports['future_work'])
              Container(
                margin: const EdgeInsets.only(top: 5, right: 5, bottom: 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (ctrafic['message']['title'] != null)
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: Image(
                                  image: getSlugImage(ctrafic['severity']),
                                  height: 25,
                                ),
                              ),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Text(
                                      ctrafic['message']['title'],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      Text(
                        ctrafic['message']['text'],
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Mis à jour: ${getTime(ctrafic['updated_at'])}',
                        style: const TextStyle(fontSize: 12),
                      )
                    ]),
              ),
          ],
        ),
      );
}
