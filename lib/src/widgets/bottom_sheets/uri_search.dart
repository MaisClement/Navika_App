import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/journeys_details.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/journey_recurrent.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/places/listbutton.dart';
import 'package:navika/src/widgets/places/load.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';
import 'package:navika/src/widgets/utils/radio_tiles.dart';

class BottomAddressSearch extends StatefulWidget {
  final String query;

  const BottomAddressSearch({
    required this.query,
    super.key,
  });

  @override
  State<BottomAddressSearch> createState() => _BottomAddressSearchState();
}

class _BottomAddressSearchState extends State<BottomAddressSearch> with SingleTickerProviderStateMixin {
  
  bool isLoading = true;
  ApiStatus error = ApiStatus.ok;
  List places = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async => await _getPlaces());
  }

  Future<void> _getPlaces() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getPlaces(widget.query, globals.locationData, 0);

    if (mounted) {
      setState(() {
        error = result['status'];
      });

      setState(() {
        places = result['value']?['places'];
        isLoading = false;
      });
    }
  }

  @override
    Widget build(BuildContext context) => SingleChildScrollView(
    child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: accentColor(context).withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2),
              )
            ]),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Où allons nous ?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe Ui',
                        color: accentColor(context),
                      ),
                    ),
                    Divider(
                      color: accentColor(context),
                    ),
            
                    // Places
                    if (error != ApiStatus.ok)
                      ErrorBlock(
                        error: error,
                        retry: _getPlaces,
                      )
                    else if (places.isNotEmpty)
                      for (var place in places)
                        PlacesListButton(
                          isLoading: isLoading,
                          place: place,
                          onTap: () {
                            Navigator.pop(context);
                            RouteStateScope.of(context).go('/address/${place['coord']['lon']};${place['coord']['lat']}');
                          },
                        )
                        
                    
                    else if (places.isEmpty && isLoading == true)
                      PlacesLoad()
                    else
                      PlacesEmpty()
            
                  ],
              ),
            ),
            Center(
              child: IconElevatedButton(
                icon: NavikaIcons.cancel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: const Color(0xffffffff),
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                text: 'Annuler',
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        )),
  );
}

