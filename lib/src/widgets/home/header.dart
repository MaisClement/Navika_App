import 'package:flutter/material.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';

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
          color: backgroundColor(context),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 15,
            ),
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Container(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Material(
                color: backgroundColor(context),
                child: InkWell(
                  onTap: () {
                    globals.route['dep']['name'] = null;
                    globals.route['dep']['id'] = null;
                    globals.route['arr']['name'] = null;
                    globals.route['arr']['id'] = null;
                    RouteStateScope.of(context).go('/journeys');
                  },
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: boxColor(context),
                    ),
                    child: Row(
                      children: [
                        Icon(ScaffoldIcon.search,
                            color: boxContentColor(context), size: 25),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            child: Text(
                              'Où allons nous ?',
                              style: TextStyle(
                                color: boxContentColor(context),
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 7,
            ),
          ],
        ),
      );
}
