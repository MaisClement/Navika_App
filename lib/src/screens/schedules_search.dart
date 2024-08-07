// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/routing.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:navika/src/widgets/places/load.dart';

class SchedulesSearch extends StatefulWidget {
	const SchedulesSearch({super.key});

	@override
	State<SchedulesSearch> createState() => _SchedulesSearchState();
}

class _SchedulesSearchState extends State<SchedulesSearch> {

  TextEditingController textController = TextEditingController();
  FocusNode textFieldNode = FocusNode();
  String search = '';
  ApiStatus error = ApiStatus.ok;
  int flag = 0;
  bool hasLastestFlag = false;
  bool isLoading = false;
  List places = [];

  Future<void> _getStops() async {
    flag++;
    hasLastestFlag = false;

    setState(() {
      isLoading = true;
      flag = flag;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getStops(search, globals.position, flag);

    if (mounted && !hasLastestFlag) {
      setState(() {
        error = result['status'];
      });
      
      if (result['value']?['flag'] == flag && result['value']?['places'] != null) {
        setState(() {
          places = result['value']?['places'];
          isLoading = false;
          hasLastestFlag = true;
        });
      }
    }
	}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(textFieldNode);
      _getStops();
    });
  }
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(
			title: TextField(
        controller: textController,
        focusNode: textFieldNode,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.search_station
        ),
        onChanged: (text) {
          setState(() {
            search = text;
          });
          _getStops();
        },
      ),
		),
		body: ListView(
      children: [

        if (error != ApiStatus.ok)
          ErrorBlock(
            error: error,
            retry: _getStops,
          )
        
        else if (places.isNotEmpty)
          for (var place in places)
            PlacesListButton(
              isLoading: isLoading,
              place: place,
              onTap: () {
                globals.schedulesStopName = place['name'];
                RouteStateScope.of(context).go('/schedules/stops/${place['id']}');
              },
            )

        else if (places.isEmpty && isLoading == true)
          const PlacesLoad()
          
        else
          PlacesEmpty(),
      ],
      
    )
  );
}
