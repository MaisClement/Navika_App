import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';

class FavButton extends StatelessWidget {
  final String name;
  final String img;
  final void Function() onTap;

  const FavButton({
    required this.name,
    required this.img,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 10, right: 10),
    width: 100,
    height: 100,
    child: Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context)
                .colorScheme
                .primaryContainer
                .withOpacity(0.2),
          ),
          child: Column(
            children: [
              Container(
                height: 10,
              ),
              SvgPicture.asset(img,
                  color: Theme.of(context).colorScheme.primary, height: 30),
              Container(
                height: 10,
              ),
              Text(name),
            ],
          ),
        ),
      ),
    ),
  );
}
