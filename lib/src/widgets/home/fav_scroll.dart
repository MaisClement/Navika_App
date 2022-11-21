import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/global.dart' as globals;

import '../../routing.dart';

class HomeBodyFavScroll extends StatelessWidget {

	const HomeBodyFavScroll({
		super.key,
	});

	@override
	Widget build(BuildContext context) => ListView(
    scrollDirection: Axis.horizontal,
    children: [

      // Maison
      InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 10,),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ]
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
      ),

      // Ajout favoris
      InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 10,),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ]
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
      ),

      // Ajout favoris
      InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 10,),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ]
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
      )

    ],
  );
}