import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ErrorMessage extends StatelessWidget {
	final String error;

	const ErrorMessage({
		required this.error,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Column(
    children: [
      const SizedBox(height: 10),
      Row(
        children: [
          const SizedBox(width: 15),
          SvgPicture.asset('assets/img/cancel.svg',
            color: Colors.grey[600],
            height: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              error,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Segoe Ui',
              ),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
      const SizedBox(height: 15),
    ],
  );
}
