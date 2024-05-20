// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';

class BikeBody extends StatelessWidget {
  final double padding;
  final ScrollController scrollController;
  final dynamic data;

  const BikeBody({
    required this.padding,
    required this.scrollController,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          controller: scrollController,
          padding: EdgeInsets.only(top: padding),
          children: [
            
              
            if (data['capacity']['total'] != null)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.bike_park,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: getParkBike(context),
                      ),
                      child: Row(
                        children: [
                          Icon(NavikaIcons.parking, color: Theme.of(context).colorScheme.onSurface, size: 25),
                          Container(
                            width: 30,
                            margin: const EdgeInsets.only(left: 7, bottom: 2),
                            child: Text(
                              data['capacity']['total'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: fontFamily,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
            if (data['capacity']['bike'] != null)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.bike_available,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xffb7dcae)),
                      child: Row(
                        children: [
                          Icon(NavikaIcons.bike, color: Theme.of(context).colorScheme.onSurface, size: 25),
                          Container(
                            width: 30,
                            margin: const EdgeInsets.only(left: 7, bottom: 2),
                            child: Text(
                              data['capacity']['bike'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: fontFamily,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
            if (data['capacity']['mechanical'] != null)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.bike_mechanical,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: getMechanicalBike(context),
                      ),
                      child: Row(
                        children: [
                          Icon(NavikaIcons.bike, color: Theme.of(context).colorScheme.onSurface, size: 25),
                          Container(
                            width: 30,
                            margin: const EdgeInsets.only(left: 7, bottom: 2),
                            child: Text(
                              data['capacity']['mechanical'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: fontFamily,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
            if (data['capacity']['ebike'] != null)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.bike_ebike,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontFamily,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: getElecBike(context),
                      ),
                      child: Row(
                        children: [
                          Icon(NavikaIcons.ebike, color: Theme.of(context).colorScheme.onSurface, size: 25),
                          Container(
                            width: 30,
                            margin: const EdgeInsets.only(left: 7, bottom: 2),
                            child: Text(
                              data['capacity']['ebike'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: fontFamily,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
    }
    return Container();
  }
}
