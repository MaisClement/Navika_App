// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/places/listbutton.dart';

class AddressBody extends StatelessWidget {
  final double padding;
  final ScrollController scrollController;
  final dynamic data;

  const AddressBody({
    required this.padding,
    required this.scrollController,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return ListView(
        controller: scrollController,
        padding: EdgeInsets.only(top: padding),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
            child: Text(
              AppLocalizations.of(context)!.nearby,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamily,
                color: accentColor(context),
              ),
            ),
          ),
          if (data['near_stops'] != null && data['near_stops'].isNotEmpty)
            for (var place in data['near_stops'])
              PlacesListButton(
                isLoading: false,
                place: place,
                onTap: () {
                  RouteStateScope.of(context).go('/stops/${place['id']}');
                },
              )
        ],
      );
    }
    return Container();
  }
}
