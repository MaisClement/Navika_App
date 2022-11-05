import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/global.dart' as globals;

import '../routing.dart';

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
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
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
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
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
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
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