import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/trafic_block.dart';
import '../widgets/home_body_fav_scroll.dart';
import '../data/global.dart' as globals;

import '../routing.dart';

class HomeBody extends StatelessWidget {
	final String el;

	const HomeBody({
		required this.el,
		super.key,
	});

	@override
	Widget build(BuildContext context) => // Maison
    InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 10,),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 2.0, color: Theme.of(context).colorScheme.secondary)
        ),
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            SvgPicture.asset(
              'assets/plus.svg',
              color: Theme.of(context).colorScheme.secondary,
              height: 30
            ),
            Container(
              height: 10,
            ),
            Text('Ajouter'),
          ],
        ),
      ),
    );
}