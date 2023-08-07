import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:navika/src/widgets/lines/pdf_map.dart';
import 'package:navika/src/widgets/utils/button_large.dart';
import 'package:navika/src/widgets/utils/button_large_trafic.dart';

bool isFavoriteLine(id) {
  List favs = globals.hiveBox?.get('linesFavorites') ?? [];

  if (favs.isNotEmpty) {
    for (var fav in favs) {
      if (fav['id'] == id) {
        return true;
      }
    }
  }
  return false;
}

void addLineToFavorite(line, context, Function? update) {
  List list = globals.hiveBox.get('linesFavorites');

  if (isFavoriteLine(line['id'])) {
    list.removeWhere((element) => element['id'] == line['id']);
    globals.hiveBox.put('linesFavorites', list);

    FloatingSnackBar(
      message: 'Favoris retiré.',
      context: context,
      textColor: mainColor(context),
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
    );
  } else {
    list.add({
      'id': line['id'],
      'code': line['code'],
      'name': line['name'],
      'mode': line['mode'],
      'color': line['color'],
      'text_color': line['text_color'],
      'agency': line['agency'],
    });
    globals.hiveBox.put('linesFavorites', list);
    //RouteStateScope.of(context).go('/schedules');
    FloatingSnackBar(
      message: 'Favoris ajouté.',
      context: context,
      textColor: mainColor(context),
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
    );
  }
  if (update != null) update();
  return;
}

String getTerminus(line) {
  String res = '';

  for (var i = 0; i < line['terminus'].length; i++) {
    if (i == 0) {
      res = '$res${line['terminus'][i]['name']}';
    } else {
      res = '$res  •  ${line['terminus'][i]['name']}';
    }
  }

  return res;
}

String? getMapUrl(Map line) {
  try {
    if (line['timetables']['map'][0]['url'] != null) {
      return line['timetables']['map'][0]['url'];
    }
    return null;
  } catch (e) {
    return null;
  }
}

List<Widget> getTimeTableWidgets(Map line, context) {
  List<Widget> res = [];

  res.add(const SizedBox(height: 15));

  if (line['timetables']['timetables'].length == 1) {
    res.add(Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ButtonLarge(
        icon: NavikaIcons.clock,
        text: 'Fiche horaire',
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          globals.pdfUrl = line['timetables']['timetables'][0]['url'];
          globals.pdfTitle = 'Ligne ${line['name']}';
          RouteStateScope.of(context).go('/pdf');
        },
      ),
    ));
  } else if (line['timetables']['timetables'].length > 2) {
    for (var timetable in line['timetables']['timetables']) {
      res.add(Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ButtonLarge(
        icon: NavikaIcons.clock,
        text: timetable['name'],
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
        borderRadius: BorderRadius.circular(15),
        onTap: () {},
      ),
    ));
    }
  }

  return res;
}

class RoutesDetails extends StatefulWidget {
  final String routeId;

  const RoutesDetails({required this.routeId, super.key});

  @override
  State<RoutesDetails> createState() => _RoutesDetailsState();
}

class _RoutesDetailsState extends State<RoutesDetails>
    with SingleTickerProviderStateMixin {
  bool isLoading = true;
  Map line = {};
  ApiStatus error = ApiStatus.ok;
  bool _isFavorite = false;

  void update() {
    setState(() {
      _isFavorite = isFavoriteLine(line['id']);
    });
  }

  Future<void> _getLine() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getLine(widget.routeId);

    setState(() {
      error = result['status'];
    });

    if (mounted) {
      setState(() {
        if (result['value']?['line'] != null) {
          line = result['value']?['line'];
        }
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getLine();
      update();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: getNavigationBar(context),
        appBar: AppBar(
          title: isLoading
          ? const Text('Lignes', style: appBarTitle)
          : Text('Ligne ${line['name']}', style: appBarTitle),
          actions: [
            IconButton(
              icon: _isFavorite
                  ? const Icon(NavikaIcons.star_filled)
                  : const Icon(NavikaIcons.star),
              tooltip: 'Ajouter aux favoris',
              onPressed: () => addLineToFavorite(line, context, update),
            ),
          ],
        ),
        body: ListView(
          children: [
            if (error != ApiStatus.ok)
              ErrorBlock(
                error: error,
              )
            else if (isLoading)
              const LinearProgressIndicator()
            else
              Column(
                children: [
                  if (getMapUrl(line) != null)
                    PDFMap(
                      url: getMapUrl(line)!,
                      size: 200,
                    )
                  else
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                        ),
                        child: Row(children: [
                          Icones(
                            line: line,
                            i: 0,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Text(
                            getTerminus(line),
                            style: TextStyle(
                                fontFamily: 'Segoe Ui',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: HexColor.fromHex(line['color'])),
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ))
                        ])),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: ButtonLargeTrafic(
                      line: line,
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        globals.lineTrafic = line;
                        RouteStateScope.of(context).go('/trafic/details');
                      },
                    ),
                  ),
                  ...getTimeTableWidgets(line, context),
                ],
              )
          ],
        ),
      );
}
