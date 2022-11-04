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
	Widget build(BuildContext context) => SizedBox(
    width: MediaQuery.of(context).size.width,
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
        InkWell(
          onTap: () {
            globals.route['arr_name'] = null;
            globals.route['arr_id'] = null;
            globals.route['dep_name'] = null;
            globals.route['dep_id'] = null;
            RouteStateScope.of(context).go('/home/search');
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              // color: const Color.fromARGB(255, 220, 220, 220),
              border: Border.all(width: 2.0, color: Theme.of(context).colorScheme.secondary)
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/search.svg',
                  color: Theme.of(context).colorScheme.secondary,
                  height: 30
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
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