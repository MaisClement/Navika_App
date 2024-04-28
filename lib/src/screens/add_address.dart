// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:navika/src/widgets/places/load.dart';

class AddAddress extends StatefulWidget {
  final String predefineType;
  final String id;

  const AddAddress({
    this.predefineType = '', 
    this.id = '',
    super.key
  });

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController queryController = TextEditingController();
  TextEditingController labelController = TextEditingController();

  FocusNode queryFieldNode = FocusNode();
  FocusNode labelFieldNode = FocusNode();
  String search = '';
  String label = '';
  ApiStatus error = ApiStatus.ok;
  int flag = 0;
  bool isLoading = false;
  bool isDefined = false;
  Map address = {};
  List places = [];

  List addressFavorites = globals.hiveBox.get('addressFavorites') ?? [];

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
        message: AppLocalizations.of(context)!.undefined_address_or_label,
        context: context,
        textColor: mainColor(context),
        textStyle: snackBarText,
        duration: const Duration(milliseconds: 4000),
        backgroundColor: const Color(0xff272727),
      );
    return;
    }
    List list = globals.hiveBox.get('addressFavorites');
    var newAddress = {
        'id': address['id'],
        'name': address['name'],
        'alias': widget.predefineType == '' 
            ? label
            : widget.predefineType,
      };
    if(widget.id != '') {
      list[int.parse(widget.id)] = newAddress;
    } else {
      list.add(newAddress);
      globals.hiveBox.put('addressFavorites', list);
    }
    Navigator.pop(context);
    RouteStateScope.of(context).go('/home');
    FloatingSnackBar(
      message: widget.id == '' ? AppLocalizations.of(context)!.new_address_added : AppLocalizations.of(context)!.address_modified,
      context: context,
      textColor: mainColor(context),
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
    );
  }

  Future<void> _getPlaces() async {
    flag++;

    setState(() {
      isLoading = true;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getPlaces(search, globals.locationData, flag);

    if (mounted) {
      setState(() {
        error = result['status'];
      });
      
      if (result['value']?['flag'] == flag && result['value']?['places'] != null) {
        setState(() {
          places = result['value']?['places'];
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if(widget.id != '') {
      queryController = TextEditingController(text: addressFavorites[int.parse(widget.id)]['name']);
      search = addressFavorites[int.parse(widget.id)]['name'];
      _getPlaces();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(queryFieldNode); 
      _getPlaces();
    });
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
          widget.id != '' ? AppLocalizations.of(context)!.edit_your_address : AppLocalizations.of(context)!.new_address,
          style: appBarTitle,
        ),
        actions: [
          IconButton(
            icon: Icon(
              NavikaIcons.save,
              color: isDefined && label != ''
                ? Theme.of(context).colorScheme.onSurface
                : routeBhColor(context),),
            tooltip: AppLocalizations.of(context)!.add_to_favorites,
            onPressed: () {
              handleSaveAddress();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (!['work', 'home'].contains(widget.predefineType))
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
                    decoration: InputDecoration(hintText: AppLocalizations.of(context)!.label),
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
                    decoration: InputDecoration( 
                      hintText: AppLocalizations.of(context)!.add_address
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
                  if (error != ApiStatus.ok)
                    ErrorBlock(
                      error: error,
                      retry: _getPlaces
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
