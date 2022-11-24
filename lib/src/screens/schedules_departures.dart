import 'package:flutter/material.dart';
import 'package:navika/src/widgets/schedules/body.dart';
import '../data/global.dart' as globals;

class DepartureDetails extends StatefulWidget {
  final String? navPos;

  const DepartureDetails({this.navPos, super.key});

  @override
  State<DepartureDetails> createState() => _DepartureDetailsState();
}

class _DepartureDetailsState extends State<DepartureDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool state = false;
  int up = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(':D'),
    ),
    body: Container(
      child: Text('Test'),
    )
  );
}