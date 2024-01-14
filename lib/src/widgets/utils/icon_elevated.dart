import 'package:flutter/material.dart';

class IconElevatedButton extends StatelessWidget {
  final IconData? icon;
  final double width;
  final String text;
  final Function() onPressed;
  final ButtonStyle? style;

  const IconElevatedButton({
    this.icon,
    required this.width,
    required this.text,
    required this.onPressed,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    style: style,
    child: SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 25),
          Container(
            margin: const EdgeInsets.only(
                left: 15, bottom: 11, top: 11, right: 15),
            child: Text(text,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
