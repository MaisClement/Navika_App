// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:here_sdk/core.dart';

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

void openMapPoint(double lat, double lon, [setMarker = false]) {
  GeoCoordinates geoCoordinates = GeoCoordinates(lat, lon);
  GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(lat, lon);
  globals.hereMapController?.zoomTo(geoCoords, true);

  if (setMarker) {
    removePointMarker();
    globals.pointMarker = globals.hereMapController?.addMapMarker(
      geoCoordinates,
      'assets/img/marker/marker.png',
      Metadata(),
      100,
    );
    globals.pointMarker;
  }
}

void removePointMarker() {
  if (globals.pointMarker != null) {
    globals.hereMapController?.removeMapMarker(globals.pointMarker!);
  }
}

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _SchedulesSearchState();
}

class _SchedulesSearchState extends State<HomeSearch> {
  final myController = TextEditingController();

  FocusNode textFieldNode = FocusNode();
  String search = '';
  ApiStatus error = ApiStatus.ok;
  int flag = 0;
  bool hasLastestFlag = false;
  bool isLoading = false;
  List places = [];

  Future<void> _getPlaces() async {
    if (globals.query != null) {
      setState(() {
        myController.text = globals.query!;
        search = globals.query!;
        globals.query = null;
      });
    }

    if (search == '') {
      return;
    }
    flag++;
    hasLastestFlag = false;

    setState(() {
      isLoading = true;
      flag = flag;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getPlaces(search, globals.position, flag);

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
      if (search.isEmpty && favs.isNotEmpty) {
        for (var fav in favs) {
          res.add(
            PlacesListButton(
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
                globals.updateMap = true;
                initJourney(null, {'name': fav['name'], 'id': fav['id']}, context);
              },
            ),
          );
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
            isHistory: true,
            place: place,
            onTap: () {
              globals.updateMap = true;

              if (place['type'] == 'stop_area' || place['type'] == 'stop_point') {
                RouteStateScope.of(context).go('/stops/${place['id']}');
                openMapPoint(place['coord']['lat'], place['coord']['lon']);
              } else {
                RouteStateScope.of(context).go('/address/${place['coord']['lat']};${place['coord']['lon']}');
                openMapPoint(place['coord']['lat'], place['coord']['lon'], true);
              }
              addToHistory(place);
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
              globals.updateMap = true;

              if (place['type'] == 'stop_area' || place['type'] == 'stop_point') {
                RouteStateScope.of(context).go('/stops/${place['id']}');
                openMapPoint(place['coord']['lat'], place['coord']['lon']);
              } else {
                RouteStateScope.of(context).go('/address/${place['coord']['lat']};${place['coord']['lon']}');
                openMapPoint(place['coord']['lat'], place['coord']['lon'], true);
              }
              addToHistory(place);
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
          decoration: InputDecoration(hintText: AppLocalizations.of(context)!.home_search),
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
