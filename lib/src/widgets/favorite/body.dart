import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navika/src/icons/Scaffold_icon_icons.dart';
import 'package:navika/src/widgets/departures/block.dart';
import 'package:navika/src/screens/schedules_details.dart';
import 'package:navika/src/widgets/favorite/departures.dart';
import 'package:navika/src/widgets/favorite/schedules.dart';
import '../../data/global.dart' as globals;
import '../bottom_remove_favorite.dart';

class FavoriteBody extends StatefulWidget {
  final String id;
  final String name;
  final String line;

  const FavoriteBody({
    required this.id,
    required this.name,
    required this.line,
    super.key
  });

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody>
    with SingleTickerProviderStateMixin {

  List schedules = [];
  String mode = '';

  @override
	void initState() {
		super.initState();
    print({'INFO_d', globals.schedulesStopArea});

    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await _getSchedules();
    });
	}

  Future<void> _getSchedules() async {
    print({'INFO_', globals.schedulesStopArea});
    try {
      final response = await http.get(Uri.parse('${globals.API_SCHEDULES_LINE}?s=${widget.id}&l=${widget.line}'));

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
          });
        }
      }
    } on Exception catch (_) {
      print('OULA PAS CONTENT');
    }
  }

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.grey[300],
    child: Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.only(left:10, right: 10, top: 10, bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontFamily: 'Segoe Ui',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                tooltip: 'Ajouter aux favoris',
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
                      ));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 5
          ),

          if (mode == '' && schedules.isEmpty)
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: const SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircularProgressIndicator(),
              ),
            )

          else
            if (mode == 'rail')
              FavoriteDepartures(
                schedules: schedules
              )

            else
              FavoriteSchedules(
                schedules: schedules
              )
        ],
      ),
    )
  );
}