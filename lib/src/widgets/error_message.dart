import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/widgets/error_block.dart';

class ErrorMessage extends StatelessWidget {
  final ApiStatus error;

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
              SvgPicture.asset(
                  getErrorIcon(error),
                  color: Colors.grey[600],
                  height: 18,
                ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  getErrorText(error),
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
