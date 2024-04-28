// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/journeys_details.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/error_block.dart';

class JourneysGet extends StatefulWidget {
  final String id;

  const JourneysGet({required this.id, super.key});

  @override
  State<JourneysGet> createState() => _JourneysGetState();
}

class _JourneysGetState extends State<JourneysGet> {
  ApiStatus error = ApiStatus.ok;

  Future<void> _getJourney() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getJourneyById(widget.id);

    Map journey = getSavedJourney(widget.id)!;
        
    if (mounted) {
      setState(() {
        error = result['status'];
      });

      if (result['status'] == ApiStatus.socketException || result['status'] == ApiStatus.timeoutException) {
        globals.route['from']['id'] = journey['sections'][0]['from']['id'];
        globals.route['from']['id'] = journey['sections'][0]['from']['name'];
        globals.route['to']['id'] = journey['sections'][journey['sections'].length - 1]['to']['id'];
        globals.route['to']['id'] = journey['sections'][journey['sections'].length - 1]['to']['name'];
        
        setState(() {
          globals.journey = journey;
          RouteStateScope.of(context).go('/home/journeys/details');
        });
      } else if (result['value']?['journey'] != null && result['status'] == ApiStatus.ok) {
        journey = result['value']?['journey'];

        globals.route['from']['id'] = journey['sections'][0]['from']['id'];
        globals.route['from']['id'] = journey['sections'][0]['from']['name'];
        globals.route['to']['id'] = journey['sections'][journey['sections'].length - 1]['to']['id'];
        globals.route['to']['id'] = journey['sections'][journey['sections'].length - 1]['to']['name'];

        setState(() {
          globals.journey = journey;
          RouteStateScope.of(context).go('/home/journeys/details');
        });
      } else {
        error = ApiStatus.unknownException;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getJourney();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: getNavigationBar(context),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.route, style: appBarTitle),
        ),
        body: ListView(
          children:[
            const LinearProgressIndicator(),
            if (error != ApiStatus.ok)
              ErrorBlock(
                error: error,
                retry: _getJourney,
              )
          ],
        ),
      );
}
