import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../routing.dart';
import '../data/global.dart' as globals;

class HomePannel extends StatelessWidget {
  final void Function()? tooglePanel;

	const HomePannel({
    required this.tooglePanel,
		super.key,
	});

	@override
	Widget build(BuildContext context) => Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.grey[200],
    ),
    child: Column(
      children: [
        Container(
          height: 20,
        ),
        GestureDetector(
          onTap: tooglePanel,
          child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(30),
              ),
            ),
        ),
        Container(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding: const EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 5, //spread radius
                blurRadius: 7, // blur radius
                offset: const Offset(0, 2), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              )
            ]
          ),
          child: InkWell(
            onTap: () {
              globals.route['arr_name'] = null;
              globals.route['arr_id'] = null;
              globals.route['dep_name'] = null;
              globals.route['dep_id'] = null;
              RouteStateScope.of(context).go('/home/search');
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/search.svg',
                  color: Theme.of(context).colorScheme.secondary,
                  height: 30
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
                  color: Colors.transparent,
                  child: Text("Où allons nous ?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary, // Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}