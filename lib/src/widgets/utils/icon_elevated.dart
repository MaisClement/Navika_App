// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class IconElevatedButton extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final String text;
  final double? textSize;
  final Function() onPressed;
  final ButtonStyle? style;
  final EdgeInsets? margin;

  const IconElevatedButton({
    this.icon,
    this.iconSize,
    required this.text,
    this.textSize,
    required this.onPressed,
    this.style,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) Icon(icon, size: iconSize ?? 25),
            Container(
              margin: margin ?? (icon == null
                      ? const EdgeInsets.only(bottom: 11, top: 11)
                      : const EdgeInsets.only(left: 15, bottom: 11, top: 11)),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: textSize ?? 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
