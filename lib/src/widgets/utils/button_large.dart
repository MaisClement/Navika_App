import 'package:flutter/material.dart';

class ButtonLarge extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final Color? color;
  final Color? text_color;
  final TextStyle? style;
  final String text;
  final BorderRadius? borderRadius;

  const ButtonLarge({
    required this.text,
    this.onTap,
    this.icon,
    this.color,
    this.text_color,
    this.style,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(500),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: borderRadius ?? BorderRadius.circular(500),
      child: SizedBox(
        height: 65,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              if (icon != null)
                Icon(icon, 
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 25,
                ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  child: Text(text,
                    style: style ?? TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onPrimaryContainer
                    ),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurface,
                size: 30,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
