import 'package:flutter/material.dart';
import 'package:navika/l10n/app_localizations.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/icon.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/departures/vehicle_size.dart';
import 'package:navika/src/widgets/error_block.dart';
import 'package:navika/src/widgets/home/skelton.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:flutter/material.dart' as material;
import 'package:navika/src/controller/mapbox_controller.dart';

class TripHead extends StatefulWidget {
  final String tripId;
  final String? fromId;
  final String? toId;
  final dynamic data;
  final Function setData;
  final MapboxController? Function() getMapController;

  const TripHead({required this.tripId, this.fromId, this.toId, required this.data, required this.setData, required this.getMapController, super.key});

  @override
  State<TripHead> createState() => _TripHeadState();
}

class _TripHeadState extends State<TripHead> {
  ApiStatus error = ApiStatus.ok;
  bool isLoading = false;
  Map vehicleJourney = {};

  Future<void> _updateMapForTrip() async {
    final MapboxController? controller = widget.getMapController();
    if (controller == null) return;

    await controller.initializePointAnnotationManager();
    await controller.clearBikeMarkers();
    await controller.clearStopMarkers();
    await controller.removePointMarker();
    await controller.clearTripStopMarkers();

    final List stops = vehicleJourney['stop_date_time'];
    final String lineColor = (vehicleJourney['informations']?['line']?['color'] ?? '#3388FF').toString();

    final coords = <material.Offset>[];

    for (var stop in stops) {
      final coord = stop['coord'] ?? stop['stop_point']?['coord'];
      if (coord == null) continue;
      final double lat = coord['lat'] is String ? double.parse(coord['lat']) : (coord['lat'] as num).toDouble();
      final double lon = coord['lon'] is String ? double.parse(coord['lon']) : (coord['lon'] as num).toDouble();
      final String id = (stop['stop_point']?['id'] ?? stop['id'] ?? '${lat}_${lon}').toString();
      final String name = (stop['stop_point']?['name'] ?? stop['name'] ?? '').toString();

      await controller.addTripStopMarker(id, lat, lon, name, lineColor);
      coords.add(material.Offset(lon, lat));
    }

    if (coords.isNotEmpty) {
      await controller.fitCameraToCoordinates(coords, padding: 80, context: context);
    }
  }

  Future<void> _getVehicleJourney() async {
    setState(() {
      isLoading = true;
    });

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getVehicleJourney(widget.tripId);

    if (!mounted) return;

    setState(() {
      error = result['status'];
    });

    if (result['value']?['vehicle_journey'] != null) {
      widget.setData(result['value']?['vehicle_journey']);
      setState(() {
        isLoading = false;
        vehicleJourney = result['value']?['vehicle_journey'];
      });

      await _updateMapForTrip();
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            if (error != ApiStatus.ok)
              ErrorBlock(
                error: error,
              )
            else if (isLoading)
              const HomeHeaderSkelton()
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(arrowBack),
                          tooltip: AppLocalizations.of(context)!.back,
                          color: accentColor(context),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 5),
                        Icones(
                          line: vehicleJourney['informations']['line'],
                          prevLine: vehicleJourney['informations']['line'],
                          i: 0,
                          size: 30,
                          brightness: Theme.of(context).colorScheme.brightness,
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vehicleJourney['informations']['direction']['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                fontFamily: fontFamily,
                                color: accentColor(context),
                              ),
                            ),
                            Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  vehicleJourney['informations']['headsign'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Diode',
                                  ),
                                ),
                              ),
                              Text(vehicleJourney['informations']['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Diode',
                                  )),
                            ],
                          ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    if (widget.data == null) {
      _getVehicleJourney();
    } else {
      vehicleJourney = widget.data;
      // Si des données sont déjà présentes, mettre à jour la carte immédiatement
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await _updateMapForTrip();
      });
    }
  }

  @override
  void dispose() {
    final MapboxController? controller = widget.getMapController();
    if (controller != null) {
      controller.clearTripStopMarkers();
    }
    super.dispose();
  }
}
