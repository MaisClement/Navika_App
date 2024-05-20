// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

// 🌎 Project imports:
import 'package:navika/src/icon.dart';
import 'package:navika/src/style.dart';

// 📦 Package imports:


class HomeHeaderSkelton extends StatelessWidget {
  const HomeHeaderSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: getShimmerBaseColor(context),
        highlightColor: getShimmerHighlightColor(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(arrowBack),
                    tooltip: AppLocalizations.of(context)!.back,
                    color: accentColor(context),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(3),
                        height: 29, // 35 - 3*2
                        width: (Random().nextInt(150) + 150).toDouble(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: getShimmerBaseColor(context),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(3),
                        height: 17, // 23 - 3*2
                        width: (Random().nextInt(100) + 50).toDouble(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: getShimmerBaseColor(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
