// ignore_for_file: constant_identifier_names

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:geolocator/geolocator.dart';
import 'package:navika/src/controller/mapbox_controller.dart';


String fcmToken = '';
Position? position;

List path = [];

String schedulesStopName = '';
List schedulesStopLines = [];

Map lineTrafic = {};
Map journey = {};
Map departure = {};
List trafic = [];

String pdfTitle = '';
String pdfUrl = '';

bool routePosUsed = false;

Map? index;

Map _d = {
    'id': null,
    'name': null
};
Map _a = {
    'id': null,
    'name': null
};
Map route = {
  'from' : _d,
  'to' : _a
};

bool isTimeNow = true;
DateTime selectedDate = DateTime.now();
TimeOfDay selectedTime = TimeOfDay.now();
String timeType = 'departure';
List forbiddenLines = [];
List journeys = [];

// for smoth transition
String? direction;

// for for query search
dynamic panelController;
dynamic pointMarker;
bool updateMap = true;

// Fonctions de callback pour la gestion des marqueurs de point
Function(double, double, [bool])? openMapPointCallback;
Function()? removePointMarkerCallback;

// Référence du contrôleur Map (renseignée par Home)
MapboxController? mapController;

// Callbacks pour la gestion des shapes sur la carte
// Utilisés par des widgets (ex: RouteScheduleHead) pour demander au contrôleur d'ajouter/supprimer les shapes
Function(Map)? addShapesCallback;
Function()? clearAllShapesCallback;

String? query;

// ignore: prefer_typing_uninitialized_variables
var hiveBox;

// Indique si la carte a déjà été ouverte au moins une fois (pour l'animation initiale)
bool hasOpenedMapOnce = false;

// Callback global pour déplacer la carte (zoomTo)
// Signature: (lat, lon, [zoom])
Function(double, double, [double?])? zoomToCallback;

// Mode éco d'énergie du système (économiseur de batterie Android / Low Power Mode iOS).
// Rafraîchi au démarrage et à chaque retour au premier plan de l'app (voir app.dart).
bool isPowerSaveMode = false;
