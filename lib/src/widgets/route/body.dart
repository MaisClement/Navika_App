import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/favorites/body.dart';
import 'package:navika/src/widgets/home/messages.dart';

class RouteBody extends StatelessWidget {
  final ScrollController scrollController;
  final Map journey;

  const RouteBody({
    required this.scrollController,
    required this.journey,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView(
        controller: scrollController,
        padding: const EdgeInsets.only(top: 30),
        children: const [
          // Messages de l'index
          Text('Test')
        ],
      );
}
