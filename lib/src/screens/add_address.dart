import 'dart:convert';

import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navika/src/icons/navika_icons_icons.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:flutter/foundation.dart';
import 'package:navika/src/widgets/places/load.dart';

class AddAddress extends StatefulWidget {
  final String predefineType;

  const AddAddress({
    this.predefineType = '', 
    super.key
  });

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final queryController = TextEditingController();
  final labelController = TextEditingController();

  String title = 'Nouvelle adresse';
  FocusNode queryFieldNode = FocusNode();
  FocusNode labelFieldNode = FocusNode();
  String search = '';
  String label = '';
  String error = '';
  int flag = 0;
  bool isLoading = false;
  bool isDefined = false;
  Map address = {};
  List places = [];

  List addressFavorites = globals.hiveBox.get('AddressFavorites') ?? [];

  handleSetAddress(place) {
    setState(() {
      isDefined = true;
      address = place;
      queryController.text = place['name'];
    });

    if (widget.predefineType != '') {
      handleSaveAddress();
    }

    if (label == '') {
      FocusScope.of(context).requestFocus(labelFieldNode);
    }
  }

  handleOnTapAddress() {
    setState(() {
      isDefined = false;
    });
  }

  handleSaveAddress() {
    if ((widget.predefineType != '' && !isDefined) || (!isDefined && label == '')){
      FloatingSnackBar(
        message: 'Adresse ou libellé non défini',
        context: context,
        textColor: Theme.of(context).colorScheme.primary,
        textStyle: snackBarText,
        duration: const Duration(milliseconds: 4000),
        backgroundColor: const Color(0xff272727),
      );
    return;
    }
    List list = globals.hiveBox.get('AddressFavorites');
    list.add({
      'id': address['id'],
      'name': address['name'],
      'alias': widget.predefineType == '' 
          ? label
          : widget.predefineType,
    });
    globals.hiveBox.put('AddressFavorites', list);
    Navigator.pop(context);
    RouteStateScope.of(context).go('/home');
    FloatingSnackBar(
      message: 'Nouvelle adresse ajouté.',
      context: context,
      textColor: Theme.of(context).colorScheme.primary,
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
    );
  }

  Future<void> _getPlaces() async {
    String url = '';
    flag++;

    bool allowGps = await globals.hiveBox.get('allowGps') ?? false;
    if (allowGps &&
        (globals.locationData?.latitude != null ||
            globals.locationData?.longitude != null) &&
        search != '') {
      url =
          '${globals.API_PLACES}?q=$search&lat=${globals.locationData?.latitude}&lon=${globals.locationData?.longitude}&flag=${flag.toString()}';
    } else if (search != '') {
      url = '${globals.API_PLACES}?q=$search&flag=${flag.toString()}';
    } else if (allowGps &&
        globals.locationData?.latitude != null &&
        globals.locationData?.longitude != null) {
      url =
          '${globals.API_PLACES}?lat=${globals.locationData?.latitude}&lon=${globals.locationData?.longitude}&flag=${flag.toString()}';
    } else {
      url = '${globals.API_PLACES}?q=&flag=${flag.toString()}';
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (mounted) {
          if (data['flag'] == flag) {
            setState(() {
              places = data['places'];
              isLoading = false;
              error = '';
            });
          }
        }
      } else {
        setState(() {
          error = 'Récupération des informations impossible.';
        });
      }
    } catch (e) {
      setState(() {
        error = "Une erreur s'est produite.";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        {FocusScope.of(context).requestFocus(queryFieldNode), _getPlaces()});
  }

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: appBarTitle,
        ),
        actions: [
          IconButton(
            icon: Icon(
              NavikaIcons.save,
              color: isDefined && label != ''
                ? tabLabelColor(context)
                : routeBhColor(context),),
            tooltip: 'Ajouter aux favoris',
            onPressed: () {
              handleSaveAddress();
            },
          ),
        ],
      ),
      body: Column(
        children: [

          if (widget.predefineType == '' )
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(children: [
                const Icon(NavikaIcons.star),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: labelController,
                    focusNode: labelFieldNode,
                    decoration: const InputDecoration(hintText: 'Libellé'),
                    onChanged: (text) {
                      setState(() {
                        label = text;
                      });
                    },
                  ),
                )
              ]),
            ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              children: [
                const Icon(NavikaIcons.marker),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: queryController,
                    focusNode: queryFieldNode,
                    decoration: const InputDecoration( 
                      hintText: 'Ajouter une adresse, une gare, un arrêt ou une station'
                    ),
                    onChanged: (text) {
                      setState(() {
                        search = text;
                      });
                      _getPlaces();
                    },
                    onTap: () {
                      handleOnTapAddress();
                    },
                  ),
                ),
              ],
            ),
          ),
          if (!isDefined)
            Expanded(
              child: ListView(
                children: [
                  if (error != '')
                    ErrorBlock(
                      error: error,
                    )
                  else if (places.isNotEmpty)
                    for (var place in places)
                      PlacesListButton(
                        isLoading: isLoading,
                        place: place,
                        onTap: () {
                          handleSetAddress(place);
                        },
                      )
                  else if (places.isEmpty && isLoading == true)
                    const PlacesLoad()
                  else
                    const PlacesEmpty(),
                ],
              ),
            ),
        ],
      ));
}
