// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/widgets/home/messages.dart';

class HomeWidgetMessages extends StatelessWidget {
  final List messages;

  const HomeWidgetMessages({
    required this.messages,
    super.key,
  });
  

  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (var message in messages)
        HomeMessage(message: message)
    ],
  );
}
