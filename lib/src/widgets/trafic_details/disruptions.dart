import 'package:flutter/material.dart';

import 'package:navika/src/utils.dart';

class TraficDisruptions extends StatelessWidget {
  final Map reports;

  const TraficDisruptions({
    required this.reports,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          for (var ctrafic in [
            ...reports['current_trafic'],
            ...reports['current_work']
          ])
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 10, right: 15.0, bottom: 10.0),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color:
                        getSlugColor(ctrafic['severity'], true).withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
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
                                          fontSize: 18,
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
                      ),
                      if (ctrafic['updated_at'] != null)
                        Text(
                          'Mis à jour: ${getDateTime(ctrafic['updated_at'])}',
                          style: const TextStyle(fontSize: 11),
                        )
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: getSlugColor(ctrafic['severity'], true),
                  ),
                ),
              ],
            )
        ],
      );
}
