import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../icons/scaffold_icon_icons.dart';
import '../data.dart';
import '../routing.dart';
import '../widgets/schedules/body.dart';
import '../widgets/schedules/list.dart';
import '../widgets/departure_list.dart';
import '../data/global.dart' as globals;

class SchedulesDetailsScreen extends StatefulWidget {
  final String? navPos;

  const SchedulesDetailsScreen({this.navPos, super.key});

  @override
  State<SchedulesDetailsScreen> createState() => _SchedulesDetailsScreenState();
}

class _SchedulesDetailsScreenState extends State<SchedulesDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool state = false;
  int up = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(schedulesStopName),
        // centerTitle: true,
      ),
      body: SchedulesBody());
}