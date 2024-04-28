// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/icons/lines.dart';

class ButtonLargeTrafic extends StatelessWidget {
  final Function()? onTap;
  final Map line;
  final BorderRadius? borderRadius;

  const ButtonLargeTrafic({
    this.onTap,
    required this.line,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(
        color: getSlugColor(line['severity'], true).withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(500),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? BorderRadius.circular(500),
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      margin: const EdgeInsets.all(10.0),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 3.0,
                          color: getSlug(line['severity'], true),
                        ),
                      ),
                      child: LinesIcones(
                        line: line,
                        removeMargin: true,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      width: 20,
                      height: 20,
                      top: 43,
                      left: 43,
                      child: Image(image: getSlugImage(line['severity'], 1)),
                    )
                  ],
                ),
                Expanded(
                  child: Text(
                    getSlugLongTitle(context, line['severity']),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      );
}
