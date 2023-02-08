import 'package:flutter/material.dart';

class TimerMessage extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color color;
  final bool allround;

  const TimerMessage({
    required this.message,
    this.backgroundColor = const Color(0x009e9e9e),
    this.color = const Color(0xff9e9e9e),
    this.allround = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: allround
          ? const EdgeInsets.only(left: 0.0, top: 13.0, right: 5, bottom: 0)
          : const EdgeInsets.only(left: 0.0, top: 13.0, right: 0, bottom: 0),
        padding:
            const EdgeInsets.only(left: 4.0, top: 2.0, right: 4, bottom: 3.0),
        decoration: BoxDecoration(
          borderRadius: allround
          ? const BorderRadius.all(Radius.circular(7))
          : const BorderRadius.only(
              topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
          color: backgroundColor,
        ),
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: 'Segoe Ui',
            color: Colors.white,
          ),
        ),
      );
}
