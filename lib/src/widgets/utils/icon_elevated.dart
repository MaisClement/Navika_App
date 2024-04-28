// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class IconElevatedButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Function() onPressed;
  final ButtonStyle? style;

  const IconElevatedButton({
    this.icon,
    required this.text,
    required this.onPressed,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    style: style,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) 
          Icon(icon, size: 25),
        Container(
          margin: icon == null
          ? const EdgeInsets.only(bottom: 11, top: 11)
          : const EdgeInsets.only(left:15, bottom: 11, top: 11),
          child: Text(text,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
