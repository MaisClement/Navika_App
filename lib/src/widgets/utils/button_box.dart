// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class ButtonBox extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final TextStyle? style;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const ButtonBox({
    this.onTap,
    this.icon,
    this.style,
    this.borderRadius,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(500),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: borderRadius ?? BorderRadius.circular(500),
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: Icon(icon, 
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            size: 25,
          ),
        ),
      ),
    ),
  );
}
