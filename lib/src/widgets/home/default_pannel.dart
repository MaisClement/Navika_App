// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class DefaultPannel extends StatelessWidget {
	const DefaultPannel({
		super.key,
	});

	@override
	Widget build(BuildContext context) => SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Container(
          height: 20,
        ),
        Container(
          width: 40,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Container(
          height: 10,
        ),
      ],
    ),
  );
}
