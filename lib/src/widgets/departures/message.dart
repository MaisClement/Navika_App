// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
	final String message;
  final Color backgroundColor;
  final Color color;

	const Message({
		required this.message,
		this.backgroundColor = const Color(0x009e9e9e),
    this.color = const Color(0xff9e9e9e),
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left:5.0, top:5.0,right:5.0,bottom:5.0),
    margin: const EdgeInsets.only(left:0.0, top:5.0,right:7.5,bottom:5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: backgroundColor,
    ),
    child: Text(message,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontFamily: 'Segoe Ui',
      ),
      textAlign: TextAlign.center,
    ),
  );
}

class MiniMessage extends StatelessWidget {
	final String message;
  final Color backgroundColor;
  final Color color;

	const MiniMessage({
		required this.message,
		this.backgroundColor = const Color(0x009e9e9e),
    this.color = const Color(0xff9e9e9e),
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left:0.0, top:11.0, right:5, bottom:0),
    padding: const EdgeInsets.only(left:5.0, top:0.0, right:5, bottom:3.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: backgroundColor,
    ),
    child: Text(message,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        fontFamily: 'Segoe Ui',
      ),
      textAlign: TextAlign.center,
    ),
  );
}
