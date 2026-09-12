// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';

class TraficWorks extends StatelessWidget {
  final List reports;

  const TraficWorks({
    required this.reports,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: accentColor(context).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.upcoming,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Divider(height: 25, thickness: 1.5, color: Theme.of(context).colorScheme.onSurface,),
            for (var ctrafic in reports)
              Container(
                margin: const EdgeInsets.only(top: 5, right: 5, bottom: 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (ctrafic['message']['title'] != null)
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: Image(
                                  image: getSlugImage(ctrafic['severity']),
                                  height: 25,
                                ),
                              ),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Text(
                                      ctrafic['message']['title'],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      Text(
                        ctrafic['message']['text'],
                      ),
                      Text(
                        'Mis à jour: ${getDateTime(ctrafic['updated_at'])}',
                        style: const TextStyle(fontSize: 11),
                      )
                    ]),
              ),
          ],
        ),
      );
}
