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
        margin: const EdgeInsets.only(left: 10, right: 5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: onTap,
            onLongPress: onLongPress,
            child: SizedBox(
              width: 100,
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
                  Text(name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
