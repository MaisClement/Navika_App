import 'package:flutter/material.dart';

import 'package:navika/src/data/lines.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/screens/routes_details.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/icons/lines.dart';
import 'package:navika/src/widgets/trafic_details/disruptions.dart';
import 'package:navika/src/widgets/trafic_details/works.dart';

class TraficDetails extends StatefulWidget {
  const TraficDetails({super.key});

  @override
  State<TraficDetails> createState() => _TraficDetailsState();
}

class _TraficDetailsState extends State<TraficDetails> {

  bool _isFavorite = isFavoriteLine( globals.lineTrafic['id'] );

  void update() {
    setState(() {
      _isFavorite = isFavoriteLine( globals.lineTrafic['id'] );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: getNavigationBar(context),
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Info Trafic', style: appBarTitle),
              if (LINES.getLinesById(globals.lineTrafic['id']).libelle != '')
                Text(LINES.getLinesById(globals.lineTrafic['id']).libelle, style: appBarSubtitle),
            ],
          ),
          actions: [
            IconButton(
              icon: _isFavorite
                  ? const Icon(NavikaIcons.star_filled)
                  : const Icon(NavikaIcons.star),
              tooltip: 'Ajouter aux favoris',
              onPressed: () => addLineToFavorite(globals.lineTrafic, context, update),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          width: double.infinity,
          child: ListView(
            children: [
// Head
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        margin: const EdgeInsets.all(15.0),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 3.0,
                            color: getSlug(globals.lineTrafic['severity'], 1),
                          ),
                        ),
                        child: LinesIcones(
                          line: globals.lineTrafic,
                          removeMargin: true,
                          size: 30,
                        ),
                      ),
                      Positioned(
                        width: 20,
                        height: 20,
                        top: 43,
                        left: 43,
                        child:
                            Image(image: getSlugImage(globals.lineTrafic['severity'], 1)),
                      )
                    ],
                  ),
                  Text(getSlugTitle(globals.lineTrafic['severity']),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20)),
                ],
              ),

// CTRAFIC
              if (globals.lineTrafic['reports'] != null)
                TraficDisruptions(
                  reports: globals.lineTrafic['reports'],
                ),

// FWORK
              if (globals.lineTrafic['reports'] != null && globals.lineTrafic['reports']!['future_work'].length > 0)
                TraficWorks(
                  reports: globals.lineTrafic['reports'],
                ),
            ],
          ),
        ),
      );
}
