// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/remove_address.dart';
import 'package:navika/src/widgets/home/fav_button.dart';

IconData getFavoriteIcon(String value) {
  switch (value) {
    case 'home':
      return NavikaIcons.home;
    case 'work':
      return NavikaIcons.business;
    case 'university':
      return NavikaIcons.university;
    case 'city':
      return NavikaIcons.city;
    case 'finishFlag':
      return NavikaIcons.finishFlag;
    case 'star':
      return NavikaIcons.star;
    case 'hearts':
      return NavikaIcons.hearts;
    default:
      return NavikaIcons.star;
  }
}

class HomeBodyFavScroll extends StatelessWidget {
  final List address;

  const HomeBodyFavScroll({
    required this.address,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (address.isEmpty)
            FavButton(
              name: AppLocalizations.of(context)!.not_defined,
              img: NavikaIcons.home,
              onTap: () {
                RouteStateScope.of(context).go('/home/address');
              },
              onLongPress: () {
                RouteStateScope.of(context).go('/home/address');
              },
            ),
          for (var fav in address)
            FavButton(
              name: fav['label'],
              img: getFavoriteIcon(fav['icon']),
              onTap: () {
                initJourney(
                  null,
                  {
                    'name': fav['name'],
                    'id': '${fav['id']}',
                  },
                  context,
                );
              },
              onLongPress: () {
                showModalBottomSheet<void>(
                  shape: const RoundedRectangleBorder(
                    borderRadius: bottomSheetBorder,
                  ),
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) => BottomRemoveAddress(
                    id: fav['id'],
                  ),
                );
              },
            ),
          FavButton(
              name: AppLocalizations.of(context)!.add,
              img: NavikaIcons.plus,
              onTap: () {
                RouteStateScope.of(context).go('/home/address');
              },
              onLongPress: () {}),
        ],
      );
}
