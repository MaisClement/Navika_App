import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:navika/src/widgets/trafic/block.dart';

Color getSlugColor(severity, [type]) {
  if (severity == 0 && (type == null || type == 0)) {
    return Colors.transparent;
  } else if (severity == 0 && type != null && type == 1) {
    return const Color(0xff008b5b);
  } else if (severity == 5) {
    return const Color(0xffeb2031);
  } else if (severity == 4) {
    return const Color(0xfff68f53);
  } else if (severity == 3) {
    return const Color(0xfff68f53);
  } else if (severity == 2) {
    return const Color(0xfff68f53);
  } else if (severity == 1) {
    return const Color(0xff005bbc);
  } else if (type != null && type == 1) {
    return const Color(0xff008b5b);
  } else {
    return Colors.transparent;
  }
}

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
                  left: 15.0, top: 10, right: 15.0, bottom: 10.0),
              margin: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 10.0),
              decoration: BoxDecoration(
                color: getSlugBack(disruption['severity'], 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (disruption['message']['title'] != null)
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    Text(
                      disruption['message']['text'],
                      style: const TextStyle(fontSize: 16),
                    ),
                    
                  ],),
            ),
        ],
      );
}
