import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class SchedulesSkelton extends StatelessWidget {
  const SchedulesSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Color(0xffe0e0e0),
    highlightColor: Color(0xfff5f5f5),
    child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: SizedBox(height: 40, width: double.infinity),
              ),
              for (var i = 0; i < 2; i++)
                Container(
                  margin: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            width: (Random().nextInt(200) + 50).toDouble(),
                            height: 23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                              color: Colors.grey[100],
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        for (var j = 0; j < (Random().nextInt(3) + 1); j++)
                          Container(
                              margin: EdgeInsets.only(top: 5, right: 10),
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ))
                      ]),
                    ],
                  ),
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(
                height: 13,
              ),                        
              Center(
                child: Container(
                  height: 40,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(500),
                  ),
                ),
              ),
            ],
          ),
        ),
  );
}
