// 🎯 Dart imports:
import 'dart:io';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/bottom_sheets/notifications.dart';
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

Future<void> downloadFile(directory, name, url) async {
  File file = await File('${directory.path}/dir/$name').create(recursive: true);

  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    await file.writeAsBytes(response.bodyBytes);
    if (kDebugMode) {
      print({'INFO_', 'saved', name});
    }
  }
}

Future saveData(line) async {
    globals.hiveBox.put('lines_${line['id']}', line);

    Directory directory = await getApplicationDocumentsDirectory();

    Directory('${directory.path}/dir')
        .create(recursive: true)
        .then((Directory directory) {
      });

    for (var timetable in line['timetables']) {
      String url = timetable['url'];
      Uri uri = Uri.parse(url);
      String name = uri.pathSegments.last;
      await downloadFile(directory, name, timetable['url']);
    }
    for (var timetable in line['map']) {
      String url = timetable['url'];
      Uri uri = Uri.parse(url);
      String name = uri.pathSegments.last;
      await downloadFile(directory, name, timetable['url']);
    }
  }

Future<void> addLineToFavorite(line, context, Function? update) async {
  List list = globals.hiveBox.get('linesFavorites');

  if (isFavoriteLine(line['id'])) {
    list.removeWhere((element) => element['id'] == line['id']);
    globals.hiveBox.put('linesFavorites', list);
    globals.hiveBox.put('lines_${line['id']}', null);

    FloatingSnackBar(
      message: AppLocalizations.of(context)!.favorite_removed,
      context: context,
      textColor: mainColor(context),
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
    );

    await unsubscribe(line, context);

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
      message: 'Favoris ajouté, les détails de cette ligne sont disponibles même hors connexion.',
      context: context,
      textColor: mainColor(context),
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
    );

    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: bottomSheetBorder,
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => NotificationsSettings(line: line)
    );
  }
  if (update != null) update();
  return;
}

void addNotification(line, isAlert, context) {
  showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: bottomSheetBorder,
    ),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) => NotificationsSettings(line: line, isAlert: isAlert)
  );
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
    if (line['map'][0]['url'] != null) {
      return line['map'][0]['url'];
    }
    return null;
  } catch (e) {
    return null;
  }
}

List<Widget> getTimeTableWidgets(Map line, context, fromlocaldata) {
  List<Widget> res = [];

  res.add(const SizedBox(height: 5));

  if (line['timetables'] != null && line['timetables'].length == 1) {
    res.add(Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ButtonLarge(
        icon: NavikaIcons.clock,
        text: AppLocalizations.of(context)!.timetable_sheet,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          if (fromlocaldata) {
            Uri uri = Uri.parse(line['timetables'][0]['url']);
            Directory directory = await getApplicationDocumentsDirectory();
            String name = uri.pathSegments.last;
            globals.pdfUrl = '${directory.path}/dir/$name';
          } else {
            globals.pdfUrl = line['timetables'][0]['url'];
          }
          globals.pdfTitle = 'Ligne ${line['name']}';
          RouteStateScope.of(context).go('/pdf');
        },
      ),
    ));
  } else if (line['timetables'] != null) {
    for (var timetable in line['timetables']) {
      res.add(Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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

List<Widget> getStops(Map line, context) {
  List<Widget> res = [];

  for (var i = 0; i < line['stops'].length; i++) {
    res.add(
      InkWell(
        onTap: () {
          RouteStateScope.of(context).go('/routes/details/${line['id']}/schedules/${line['stops'][i]['id']}');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const SizedBox(
                width: 10,
              ),
      
// Route schema
              if (i == 0 || i == (line['stops'].length -1))
                Container(
                  margin: i == 0
                      ? const EdgeInsets.only(top: 7)
                      : const EdgeInsets.only(bottom: 5),
                  height: i == 0
                      ? 45
                      : 17,
                  width: 10,
                  decoration: BoxDecoration(
                    color: HexColor.fromHex(line['color']),
                    borderRadius: i == 0
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7),
                          )
                        : const BorderRadius.only(
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          ),
                  ),
                  child: Container(
                    margin: i == 0
                        ? const EdgeInsets.only(
                            top: 1, bottom: 36, left: 1, right: 1)
                        : const EdgeInsets.only(
                            top: 8, bottom: 1, left: 1, right: 1),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )
              else
                Container(
                  height: 50,
                  width: 10,
                  color: HexColor.fromHex(line['color']),
                  child: Container(
                    margin: const EdgeInsets.only( top: 8, bottom: 34, left: 1, right: 1 ),
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),

// Name
              Padding(
                padding: const EdgeInsets.only(top:1.5, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      line['stops'][i]['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: fontFamily,
                      ),
                    ),                    
                  ],
                ),
              ),
            ],
          ),       
      )
    );
  }

  res.add(
    const Divider(
      color: Color(0xff808080),
      thickness: 1.5,
      indent: 20,
      endIndent: 20,
    ),
  );

  return res;
}

class RoutesDetails extends StatefulWidget {
  final String routeId;

  const RoutesDetails({required this.routeId, super.key});

  @override
  State<RoutesDetails> createState() => _RoutesDetailsState();
}

class _RoutesDetailsState extends State<RoutesDetails> with SingleTickerProviderStateMixin {
  bool isLoading = true;
  bool fromlocaldata = false;

  Map line = {};
  ApiStatus error = ApiStatus.ok;
  bool _isFavorite = false;
  bool _isAlert = false;

  bool blockScroll = false;

  void setBlockScroll(value) {
    setState(() {
      blockScroll = value;
    });
  }

  void update() {
    setState(() {
      _isFavorite = isFavoriteLine(line['id']);
      _isAlert = isAlertLine(line['id']);
    });
    if (_isFavorite) {
      saveData(line);
    }
  }

  Future<void> _getLine() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getLine(widget.routeId);

    if (mounted) {
      setState(() {
        error = result['status'];
      });
      
      if (isFavoriteLine(widget.routeId) && (result['status'] == ApiStatus.socketException || result['status'] == ApiStatus.timeoutException)) {
        setState(() {
          line = globals.hiveBox.get('lines_${widget.routeId}');
          isLoading = false;
          fromlocaldata = true;
          error = ApiStatus.ok;
        });
        
      } else if (result['value']?['line'] != null && result['status'] == ApiStatus.ok) {
        setState(() {
          line = result['value']?['line'];
          isLoading = false;
        });
        
        if (isFavoriteLine(line['id'])) {
          globals.hiveBox.put('lines_${line['id']}', line);
        }
      }
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
            ? Text(AppLocalizations.of(context)!.lines, style: appBarTitle)
            : Text('Ligne ${line['name']}', style: appBarTitle),
          actions: [
            if (!isLoading && _isFavorite) 
              IconButton(
                icon: _isAlert
                    ? const Icon(NavikaIcons.bellFilled)
                    : const Icon(NavikaIcons.bellAdd),
                tooltip: AppLocalizations.of(context)!.notifications,
                onPressed: () => addNotification(line, _isAlert, context),
              ),
            if (!isLoading)
              IconButton(
                icon: _isFavorite
                  ? const Icon(NavikaIcons.starFilled)
                  : const Icon(NavikaIcons.star),
                tooltip: AppLocalizations.of(context)!.add_to_favorites,
                onPressed: () => addLineToFavorite(line, context, update),
              ),
          ],
        ),
        body: ListView(
          physics: blockScroll 
            ? const NeverScrollableScrollPhysics()
            : const ScrollPhysics(),  
          children: [
            if (error != ApiStatus.ok)
              ErrorBlock(
                error: error,
                retry: _getLine
              )
            else if (isLoading)
              const LinearProgressIndicator()
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (getMapUrl(line) != null)
                    PDFMap(
                      url: getMapUrl(line)!,
                      isLocalData: fromlocaldata,
                      setBlockScroll: setBlockScroll,
                      height: 200,
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
                                fontFamily: fontFamily,
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
                      padding:const EdgeInsets.only(top: 10, left: 10, right: 10),
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

                  const Divider(
                    color: Color(0xff808080),
                    thickness: 1.5,
                    indent: 20,
                    endIndent: 20,
                  ),
                  
                  ...getStops(line, context),

                  if (_isFavorite)
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        height: 65,
                        decoration: BoxDecoration(
                          color: getSlugColor(0, true).withOpacity(0.2),
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
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.offline_data_available,
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: fontFamily,
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
