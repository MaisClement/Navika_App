import 'package:flutter/material.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';

class AccessPoint extends StatelessWidget {
  final Map accessPoint;

  const AccessPoint({
    required this.accessPoint,
    super.key
  });

  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.only( top: 10, right: 10, bottom: 10 ),
    child: Padding(
      padding: const EdgeInsets.only(right: 15, left: 7, top: 7, bottom: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text('Quel accès ?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Segoe Ui',
              )
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10, left: 7, top: 3, bottom: 3),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    const Icon(
                      NavikaIcons.exit,
                      color: Colors.white,
                    ),
                    if (accessPoint['access_point_code'] != null)
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: Text(accessPoint['access_point_code'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Segoe Ui',
                          )
                        ),
                      ),
                  ],
                ),
              ),
              Text(accessPoint['name'],
                style: TextStyle(
                  fontSize: 16,
                  color: accentColor(context),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                )
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    ),
    );
}
