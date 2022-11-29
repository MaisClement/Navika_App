import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../routing.dart';
import '../../data/global.dart' as globals;

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
      color: Colors.white,
    ),
    child: Column(
      children: [
        Container(
          height: 20,
        ),
        Container(
          width: 40,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Container(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                // color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                // spreadRadius: 3,
                // blurRadius: 5,
                // offset: const Offset(0, 2),
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              )
            ]
          ),
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                globals.route['dep']['name'] = null;
                globals.route['dep']['id'] = null;
                globals.route['arr']['name'] = null;
                globals.route['arr']['id'] = null;
                RouteStateScope.of(context).go('/home/search');
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/search.svg',
                      color: Theme.of(context).colorScheme.primary,
                      height: 30
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
                      child: Text("Où allons nous ?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary, // Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}