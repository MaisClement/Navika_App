// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

// 🌎 Project imports:
import 'package:navika/src/data/app.dart';
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/icon.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';

class ExpanderStops extends StatefulWidget {
  final Function()? onTap;
  final Map section;
  final BorderRadius borderRadius;

  const ExpanderStops({
    this.onTap,
    required this.section,
    required this.borderRadius,
    super.key,
  });

  @override
  State<ExpanderStops> createState() => _ButtonLargeTraficState();
}

class _ButtonLargeTraficState extends State<ExpanderStops> {
  bool displayDetails = false;

  void toogle() {
    setState(() {
      displayDetails = !displayDetails;
    });
  }

  BorderRadius getBorderRadiusBlock(borderRadius) {
    if (borderRadius == null) {
      return BorderRadius.circular(500);
    } else if (displayDetails) {
      return borderRadius.copyWith(
        bottomLeft: const Radius.circular(0),
        bottomRight: const Radius.circular(0),
      );
    }
    return borderRadius;
  }

  BorderRadius getBorderRadiusReport(borderRadius) {
    if (borderRadius == null) {
      return BorderRadius.circular(500);
    } else if (displayDetails) {
      return borderRadius.copyWith(
        topLeft: const Radius.circular(0),
        topRight: const Radius.circular(0),
      );
    }
    return borderRadius;
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        child: Column(
          children: [
            SizedBox(
              height: 55,
              child: Card(
                color: HexColor.fromHex(widget.section['informations']['line']['color']).withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: getBorderRadiusBlock(widget.borderRadius),
                ),
                child: InkWell(
                  onTap: widget.onTap,
                  borderRadius: getBorderRadiusBlock(widget.borderRadius),
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.5),
                          child: Icon(
                            NavikaIcons.route,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 30,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            key: ValueKey('$displayDetails'),
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 3,
                                ),
                                child: Text(
                                  widget.section['stop_date_times'].length > 2
                                      ? '${(widget.section['stop_date_times'].length - 2)} arrêts • ${getDuration(widget.section['duration'])}'
                                      : '${AppLocalizations.of(context)!.no_stops} • ${getDuration(widget.section['duration'])}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: toogle,
                          borderRadius: widget.borderRadius,
                          child: Padding(
                            padding: const EdgeInsets.all(12.5),
                            child: AnimatedRotation(
                              turns: displayDetails ? 0.25 : -0.25,
                              duration: const Duration(milliseconds: 150),
                              child: Icon(
                                chevronRight,
                                color: Theme.of(context).colorScheme.onSurface,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: Column(
                key: ValueKey('$displayDetails'),
                children: [
                  if (displayDetails && widget.section['informations']['line']['details'] != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                      color: HexColor.fromHex(widget.section['informations']['line']['color']).withOpacity(0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.section['informations']['line']['details']['vehicule_name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Image(
                            image: NetworkImage(API_BASE + widget.section['informations']['line']['details']['vehicule_img']),
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
                              if (widget.section['informations']['line']['details']['is_air_conditioned'] == true)
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Image(
                                    image: AssetImage('assets/img/modal/ac.png'),
                                    width: 25,
                                  ),
                                ),
                              if (widget.section['informations']['line']['details']['is_wheelchair_accesible'] == true)
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Image(
                                    image: AssetImage('assets/img/modal/acces_ufr.png'),
                                    width: 25,
                                  ),
                                ),
                              if (widget.section['informations']['line']['details']['has_power_sockets'] == true)
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Image(
                                    image: AssetImage('assets/img/modal/power_sockets.png'),
                                    width: 25,
                                  ),
                                ),
                              if (widget.section['informations']['line']['details']['is_bike_accesible'] == true)
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
                          divider,
                        ],
                      ),
                    ),
                  if (displayDetails && widget.section['stop_date_times'].length > 2)
                    Container(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: widget.borderRadius.copyWith(
                          topLeft: const Radius.circular(0),
                          topRight: const Radius.circular(0),
                        ),
                        color: HexColor.fromHex(widget.section['informations']['line']['color']).withOpacity(0.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.section['stop_date_times'].sublist(1, widget.section['stop_date_times'].length - 1).length == 1
                            ? AppLocalizations.of(context)!.stop_served
                            : AppLocalizations.of(context)!.stops_served,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          for (var stop in widget.section['stop_date_times'].sublist(1, widget.section['stop_date_times'].length - 1))
                            Row(
                              children: [
                                Text(
                                  '•',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                    fontFamily: fontFamily,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    stop['stop_point']['name'],
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  if (displayDetails && widget.section['stop_date_times'].length <= 2)
                    Container(
                      padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: widget.borderRadius.copyWith(
                          topLeft: const Radius.circular(0),
                          topRight: const Radius.circular(0),
                        ),
                        color: HexColor.fromHex(widget.section['informations']['line']['color']).withOpacity(0.2),
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no_stops,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                fontFamily: fontFamily,
                              ),
                            ),
                          ])
                        ],
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      );
}
