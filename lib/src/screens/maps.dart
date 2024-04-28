// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/utils/button_large.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> with SingleTickerProviderStateMixin {
  bool isLoading = true;
  List maps = [];
  ApiStatus error = ApiStatus.ok;

  Future<void> _getMaps() async {
    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getMaps();

    if (mounted) {
      setState(() {
        error = result['status'];
        maps = result['value']?['maps'];
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getMaps();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: getNavigationBar(context),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.maps, style: appBarTitle),
        ),
        body: ListView(
          children: [
            if (error != ApiStatus.ok)
              ErrorBlock(
                error: error,
                retry: _getMaps,
              )
            else if (isLoading)
              const LinearProgressIndicator()
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var map in maps)
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: ButtonLarge(
                      image: map['icon'] == null
                        ? null
                        : NetworkImage(map['icon']),
                      icon: NavikaIcons.map,
                      text: map['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      onTap: () async {
                        globals.pdfUrl = map['url'];
                        globals.pdfTitle = map['name'];
                        RouteStateScope.of(context).go('/pdf');
                      },
                    ),
                  )
                ],
              )
          ],
        ),
      );
}
