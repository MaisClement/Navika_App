import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style/style.dart';

import 'package:navika/src/routing.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/lines/listbutton.dart';
import 'package:navika/src/widgets/utils/icon_elevated.dart';
import 'package:navika/src/widgets/utils/search_box.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  final String title = 'Lignes';

  List favs = globals.hiveBox?.get('linesFavorites');
  void updateFavorites() {
    setState(() {
      favs = globals.hiveBox.get('linesFavorites');
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: appBarTitle),
              const SizedBox(
                height: 10,
              ),
              SearchBox(
                  onTap: () {
                    RouteStateScope.of(context).go('/routes/search');
                  },
                  icon: NavikaIcons.search,
                  text: 'Rechercher une ligne'),
            ],
          ),
        ),
        body: ListView(
          children: [
            if (favs.isEmpty)
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage(
                        'assets/img/lines.png',
                      ),
                      width: 80,
                    ),
                    const Text(
                      'Ajoutez vos lignes à vos favoris pour y accéder encore plus rapidement.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe Ui',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IconElevatedButton(
                      icon: NavikaIcons.search,
                      width: 138,
                      text: 'Rechercher',
                      onPressed: () {
                        RouteStateScope.of(context).go('/routes/search');
                      },
                    ),
                  ],
                ),
              )
            else
              for (var fav in favs)
                LinesListButton(
                isLoading: false,
                line: fav,
                onTap: () {
                  RouteStateScope.of(context).go('/routes/details/${fav['id']}');
                },
              )              
          ],
        ),
      );
}
