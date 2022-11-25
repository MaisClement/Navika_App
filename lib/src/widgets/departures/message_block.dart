import 'package:flutter/material.dart';

class MessageBlock extends StatelessWidget {
	final String message;

	const MessageBlock({
		required this.message,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:5.0),
    margin: const EdgeInsets.only(left:0.0, top:5.0,right:7.5,bottom:5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: Text(message,
      style: const TextStyle(
        color: Color(0xffa9a9a9),
        fontWeight: FontWeight.w700,
        fontFamily: 'Segoe Ui',
      ),
      textAlign: TextAlign.center,
    ),
  );
}

