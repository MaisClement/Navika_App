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
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:navika/src/widgets/places/load.dart';

class JourneysSearch extends StatefulWidget {
  final String type;

  const JourneysSearch({required this.type, super.key});

  @override
  State<JourneysSearch> createState() => _JourneysSearchState();
}

class _JourneysSearchState extends State<JourneysSearch> {
  final myController = TextEditingController();

  FocusNode textFieldNode = FocusNode();
  String search = '';
  ApiStatus error = ApiStatus.ok;
  int flag = 0;
  bool hasLastestFlag = false;
  bool isLoading = false;
  List places = [];

  Future<void> _getPlaces() async {
    if (search == '') {
      return;
    }
    flag++;
    hasLastestFlag = false;

    setState(() {
      isLoading = true;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getPlaces(search, globals.position, flag);

    if (mounted && !hasLastestFlag) {
      setState(() {
        error = result['status'];
      });

      setState(() {
        if (result['value']?['flag'] == flag) {
          places = result['value']?['places'];
        }
        isLoading = false;
        hasLastestFlag = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(textFieldNode);
      _getPlaces();
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  List<Widget> getElements() {
    List<Widget> res = [];

    if (places.isNotEmpty || search == '') {
      // Votre position
      if (globals.route['from']['name'] != AppLocalizations.of(context)!.your_position &&
          globals.route['to']['name'] != AppLocalizations.of(context)!.your_position &&
          globals.position != null) {
        res.add(PlacesListButton(
          isLoading: isLoading,
          place: {
            'id': '${globals.position?.longitude};${globals.position?.latitude}',
            'name': AppLocalizations.of(context)!.your_position,
            'type': 'current_pos',
            'distance': 0,
            'town': '',
            'zip_code': '',
            'coord': const {},
            'lines': const [],
            'modes': const []
          },
          onTap: () {
            globals.route[widget.type]['id'] = '${globals.position?.longitude};${globals.position?.latitude}';
            globals.route[widget.type]['name'] = AppLocalizations.of(context)!.your_position;
            RouteStateScope.of(context).go('/home/journeys');
          },
        ));
      }

      // Favoris
      List favs = globals.hiveBox.get('addressFavorites');
      if (search.isEmpty && favs.isNotEmpty) {
        res.add(
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              AppLocalizations.of(context)!.your_favorites,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily,
                color: walkingColor(context),
              ),
            ),
          ),
        );
      }
      for (var fav in favs) {
        if (globals.route['from']['id'] != fav['id'] && globals.route['to']['id'] != fav['id'] && search.isEmpty) {
          res.add(PlacesListButton(
            isLoading: isLoading,
            place: {
              'id': fav['id'],
              'name': fav['name'],
              'type': fav['alias'] == 'home' || fav['alias'] == 'work' ? fav['alias'] : 'favorite',
              'distance': 0,
              'town': '',
              'zip_code': '',
              'coord': const {},
              'lines': const [],
              'modes': const []
            },
            onTap: () {
              globals.route[widget.type]['id'] = fav['id'];
              globals.route[widget.type]['name'] = fav['name'];
              RouteStateScope.of(context).go('/home/journeys');
            },
          ));
        }
      }

      // Historique
      List history = globals.hiveBox.get('historyPlaces');
      if (search.isEmpty && history.isNotEmpty) {
        res.add(
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              AppLocalizations.of(context)!.recent,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily,
                color: walkingColor(context),
              ),
            ),
          ),
        );
        for (var place in history) {
          res.add(PlacesListButton(
            isLoading: isLoading,
            place: place,
            onTap: () {
              globals.route[widget.type]['id'] = place['id'];
              globals.route[widget.type]['name'] = place['name'];
              addToHistory(place);
              RouteStateScope.of(context).go('/home/journeys');
            },
          ));
        }
      }

      // Places
      if (places.isNotEmpty && error == ApiStatus.ok) {
        for (var place in places) {
          res.add(PlacesListButton(
            isLoading: isLoading,
            place: place,
            onTap: () {
              globals.route[widget.type]['id'] = place['id'];
              globals.route[widget.type]['name'] = place['name'];
              addToHistory(place);
              RouteStateScope.of(context).go('/home/journeys');
            },
          ));
        }
      }
    } else {
      if (places.isEmpty && isLoading == true) {
        res.add(const PlacesLoad());
      } else {
        res.add(PlacesEmpty());
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: myController,
          focusNode: textFieldNode,
          decoration: InputDecoration(
              hintText: widget.type == 'from' ? AppLocalizations.of(context)!.where_are_we_departing_from : AppLocalizations.of(context)!.where_are_we_going),
          onChanged: (text) {
            setState(() {
              search = text;
            });
            _getPlaces();
          },
        ),
      ),
      body: ListView(
        children: [
          if (error != ApiStatus.ok)
            ErrorBlock(
              error: error,
              retry: _getPlaces,
            )
          else
            ...getElements()
        ],
      ));
}
