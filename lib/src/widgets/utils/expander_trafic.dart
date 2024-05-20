// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/icon.dart';
import 'package:navika/src/utils.dart';

class ExpanderTrafic extends StatefulWidget {
  final Function()? onTap;
  final Map line;
  final BorderRadius borderRadius;

  const ExpanderTrafic({
    this.onTap,
    required this.line,
    required this.borderRadius,
    super.key,
  });

  @override
  State<ExpanderTrafic> createState() => _ButtonLargeTraficState();
}

class _ButtonLargeTraficState extends State<ExpanderTrafic> {
  bool displayDetails = false;

  void toogle() {
    setState(() {
      displayDetails = !displayDetails;
    });
  }

  List getReports() {
    return [...widget.line['reports']['current_trafic'], ...widget.line['reports']['current_work']];
  }

  BorderRadius getBorderRadiusBlock(borderRadius) {
    if (borderRadius == null) {
      return BorderRadius.circular(500);
    } else if (displayDetails) {
      return borderRadius.copyWith(
        bottomLeft: const Radius.circular(0),
        bottomRight: const Radius.circular(0),
      );
    }
    return borderRadius;
  }

  BorderRadius getBorderRadiusReport(borderRadius) {
    if (borderRadius == null) {
      return BorderRadius.circular(500);
    } else if (displayDetails) {
      return borderRadius.copyWith(
        topLeft: const Radius.circular(0),
        topRight: const Radius.circular(0),
      );
    }
    return borderRadius;
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        child: Column(
          children: [
            SizedBox(
              height: 55,
              child: Card(
                color: getSlugColor(widget.line['severity'], true).withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: getBorderRadiusBlock(widget.borderRadius),
                ),
                child: InkWell(
                  onTap: widget.onTap,
                  borderRadius: getBorderRadiusBlock(widget.borderRadius),
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.5),
                          child: Image(
                            image: getSlugImage(widget.line['severity'], 1),
                            width: 30,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            key: ValueKey('$displayDetails'),
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 3
                                ),
                                child: Text(
                                  getSlugLongTitle(context, widget.line['severity']),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              if (!displayDetails && getReports()[0]['message']['title'] != null)
                                Expanded(
                                  child: Text(
                                    getReports()[0]['message']['title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                    ),
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: toogle,
                          borderRadius: widget.borderRadius,
                          child: Padding(
                            padding: const EdgeInsets.all(12.5),
                            child: AnimatedRotation(
                              turns: displayDetails ? 0.25 : -0.25,
                              duration: const Duration(milliseconds: 150),
                              child: Icon(
                                chevronRight,
                                color: Theme.of(context).colorScheme.onSurface,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: Column(
                key: ValueKey('$displayDetails'),
                children: [
                  if (displayDetails)
                    for (var report in getReports())
                      if (report['severity'] == widget.line['severity'])
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15.0, bottom: 10.0),
                              decoration: BoxDecoration(
                                color: getSlugColor(report['severity'], true).withOpacity(0.2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (report['message']['title'] != null)
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(right: 5),
                                            child: Image(
                                              image: getSlugImage(report['severity']),
                                              height: 25,
                                            ),
                                          ),
                                          Expanded(
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  report['message']['title'],
                                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Text(
                                    report['message']['text'],
                                  ),
                                  if (report['updated_at'] != null)
                                    Text(
                                      'Mis à jour: ${getDateTime(report['updated_at'])}',
                                      style: const TextStyle(fontSize: 11),
                                    )
                                ],
                              ),
                            ),
                            Container(
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: getSlugColor(report['severity'], true),
                              ),
                            ),
                          ],
                        )
                ],
              ),
            )
          ],
        ),
      );
}
