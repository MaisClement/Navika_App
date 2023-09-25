import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';

class Fare extends StatelessWidget {
  final Map journey;

  const Fare({
    required this.journey,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left:15.0, top:10, right:15.0, bottom:10.0),
    margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom:10.0),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right:5),
              child: Icon(
                NavikaIcons.ticket,
                size: 25,
                color: accentColor(context),
              ),
            ),
            Expanded(
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Text('Prix du billet : ${journey['fare'].toStringAsFixed(2)}€',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                ],
              )
            )
          ],
        ),
      ]
    ),
  );
}
