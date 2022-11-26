import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home_FavButton extends StatelessWidget {
	final String name;
  void Function() onTap;

	Home_FavButton({
		required this.name,
		required this.onTap,
		super.key,
	});

	@override
	Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(left: 10,),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 2.0, color: Theme.of(context).colorScheme.primary)
      ),
      child: Column(
        children: [
          Container(
            height: 10,
          ),
          SvgPicture.asset(
            'assets/star.svg',
            color: Theme.of(context).colorScheme.primary,
            height: 30
          ),
          Container(
            height: 10,
          ),
          Text(name),
        ],
      ),
    ),
  );
}