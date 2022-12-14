import 'package:flutter/material.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/widgets/bottom_sheets/remove_address.dart';
import 'package:navika/src/widgets/home/fav_button.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/places/listbutton.dart';

int getAddressPos(list, id) {
  if (list.isNotEmpty) {
    var i = 0;
    for (var fav in list) {
      if (fav['type'] == id) {
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
              name: 'Maison',
              img: ScaffoldIcon.home_regular,
              onTap: () {
                globals.route['dep']['name'] = null;
                globals.route['dep']['id'] = null;
                globals.route['arr']['name'] =
                    address[getAddressPos(address, 'home')]['name'];
                globals.route['arr']['id'] =
                    address[getAddressPos(address, 'home')]['id'];
                RouteStateScope.of(context).go('/home/journeys');
              },
              onLongPress: () {
                showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) => BottomRemoveAddress(
                    id: address[getAddressPos(address, 'home')]['id'],
                  ),
                );
              },
            )
          else
            FavButton(
                name: 'Non défini',
                img: ScaffoldIcon.home_regular,
                onTap: () {
                  RouteStateScope.of(context).go('/home/address/home');
                },
                onLongPress: () {}),

// Travail
          if (getAddressPos(address, 'work') != -1)
            FavButton(
              name: 'Travail',
              img: ScaffoldIcon.bussines,
              onTap: () {
                globals.route['dep']['name'] = null;
                globals.route['dep']['id'] = null;
                globals.route['arr']['name'] =
                    address[getAddressPos(address, 'work')]['name'];
                globals.route['arr']['id'] =
                    address[getAddressPos(address, 'work')]['id'];
                RouteStateScope.of(context).go('/home/journeys');
              },
              onLongPress: () {
                showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) => BottomRemoveAddress(
                    id: address[getAddressPos(address, 'work')]['id'],
                  ),
                );
              },
            )
          else
            FavButton(
                name: 'Non défini',
                img: ScaffoldIcon.bussines,
                onTap: () {
                  RouteStateScope.of(context).go('/home/address/work');
                },
                onLongPress: () {},),

// Le reste
          for (var fav in address)
            if (fav['type'] != 'home' && fav['type'] != 'work')
              FavButton(
                name: fav['name'],
                img: getPlaceIcon(fav['type']),
                onTap: () {
                  globals.route['dep']['name'] = null;
                  globals.route['dep']['id'] = null;
                  globals.route['arr']['name'] = fav['name'];
                  globals.route['arr']['id'] = fav['id'];
                  RouteStateScope.of(context).go('/home/journeys');
                },
                onLongPress: () {
                  showModalBottomSheet<void>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
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
              name: 'Ajouter',
              img: ScaffoldIcon.plus,
              onTap: () {
                RouteStateScope.of(context).go('/home/address');
              },
              onLongPress: () {}),
        ],
      );
}
