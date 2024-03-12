import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/widgets/utils/search_box.dart';

class HomePannel extends StatelessWidget {
  const HomePannel({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 15,
                bottom: 10,
              ),
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
           Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SearchBox(
                onTap: () {
                  initJourney(
                    null,
                    null,
                    context
                  );
                },
                icon: NavikaIcons.search,
                text: 'Où allons nous ?',
                borderRadius: BorderRadius.circular(15)
              ),
            ),
            Container(
              height: 7,
            ),
          ],
        ),
      );
}
