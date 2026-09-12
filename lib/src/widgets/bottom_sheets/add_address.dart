// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';

class BottomAddAddress extends StatefulWidget {
  final Map address;

  const BottomAddAddress({
    required this.address,
    super.key,
  });

  @override
  State<BottomAddAddress> createState() => _BottomAddAddressState();
}

class _BottomAddAddressState extends State<BottomAddAddress> with SingleTickerProviderStateMixin {
  TextEditingController textController = TextEditingController();
  FocusNode textFieldNode = FocusNode();
  late String label;

  String icon = 'home';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(textFieldNode);
      label = widget.address['name'];
      textController.text = widget.address['name'];
    });
  }

  void saveAdress() {
    List list = globals.hiveBox.get('savedAddress');
    var newAddress = {
      'id': widget.address['id'],
      'name': widget.address['name'],
      'coord': {
        'lat': widget.address['coord']['lat'],
        'lon': widget.address['coord']['lon'],
      },
      'label': label,
      'icon': icon,
    };
    list.add(newAddress);
    globals.hiveBox.put('savedAddress', list);

    floatingSnackBar(
      message: AppLocalizations.of(context)!.new_address_added,
      context: context,
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: mainColor(context),
    );

    Navigator.pop(context);
    RouteStateScope.of(context).go('/home');
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)), boxShadow: [
            BoxShadow(
              color: accentColor(context).withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ]),
          child: Container(
            padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.new_address,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: fontFamily,
                    color: accentColor(context),
                  ),
                ),
                Divider(
                  color: accentColor(context),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  const Icon(NavikaIcons.star),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      focusNode: textFieldNode,
                      decoration: InputDecoration(hintText: AppLocalizations.of(context)!.label),
                      onChanged: (text) {
                        setState(() {
                          label = text;
                        });
                      },
                    ),
                  )
                ]),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppLocalizations.of(context)!.choose_icon_address,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontFamily: fontFamily,
                    color: accentColor(context),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RadioTiles(
                  tiles: const [
                    {'value': 'home', 'icon': NavikaIcons.home},
                    {'value': 'work', 'icon': NavikaIcons.business},
                    {'value': 'university', 'icon': NavikaIcons.university},
                    {'value': 'city', 'icon': NavikaIcons.city},
                    {'value': 'finishFlag', 'icon': NavikaIcons.finishFlag},
                    {'value': 'star', 'icon': NavikaIcons.star},
                    {'value': 'hearts', 'icon': NavikaIcons.hearts},
                  ],
                  value: icon,
                  onTileChange: (value) {
                    setState(() {
                      icon = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: IconElevatedButton(
                    icon: NavikaIcons.save,
                    text: AppLocalizations.of(context)!.add_to_favorites,
                    onPressed: saveAdress,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context)!.cancel),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
