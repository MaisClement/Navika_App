import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:shimmer/shimmer.dart';

class RouteListSkelton extends StatelessWidget {
  const RouteListSkelton({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: getShimmerBaseColor(context),
        highlightColor: getShimmerHighlightColor(context),
        child: Container(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: Colors.grey[300],
                        ),
                        child: const SizedBox(height: 20, width: 60),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: Colors.grey[300],
                        ),
                        child: const SizedBox(height: 20, width: 60),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: Colors.grey[300],
                    ),
                    child: SizedBox(
                        height: 20,
                        width: (Random().nextInt(200) + 50).toDouble()),
                  ),
                  const Expanded(
                    child: Text(''),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: Colors.grey[300],
                    ),
                    child: const SizedBox(height: 20, width: 60),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                color: getShimmerBaseColor(context),
                height: 1,
              )
            ],
          ),
        ),
      );
}
