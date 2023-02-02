import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:flutter/foundation.dart';
import 'package:navika/src/widgets/places/load.dart';

class AddAddress extends StatefulWidget {
  final predefineType;

  const AddAddress({this.predefineType = '', super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final myController = TextEditingController();

  FocusNode textFieldNode = FocusNode();
  String search = '';
  String error = '';
  int flag = 0;
  bool isLoading = false;
  List places = [];

  List addressFavorites = globals.hiveBox.get('AddressFavorites') ?? [];

  Future<void> _getPlaces() async {
    if (kDebugMode) {
      print({'INFO_p', widget.predefineType});
    }
    String url = '';
    flag++;

    if ((globals.locationData?.latitude != null ||
            globals.locationData?.longitude != null) &&
        search != '') {
      url =
          '${globals.API_PLACES}?q=$search&lat=${globals.locationData?.latitude}&lon=${globals.locationData?.longitude}&flag=${flag.toString()}';
    } else if (search != '') {
      url = '${globals.API_PLACES}?q=$search&flag=${flag.toString()}';
    } else if (globals.locationData?.latitude != null &&
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
        {FocusScope.of(context).requestFocus(textFieldNode), _getPlaces()});
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            TextField(
              controller: myController,
              focusNode: textFieldNode,
              decoration: const InputDecoration(
                  hintText:
                      'Ajouter une adresse, une gare, un arrêt ou une station'),
              onChanged: (text) {
                setState(() {
                  search = text;
                });
                _getPlaces();
              },
            ),
          ],
        ),
      ),
      body: ListView(
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
                  List list = globals.hiveBox.get('AddressFavorites');
                  list.add({
                    'id': place['id'],
                    'name': place['name'],
                    'type': widget.predefineType == '' || widget.predefineType == null
                        ? place['type']
                        : widget.predefineType,
                    'alias': 'alias',
                  });
                  globals.hiveBox.put('AddressFavorites', list);
                  Navigator.pop(context);
                  RouteStateScope.of(context).go('/home');
                  var snackBar = const SnackBar(
                    content: Text('Nouvelle adresse ajouté.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              )
          else if (places.isEmpty && isLoading == true)
            const PlacesLoad()
          else
            const PlacesEmpty(),
        ],
      ));
}
