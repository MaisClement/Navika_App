import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/widgets/favorites/departures.dart';
import 'package:navika/src/widgets/favorites/schedules.dart';
import '../../data/global.dart' as globals;
import '../../routing.dart';
import '../bottom_sheets/remove_favorite.dart';

class FavoriteBody extends StatefulWidget {
  final String id;
  final String name;
  final List modes;
  final String line;
  final Function update;
  final bool removeSeparator;

  const FavoriteBody(
      {required this.id,
      required this.name,
      required this.line,
      required this.modes,
      required this.update,
      this.removeSeparator = false,
      super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody>
    with SingleTickerProviderStateMixin {
  List schedules = [];
  String mode = '';
  String error = '';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getSchedules();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Future<void> _getSchedules() async {
    try {
      if (mounted) {
        final response = await http.get(Uri.parse(
            '${globals.API_SCHEDULES_LINE}?s=${widget.id}&l=${widget.line}'));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          if (mounted) {
            setState(() {
              mode = data['mode'];
              if (mode == 'rail') {
                schedules = data['departures'];
              } else {
                schedules = data['schedules'];
              }
              error = "";
            });
          }
        } else {
          setState(() {
            error = "Récupération des informations impossible.";
          });
        }
      }
      _timer = Timer(const Duration(seconds: 60), () {
        _getSchedules();
      });
    } on Exception catch (_) {
      setState(() {
        error = "Une erreur s'est produite.";
      });
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!widget.removeSeparator)
            Divider(
              height: 5,
              thickness: 5,
              color: Colors.grey[300],
            ),
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
            child: GestureDetector(
              onTap: () {
                globals.schedulesStopArea = widget.id;
                globals.schedulesStopName = widget.name;
                globals.schedulesStopModes = widget.modes;
                RouteStateScope.of(context).go('/schedules/stops/${widget.id}');
              },
              child: Row(
                children: [
                  Icon(ScaffoldIcon.train_2,
                      color: Theme.of(context).colorScheme.primary, size: 25),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe Ui',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    tooltip: 'Supprimer ce favori',
                    onPressed: () {
                      showModalBottomSheet<void>(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) =>
                              BottomRemoveFavorite(
                                  id: widget.id,
                                  name: widget.name,
                                  line: widget.line,
                                  update: widget.update));
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          if (error != '')
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 15),
                    SvgPicture.asset(
                      'assets/cancel.svg',
                      color: Colors.grey[600],
                      height: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        error,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Segoe Ui',
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            )
          else if (mode == '' && schedules.isEmpty)
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: const SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircularProgressIndicator(),
              ),
            )
          else if (mode == 'rail')
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 0, bottom: 10),
              child: FavoriteDepartures(
                  id: widget.id,
                  name: widget.name,
                  modes: widget.modes,
                  schedules: schedules,
                  update: widget.update),
            )
          else
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 0, bottom: 10),
              child: FavoriteSchedules(
                  id: widget.id,
                  name: widget.name,
                  modes: widget.modes,
                  schedules: schedules,
                  update: widget.update),
            )
        ],
      );
}
