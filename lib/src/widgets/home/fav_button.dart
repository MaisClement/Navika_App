import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';

class FavButton extends StatelessWidget {
  final String name;
  final IconData img;
  final void Function() onTap;
  final void Function() onLongPress;

  const FavButton({
    required this.name,
    required this.img,
    required this.onTap,
    required this.onLongPress,
    super.key, 
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        width: 100,
        height: 100,
        child: Material(
          color: backgroundColor(context),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: onTap,
            onLongPress: onLongPress,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: boxColor(context),
              ),
              child: Column(
                children: [
                  Container(
                    height: 10,
                  ),
                  Icon(img,
                    color: accentColor(context),
                    size: 30,
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: boxContentColor(context)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
