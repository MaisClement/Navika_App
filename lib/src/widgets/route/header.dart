import 'package:flutter/material.dart';

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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
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
