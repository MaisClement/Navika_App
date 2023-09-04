import 'package:flutter/material.dart';

class TimeBox extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final TextStyle? style;
  final String text;
  final BorderRadius? borderRadius;

  const TimeBox({
    required this.text,
    this.onTap,
    this.icon,
    this.style,
    this.borderRadius,
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
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        height: 45,
        child: Row(
          children: [
            if (icon != null)
              Icon(icon, 
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 25,
              ),
            const SizedBox(width: 10,),
            Text(text,
              style: style ?? TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    ),
  );
}
