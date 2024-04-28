// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/bottom_sheets/remove_address.dart';
import 'package:navika/src/widgets/home/fav_button.dart';

int getAddressPos(list, id) {
  if (list.isNotEmpty) {
    var i = 0;
    for (var fav in list) {
      if (fav['alias'] == id) {
        return i;
      }
      i++;
    }
  }
  return -1;
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
// Maison
          if (getAddressPos(address, 'home') != -1)
            FavButton(
              name: AppLocalizations.of(context)!.home,
              img: NavikaIcons.home,
              onTap: () {
                initJourney(
                  null,
                  {
                    'name': address[getAddressPos(address, 'home')]['name'],
                    'id': address[getAddressPos(address, 'home')]['id']
                  },
                  context
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
                    id: address[getAddressPos(address, 'home')]['id'],
                    type: 'home',
                  ),
                );
              },
            )
          else
            FavButton(
              name: AppLocalizations.of(context)!.not_defined,
              img: NavikaIcons.home,
              onTap: () {
                RouteStateScope.of(context).go('/home/address/home');
              },
              onLongPress: () {}
            ),

// Travail
          if (getAddressPos(address, 'work') != -1)
            FavButton(
              name: AppLocalizations.of(context)!.work,
              img: NavikaIcons.business,
              onTap: () {
                initJourney(
                  null,
                  {
                    'name': address[getAddressPos(address, 'work')]['name'],
                    'id': address[getAddressPos(address, 'work')]['id']
                  },
                  context
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
                    id: address[getAddressPos(address, 'work')]['id'],
                    type: 'work',
                  ),
                );
              },
            )
          else
            FavButton(
                name: AppLocalizations.of(context)!.not_defined,
                img: NavikaIcons.business,
                onTap: () {
                  RouteStateScope.of(context).go('/home/address/work');
                },
                onLongPress: () {},),

// Le reste
          for (var fav in address)
            if (fav['alias'] != 'home' && fav['alias'] != 'work')
              FavButton(
                name: fav['alias'],
                img: NavikaIcons.star,
                onTap: () {
                  initJourney(
                    null,
                    {
                      'name': fav['name'],
                      'id': fav['id']
                    },
                    context
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
                      type: fav['alias'],
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
