import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/lines/listbutton.dart';
import 'package:navika/src/widgets/places/load.dart';

class RoutesSearch extends StatefulWidget {
	const RoutesSearch({super.key});

	@override
	State<RoutesSearch> createState() => _RoutesSearchState();
}

class _RoutesSearchState extends State<RoutesSearch> {
  final myController = TextEditingController();
  
  FocusNode textFieldNode = FocusNode();
  String search = '';
  ApiStatus error = ApiStatus.ok;
  int flag = 0;
  bool isLoading = false;
  List lines = [];

  Future<void> _getLines() async {
    flag++;

    setState(() {
      isLoading = true;
      flag = flag;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getLines(search, flag);

    setState(() {
      error = result['status'];
    });
    
    if (mounted) {
      setState(() {
        if (result['value']?['flag'] == flag) {
          lines = result['value']?['lines'];
        }
        isLoading = false;
      });
    }
	}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
      FocusScope.of(context).requestFocus(textFieldNode),
      _getLines()
    });
  }
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(
			title: TextField(
        controller: myController,
        focusNode: textFieldNode,
        decoration: const InputDecoration(
          hintText: 'Rechercher une ligne'
        ),
        onChanged: (text) {
          setState(() {
            search = text;
          });
          _getLines();
        },
      ),
		),
		body: ListView(
      children: [

        if (error != ApiStatus.ok)
          ErrorBlock(
            error: error,
          )
        
        else if (lines.isNotEmpty)
          for (var line in lines)
            LinesListButton(
              isLoading: isLoading,
              line: line,
              onTap: () {
                RouteStateScope.of(context).go('/routes/details/${line['id']}');
              },
            )

        else if (lines.isEmpty && isLoading == true)
          const PlacesLoad()
          
        else
          const PlacesEmpty(),
      ],
      
    )
  );
}