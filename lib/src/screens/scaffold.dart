import 'package:flutter/material.dart';

import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/screens/scaffold_body.dart';

class NavikaAppScaffold extends StatelessWidget {
  final pathTemplate;
  final id;

  const NavikaAppScaffold({
    required this.pathTemplate,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: getNavigationBar(context),
      body: getPages(pathTemplate, id),
    );
  }
}
