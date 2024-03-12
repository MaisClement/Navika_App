import 'package:flutter/material.dart';
import 'package:navika/src/style.dart';
import 'package:shimmer/shimmer.dart';


class SchedulesSkelton extends StatelessWidget {
  const SchedulesSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: getShimmerBaseColor(context),
    highlightColor: getShimmerHighlightColor(context),
    child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: getShimmerBaseColor(context),
                ),
                child: const SizedBox(height: 46, width: double.infinity),
              ),
              for (var i = 0; i < 2; i++)
                Container(
                  margin: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: getShimmerBaseColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: getShimmerBaseColor(context),
                ),
              ),
              const SizedBox(
                height: 13,
              ),                        
              Center(
                child: Container(
                  height: 40,
                  width: 175,
                  decoration: BoxDecoration(
                    color: getShimmerBaseColor(context),
                    borderRadius: BorderRadius.circular(500),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),   
            ],
          ),
        ),
  );
}
