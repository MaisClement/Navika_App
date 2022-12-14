import 'package:flutter/material.dart';

class ErrorBlock extends StatelessWidget {
	final String error;

	const ErrorBlock({
		required this.error,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Column(
    children: [
      const SizedBox(height: 15),
      const Image(
        image: AssetImage('assets/maintenance.png'),
        width: 120
      ),
      Container(
        padding: const EdgeInsets.only(left:20.0, right:20.0),
        child: Text(error,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Segoe Ui',
          ),
        ),
      ),
      const SizedBox(height: 15),
    ],
  );
}
