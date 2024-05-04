// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/icon.dart';

class ButtonLarge extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final image;
  final Color? color;
  final TextStyle? style;
  final String text;
  final BorderRadius? borderRadius;

  const ButtonLarge({
    required this.text,
    this.onTap,
    this.icon,
    this.image,
    this.color,
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
              if (image != null)
                Image(image: image,
                  width: 25,
                  height: 25,
                )
              else if (icon != null)
                Icon(icon, 
                  color: Theme.of(context).colorScheme.onSurface,
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
                chevronRight,
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
