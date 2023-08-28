import 'dart:io';

import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:navika/src/widgets/lines/pdf_map.dart';
import 'package:navika/src/widgets/utils/button_large.dart';
import 'package:navika/src/widgets/utils/button_large_trafic.dart';
import 'package:path_provider/path_provider.dart';

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

Future<void> downloadFile(directory, name, url) async {
  File file = await File('${directory.path}/dir/$name').create(recursive: true);

  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    await file.writeAsBytes(response.bodyBytes);
    print({'INFO_', 'saved', name});
  }
}

Future saveData(line) async {
    globals.hiveBox.put('lines_${line['id']}', line);

    Directory directory = await getApplicationDocumentsDirectory();

    Directory('${directory.path}/dir')
        .create(recursive: true)
        .then((Directory directory) {
      print('Path of New Dir: ${directory.path}');
    });

    for (var timetable in line['timetables']['timetables']) {
      String url = timetable['url'];
      Uri uri = Uri.parse(url);
      String name = uri.pathSegments.last;
      await downloadFile(directory, name, timetable['url']);
    }
    for (var timetable in line['timetables']['map']) {
      String url = timetable['url'];
      Uri uri = Uri.parse(url);
      String name = uri.pathSegments.last;
      await downloadFile(directory, name, timetable['url']);
    }
  }

  void addLineToFavorite(line, context, Function? update) {
    List list = globals.hiveBox.get('linesFavorites');

    if (isFavoriteLine(line['id'])) {
      list.removeWhere((element) => element['id'] == line['id']);
      globals.hiveBox.put('linesFavorites', list);
      globals.hiveBox.put('lines_${line['id']}', null);

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

      saveData(line);

      FloatingSnackBar(
        message:
            'Favoris ajouté, les détails de cette ligne sont disponibles même hors connexion.',
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

List<Widget> getTimeTableWidgets(Map line, context, fromlocaldata) {
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
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          if (fromlocaldata) {
            Uri uri = Uri.parse(line['timetables']['timetables'][0]['url']);
            Directory directory = await getApplicationDocumentsDirectory();
            String name = uri.pathSegments.last;
            globals.pdfUrl = '${directory.path}/dir/$name';
          } else {
            globals.pdfUrl = line['timetables']['timetables'][0]['url'];
          }
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
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            if (fromlocaldata) {
              Uri uri = Uri.parse(timetable['url']);
              Directory directory = await getApplicationDocumentsDirectory();
              String name = uri.pathSegments.last;
              globals.pdfUrl = '${directory.path}/dir/$name';
            } else {
              globals.pdfUrl = timetable['url'];
            }
            globals.pdfTitle = 'Ligne ${line['name']}';
            RouteStateScope.of(context).go('/pdf');
          },
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
  bool fromlocaldata = false;

  Map line = {};
  ApiStatus error = ApiStatus.ok;
  bool _isFavorite = false;

  void update() {
    setState(() {
      _isFavorite = isFavoriteLine(line['id']);
    });
    if (_isFavorite) {
      saveData(line);
    }
  }

  Future<void> _getLine() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getLine(widget.routeId);

    setState(() {
      error = result['status'];
    });

    if (mounted && result['status'] == ApiStatus.ok) {
      setState(() {
        if (result['value']?['line'] != null) {
          line = result['value']?['line'];
        }
        isLoading = false;
      });
    } else if (isFavoriteLine(widget.routeId) && (result['status'] == ApiStatus.socketException || result['status'] == ApiStatus.timeoutException)) {
      setState(() {
        line = globals.hiveBox.get('lines_${widget.routeId}');
        isLoading = false;
        fromlocaldata = true;
        error = ApiStatus.ok;
      });
    }

    if (isFavoriteLine(line['id'])) {
      globals.hiveBox.put('lines_${line['id']}', line);
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
                      isLocalData: fromlocaldata,
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
                  if (!fromlocaldata)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: ButtonLargeTrafic(
                        line: line,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          globals.lineTrafic = line;
                          RouteStateScope.of(context).go('/trafic/details');
                        },
                      ),
                    ),
                  ...getTimeTableWidgets(line, context, fromlocaldata),
                  if (_isFavorite)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        height: 65,
                        decoration: BoxDecoration(
                          color: getSlugColor(0, 1).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(NavikaIcons.saved,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  size: 25),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  'Données disponible hors connexion',
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Segoe Ui',
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              )
          ],
        ),
      );
}
