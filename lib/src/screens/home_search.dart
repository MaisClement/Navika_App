// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/add_address.dart';
import 'package:navika/src/widgets/bottom_sheets/remove_history.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:navika/src/widgets/places/load.dart';

void openMapPoint(double lat, double lon, [setMarker = false]) {
  if (globals.openMapPointCallback != null) {
    globals.openMapPointCallback!(lat, lon, setMarker);
  }
}

void removePointMarker() {
  if (globals.removePointMarkerCallback != null) {
    globals.removePointMarkerCallback!();
  }
}

void handleOnTap(context, addAddress, place) {
  if (addAddress) {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: bottomSheetBorder,
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => BottomAddAddress(address: place),
    );
    return;
  }
  globals.updateMap = true;
  if (place['type'] == 'favorite' || place['type'] == 'stop_area' || place['type'] == 'stop_point') {
    RouteStateScope.of(context).go('/stops/${place['id']}');
    openMapPoint(place['coord']['lat'], place['coord']['lon']);
  } else {
    RouteStateScope.of(context).go('/address/${place['coord']['lat']};${place['coord']['lon']}');
    openMapPoint(place['coord']['lat'], place['coord']['lon'], true);
  }
  addToHistory(place);
}

class HomeSearch extends StatefulWidget {
  final bool addAddress;

  const HomeSearch({
    this.addAddress = false,
    super.key,
  });

  @override
  State<HomeSearch> createState() => _SchedulesSearchState();
}

class _SchedulesSearchState extends State<HomeSearch> {
  final myController = TextEditingController();

  FocusNode textFieldNode = FocusNode();
  String search = globals.query ?? '';
  ApiStatus error = ApiStatus.ok;
  int flag = 0;
  bool hasLastestFlag = false;
  bool isLoading = false;
  List places = [];
  List history = [];

  Future<void> _getPlaces() async {
    if (globals.query != null) {
      setState(() {
        myController.text = globals.query!;
        search = globals.query!;
        globals.query = null;
      });
    }

    NavikaApi navikaApi = NavikaApi();

    flag++;
    hasLastestFlag = false;

    setState(() {
      isLoading = true;
      flag = flag;
    });

    Map result = {};
    if (search == '') {
      result = await navikaApi.getStops(search, globals.position, flag);
    } else {
      result = await navikaApi.getPlaces(search, globals.position, flag);
    }

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

  void getHistory() {
    setState(() {
      history = globals.hiveBox.get('historyPlaces') ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(textFieldNode);
      _getPlaces();
      getHistory();
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
      if (widget.addAddress == false) {
        List favs = globals.hiveBox.get('savedAddress');
        if (search.isEmpty && favs.isNotEmpty) {
          res.add(
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                AppLocalizations.of(context)!.your_favorites,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
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
                  'type': 'favorite',
                  'distance': 0,
                  'town': '',
                  'zip_code': '',
                  'coord': const {},
                  'lines': const [],
                  'modes': const [],
                  'icon': fav['icon'],
                },
                onTap: () {
                  handleOnTap(context, widget.addAddress, {
                    'id': fav['id'],
                    'name': fav['name'],
                    'type': 'favorite',
                    'distance': 0,
                    'town': '',
                    'zip_code': '',
                    'coord': const {},
                    'lines': const [],
                    'modes': const [],
                    'icon': fav['icon'],
                  });
                },
              ),
            );
          }
        }
      }

      // Historique
      if (search.isEmpty && history.isNotEmpty) {
        res.add(
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              AppLocalizations.of(context)!.recent,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: fontFamily,
                color: walkingColor(context),
              ),
            ),
          ),
        );
        for (var place in history.take(5)) {
          res.add(PlacesListButton(
            isLoading: isLoading,
            isHistory: true,
            place: place,
            onTap: () {
              handleOnTap(context, widget.addAddress, place);
            },
            onLongPress: () {
              showModalBottomSheet<void>(
                shape: const RoundedRectangleBorder(
                  borderRadius: bottomSheetBorder,
                ),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) => BottomRemoveHistory(
                  id: place['id'],
                  update: getHistory,
                ),
              );
            },
          ));
        }
      }

      // Places
      if (places.isNotEmpty && error == ApiStatus.ok) {
        if (search == '') {
          res.add(
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                'A Proximité',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: fontFamily,
                  color: walkingColor(context),
                ),
              ),
            ),
          );
        }
        for (var place in places) {
          res.add(PlacesListButton(
            isLoading: isLoading,
            place: place,
            onTap: () {
              handleOnTap(context, widget.addAddress, place);
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
          style: TextStyle(
            fontFamily: fontFamily,
          ),
          controller: myController,
          focusNode: textFieldNode,
          decoration: InputDecoration(
            hintText: !widget.addAddress ? AppLocalizations.of(context)!.home_search : AppLocalizations.of(context)!.add_address,
          ),
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
