// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/data/app.dart';

// 🌎 Project imports:

class VehiculeDetails extends StatelessWidget {
  final Map details;

  const VehiculeDetails({
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            details['details']['vehicule_name'],
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 10),
          Image(
            image: NetworkImage(API_BASE + details['details']['vehicule_img']),
            height: 60,
          ),
          const SizedBox(height: 10),
          Text(
            AppLocalizations.of(context)!.onboard_services,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          Wrap(
            children: [
              if (details['details']['is_air_conditioned'] == true)
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                    image: AssetImage('assets/img/modal/ac.png'),
                    width: 25,
                  ),
                ),
              if (details['details']['is_wheelchair_accesible'] == true)
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                    image: AssetImage('assets/img/modal/acces_ufr.png'),
                    width: 25,
                  ),
                ),
              if (details['details']['has_power_sockets'] == true)
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                    image: AssetImage('assets/img/modal/power_sockets.png'),
                    width: 25,
                  ),
                ),
              if (details['details']['is_bike_accesible'] == true)
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                    image: AssetImage('assets/img/modal/bike.png'),
                    width: 25,
                  ),
                ),
            ],
          ),
          Text(
            AppLocalizations.of(context)!.indicative_information,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 10,
            ),
          ),
        ],
      );
}
