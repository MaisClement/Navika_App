// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// 🌎 Project imports:
import 'package:navika/src/utils.dart';

class TripDisruptions extends StatelessWidget {
  final List disruptions;

  TripDisruptions({
    required this.disruptions,
    super.key,
  });

  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          for (var disruption in disruptions)
            Container(
              padding: const EdgeInsets.only(
                  left: 15.0, top: 10, right: 15.0, bottom: 0.0),
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: getSlugColor(disruption['severity'], true).withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Image(
                            image: getSlugImage(disruption['severity'], 1),
                            height: 25,
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            children: [
                              Text(
                                disruption['message']['title'],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (disruption['message']['text'] != null && disruption['message']['text'] != '')
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        disruption['message']['text'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                ],
              ),
            ),
        ],
      );
}
