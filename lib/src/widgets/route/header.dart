import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';

class RoutePannel extends StatelessWidget {
  final double opacity;

  const RoutePannel({
    required this.opacity,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: routeBhColor(context),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 15,
                    ),
                    Opacity(
                      opacity: opacity,
                      child: Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                  ],
                ),
              );
}
