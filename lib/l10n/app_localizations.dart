import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @january.
  ///
  /// In fr, this message translates to:
  /// **'Janvier'**
  String get january;

  /// No description provided for @february.
  ///
  /// In fr, this message translates to:
  /// **'Février'**
  String get february;

  /// No description provided for @march.
  ///
  /// In fr, this message translates to:
  /// **'Mars'**
  String get march;

  /// No description provided for @april.
  ///
  /// In fr, this message translates to:
  /// **'Avril'**
  String get april;

  /// No description provided for @may.
  ///
  /// In fr, this message translates to:
  /// **'Mai'**
  String get may;

  /// No description provided for @june.
  ///
  /// In fr, this message translates to:
  /// **'Juin'**
  String get june;

  /// No description provided for @july.
  ///
  /// In fr, this message translates to:
  /// **'Juillet'**
  String get july;

  /// No description provided for @august.
  ///
  /// In fr, this message translates to:
  /// **'Août'**
  String get august;

  /// No description provided for @september.
  ///
  /// In fr, this message translates to:
  /// **'Septembre'**
  String get september;

  /// No description provided for @october.
  ///
  /// In fr, this message translates to:
  /// **'Octobre'**
  String get october;

  /// No description provided for @november.
  ///
  /// In fr, this message translates to:
  /// **'Novembre'**
  String get november;

  /// No description provided for @december.
  ///
  /// In fr, this message translates to:
  /// **'Décembre'**
  String get december;

  /// No description provided for @short_january.
  ///
  /// In fr, this message translates to:
  /// **'Jan.'**
  String get short_january;

  /// No description provided for @short_february.
  ///
  /// In fr, this message translates to:
  /// **'Fév.'**
  String get short_february;

  /// No description provided for @short_march.
  ///
  /// In fr, this message translates to:
  /// **'Mar.'**
  String get short_march;

  /// No description provided for @short_april.
  ///
  /// In fr, this message translates to:
  /// **'Avr.'**
  String get short_april;

  /// No description provided for @short_may.
  ///
  /// In fr, this message translates to:
  /// **'Mai'**
  String get short_may;

  /// No description provided for @short_june.
  ///
  /// In fr, this message translates to:
  /// **'Juin'**
  String get short_june;

  /// No description provided for @short_july.
  ///
  /// In fr, this message translates to:
  /// **'Juil.'**
  String get short_july;

  /// No description provided for @short_august.
  ///
  /// In fr, this message translates to:
  /// **'Août'**
  String get short_august;

  /// No description provided for @short_september.
  ///
  /// In fr, this message translates to:
  /// **'Sep.'**
  String get short_september;

  /// No description provided for @short_october.
  ///
  /// In fr, this message translates to:
  /// **'Oct.'**
  String get short_october;

  /// No description provided for @short_november.
  ///
  /// In fr, this message translates to:
  /// **'Nov.'**
  String get short_november;

  /// No description provided for @short_december.
  ///
  /// In fr, this message translates to:
  /// **'Déc.'**
  String get short_december;

  /// No description provided for @monday.
  ///
  /// In fr, this message translates to:
  /// **'Lundi'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In fr, this message translates to:
  /// **'Mardi'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In fr, this message translates to:
  /// **'Mercredi'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In fr, this message translates to:
  /// **'Jeudi'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In fr, this message translates to:
  /// **'Vendredi'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In fr, this message translates to:
  /// **'Samedi'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In fr, this message translates to:
  /// **'Dimanche'**
  String get sunday;

  /// No description provided for @short_monday.
  ///
  /// In fr, this message translates to:
  /// **'Lun'**
  String get short_monday;

  /// No description provided for @short_tuesday.
  ///
  /// In fr, this message translates to:
  /// **'Mar'**
  String get short_tuesday;

  /// No description provided for @short_wednesday.
  ///
  /// In fr, this message translates to:
  /// **'Mer'**
  String get short_wednesday;

  /// No description provided for @short_thursday.
  ///
  /// In fr, this message translates to:
  /// **'Jeu'**
  String get short_thursday;

  /// No description provided for @short_friday.
  ///
  /// In fr, this message translates to:
  /// **'Ven'**
  String get short_friday;

  /// No description provided for @short_saturday.
  ///
  /// In fr, this message translates to:
  /// **'Sam'**
  String get short_saturday;

  /// No description provided for @short_sunday.
  ///
  /// In fr, this message translates to:
  /// **'Dim'**
  String get short_sunday;

  /// No description provided for @slug_short_title_0.
  ///
  /// In fr, this message translates to:
  /// **'Trafic fluide'**
  String get slug_short_title_0;

  /// No description provided for @slug_short_title_5.
  ///
  /// In fr, this message translates to:
  /// **'Trafic fortement perturbé'**
  String get slug_short_title_5;

  /// No description provided for @slug_short_title_4.
  ///
  /// In fr, this message translates to:
  /// **'Trafic perturbé'**
  String get slug_short_title_4;

  /// No description provided for @slug_short_title_3.
  ///
  /// In fr, this message translates to:
  /// **'Travaux'**
  String get slug_short_title_3;

  /// No description provided for @slug_short_title_2.
  ///
  /// In fr, this message translates to:
  /// **'Travaux à venir'**
  String get slug_short_title_2;

  /// No description provided for @slug_short_title_1.
  ///
  /// In fr, this message translates to:
  /// **'Information'**
  String get slug_short_title_1;

  /// No description provided for @slug_short_title_NA.
  ///
  /// In fr, this message translates to:
  /// **'Trafic fluide'**
  String get slug_short_title_NA;

  /// No description provided for @slug_long_title_0.
  ///
  /// In fr, this message translates to:
  /// **'Trafic fluide'**
  String get slug_long_title_0;

  /// No description provided for @slug_long_title_5.
  ///
  /// In fr, this message translates to:
  /// **'Le trafic est fortement perturbé'**
  String get slug_long_title_5;

  /// No description provided for @slug_long_title_4.
  ///
  /// In fr, this message translates to:
  /// **'Le trafic est perturbé'**
  String get slug_long_title_4;

  /// No description provided for @slug_long_title_3.
  ///
  /// In fr, this message translates to:
  /// **'Des travaux sont en cours'**
  String get slug_long_title_3;

  /// No description provided for @slug_long_title_2.
  ///
  /// In fr, this message translates to:
  /// **'Des travaux sont à venir'**
  String get slug_long_title_2;

  /// No description provided for @slug_long_title_1.
  ///
  /// In fr, this message translates to:
  /// **'Information'**
  String get slug_long_title_1;

  /// No description provided for @slug_long_title_NA.
  ///
  /// In fr, this message translates to:
  /// **'Rien à signaler'**
  String get slug_long_title_NA;

  /// No description provided for @settings.
  ///
  /// In fr, this message translates to:
  /// **'Options'**
  String get settings;

  /// No description provided for @settings_journeys.
  ///
  /// In fr, this message translates to:
  /// **'Options d’itinéraires'**
  String get settings_journeys;

  /// No description provided for @settings_position.
  ///
  /// In fr, this message translates to:
  /// **'Position'**
  String get settings_position;

  /// No description provided for @settings_notifications.
  ///
  /// In fr, this message translates to:
  /// **'Gérez vos notifications'**
  String get settings_notifications;

  /// No description provided for @settings_theme.
  ///
  /// In fr, this message translates to:
  /// **'Thème'**
  String get settings_theme;

  /// No description provided for @settings_terminus.
  ///
  /// In fr, this message translates to:
  /// **'Terminus'**
  String get settings_terminus;

  /// No description provided for @notifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @departure_table.
  ///
  /// In fr, this message translates to:
  /// **'Tableau des départs'**
  String get departure_table;

  /// No description provided for @waiting_time.
  ///
  /// In fr, this message translates to:
  /// **'Temps d’attente'**
  String get waiting_time;

  /// No description provided for @passing_time.
  ///
  /// In fr, this message translates to:
  /// **'Heure de passage'**
  String get passing_time;

  /// No description provided for @what_new.
  ///
  /// In fr, this message translates to:
  /// **'Nouveautés'**
  String get what_new;

  /// No description provided for @settings_link_state.
  ///
  /// In fr, this message translates to:
  /// **'Statut ›'**
  String get settings_link_state;

  /// No description provided for @settings_link_repository_link.
  ///
  /// In fr, this message translates to:
  /// **'GitHub du projet ›'**
  String get settings_link_repository_link;

  /// No description provided for @settings_link_icons.
  ///
  /// In fr, this message translates to:
  /// **'Icônes par Icones8 ›'**
  String get settings_link_icons;

  /// No description provided for @settings_link_legals.
  ///
  /// In fr, this message translates to:
  /// **'Mentions légales ›'**
  String get settings_link_legals;

  /// No description provided for @settings_link_OSM_licence.
  ///
  /// In fr, this message translates to:
  /// **'Licence OpenStreetMap ›'**
  String get settings_link_OSM_licence;

  /// No description provided for @settings_link_MapBox_privacy.
  ///
  /// In fr, this message translates to:
  /// **'Politique de confidentialité Mapbox ›'**
  String get settings_link_MapBox_privacy;

  /// No description provided for @details_privacy.
  ///
  /// In fr, this message translates to:
  /// **'Par respect pour votre confidentialité, Navika ne collecte ou ne conserve aucune information personnelle vous concernant.'**
  String get details_privacy;

  /// No description provided for @details_OSM.
  ///
  /// In fr, this message translates to:
  /// **'Les données géographiques utilisées par Navika sont fournies par OpenStreetMap et ses contributeurs.'**
  String get details_OSM;

  /// No description provided for @details_MapBox.
  ///
  /// In fr, this message translates to:
  /// **'Navika repose sur des technologies et services de « Mapbox ».'**
  String get details_MapBox;

  /// No description provided for @defaut.
  ///
  /// In fr, this message translates to:
  /// **'Défaut'**
  String get defaut;

  /// No description provided for @allowed.
  ///
  /// In fr, this message translates to:
  /// **'Autorisé'**
  String get allowed;

  /// No description provided for @forbidden.
  ///
  /// In fr, this message translates to:
  /// **'Interdit'**
  String get forbidden;

  /// No description provided for @showed.
  ///
  /// In fr, this message translates to:
  /// **'Affiché'**
  String get showed;

  /// No description provided for @hidden.
  ///
  /// In fr, this message translates to:
  /// **'Masqué'**
  String get hidden;

  /// No description provided for @hidde.
  ///
  /// In fr, this message translates to:
  /// **'Masquer'**
  String get hidde;

  /// No description provided for @allow.
  ///
  /// In fr, this message translates to:
  /// **'Autoriser'**
  String get allow;

  /// No description provided for @not_allow.
  ///
  /// In fr, this message translates to:
  /// **'Ne pas autoriser'**
  String get not_allow;

  /// No description provided for @grouped.
  ///
  /// In fr, this message translates to:
  /// **'Groupé'**
  String get grouped;

  /// No description provided for @not_grouped.
  ///
  /// In fr, this message translates to:
  /// **'Non groupé'**
  String get not_grouped;

  /// No description provided for @not_defined.
  ///
  /// In fr, this message translates to:
  /// **'Non défini'**
  String get not_defined;

  /// No description provided for @add.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get add;

  /// No description provided for @sponsor_title.
  ///
  /// In fr, this message translates to:
  /// **'Soutenez Navika !'**
  String get sponsor_title;

  /// No description provided for @sponsor_details.
  ///
  /// In fr, this message translates to:
  /// **'Navika est une application open-source, totalement gratuite et surtout sans pub. Si Navika vous plaît, vous pouvez soutenir son développement en laissant une petite pièce.'**
  String get sponsor_details;

  /// No description provided for @sponsor_thanks.
  ///
  /// In fr, this message translates to:
  /// **'Merci pour votre soutien !'**
  String get sponsor_thanks;

  /// No description provided for @sponsor.
  ///
  /// In fr, this message translates to:
  /// **'Soutenir'**
  String get sponsor;

  /// No description provided for @sponsor_later.
  ///
  /// In fr, this message translates to:
  /// **'Plus tard'**
  String get sponsor_later;

  /// No description provided for @sponsor_hide_confirmation.
  ///
  /// In fr, this message translates to:
  /// **'Compris, ce message n’apparaîtra plus.'**
  String get sponsor_hide_confirmation;

  /// No description provided for @position_title.
  ///
  /// In fr, this message translates to:
  /// **'Autoriser Navika à accéder à votre position ?'**
  String get position_title;

  /// No description provided for @position_privacy.
  ///
  /// In fr, this message translates to:
  /// **'Navika utilise votre position uniquement lors que l’application est ouverte, pour afficher votre position sur la carte ou vous proposer les points d’arrêts à proximité.'**
  String get position_privacy;

  /// No description provided for @position_details.
  ///
  /// In fr, this message translates to:
  /// **'Votre position est utilisée uniquement lorsque vous en avez besoin et n’est pas sauvegardée.'**
  String get position_details;

  /// No description provided for @error.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur s’est produite'**
  String get error;

  /// No description provided for @best_emoji.
  ///
  /// In fr, this message translates to:
  /// **'Recommandé 👍'**
  String get best_emoji;

  /// No description provided for @best.
  ///
  /// In fr, this message translates to:
  /// **'Recommandé'**
  String get best;

  /// No description provided for @fastest.
  ///
  /// In fr, this message translates to:
  /// **'Le plus rapide'**
  String get fastest;

  /// No description provided for @comfort.
  ///
  /// In fr, this message translates to:
  /// **'Avec le moins de changement'**
  String get comfort;

  /// No description provided for @less_fallback_walk.
  ///
  /// In fr, this message translates to:
  /// **'Avec le moins de marche'**
  String get less_fallback_walk;

  /// No description provided for @same.
  ///
  /// In fr, this message translates to:
  /// **'Identique'**
  String get same;

  /// No description provided for @back.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get back;

  /// No description provided for @close.
  ///
  /// In fr, this message translates to:
  /// **'Fermer'**
  String get close;

  /// No description provided for @bike_available.
  ///
  /// In fr, this message translates to:
  /// **'Vélo disponible'**
  String get bike_available;

  /// No description provided for @bike_mechanical.
  ///
  /// In fr, this message translates to:
  /// **'Vélo mécanique'**
  String get bike_mechanical;

  /// No description provided for @bike_ebike.
  ///
  /// In fr, this message translates to:
  /// **'Vélo électriques'**
  String get bike_ebike;

  /// No description provided for @bike_park.
  ///
  /// In fr, this message translates to:
  /// **'Places disponibles'**
  String get bike_park;

  /// No description provided for @reduced_mobility.
  ///
  /// In fr, this message translates to:
  /// **'Avec difficultés'**
  String get reduced_mobility;

  /// No description provided for @wheelchair.
  ///
  /// In fr, this message translates to:
  /// **'Mobilité réduite'**
  String get wheelchair;

  /// No description provided for @transportation_mode.
  ///
  /// In fr, this message translates to:
  /// **'Modes de transport'**
  String get transportation_mode;

  /// No description provided for @rail.
  ///
  /// In fr, this message translates to:
  /// **'Train et RER'**
  String get rail;

  /// No description provided for @metro.
  ///
  /// In fr, this message translates to:
  /// **'Métro'**
  String get metro;

  /// No description provided for @tramway.
  ///
  /// In fr, this message translates to:
  /// **'Tramway'**
  String get tramway;

  /// No description provided for @bus.
  ///
  /// In fr, this message translates to:
  /// **'Bus'**
  String get bus;

  /// No description provided for @cable_car.
  ///
  /// In fr, this message translates to:
  /// **'Téléphérique'**
  String get cable_car;

  /// No description provided for @shuttle.
  ///
  /// In fr, this message translates to:
  /// **'Funiculaire'**
  String get shuttle;

  /// No description provided for @boat.
  ///
  /// In fr, this message translates to:
  /// **'Bateau'**
  String get boat;

  /// No description provided for @saved_route.
  ///
  /// In fr, this message translates to:
  /// **'Itinéraire enregistré, les détails sont désormais disponibles même hors connexion.'**
  String get saved_route;

  /// No description provided for @where_to_board.
  ///
  /// In fr, this message translates to:
  /// **'Où monter ?'**
  String get where_to_board;

  /// No description provided for @routes.
  ///
  /// In fr, this message translates to:
  /// **'Itinéraires'**
  String get routes;

  /// No description provided for @your_favorites.
  ///
  /// In fr, this message translates to:
  /// **'Vos favoris'**
  String get your_favorites;

  /// No description provided for @no_saved_routes.
  ///
  /// In fr, this message translates to:
  /// **'Aucun itinéraire enregistré.'**
  String get no_saved_routes;

  /// No description provided for @go.
  ///
  /// In fr, this message translates to:
  /// **'Y aller'**
  String get go;

  /// No description provided for @edit_route.
  ///
  /// In fr, this message translates to:
  /// **'Modifier un trajet'**
  String get edit_route;

  /// No description provided for @depart_now.
  ///
  /// In fr, this message translates to:
  /// **'Partir maintenant'**
  String get depart_now;

  /// No description provided for @route_removed.
  ///
  /// In fr, this message translates to:
  /// **'Itinéraire retiré.'**
  String get route_removed;

  /// No description provided for @no_routes_planned.
  ///
  /// In fr, this message translates to:
  /// **'Vous n’avez pas d’itinéraires prévu.'**
  String get no_routes_planned;

  /// No description provided for @regular_route.
  ///
  /// In fr, this message translates to:
  /// **'Trajet régulier'**
  String get regular_route;

  /// No description provided for @address.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get address;

  /// No description provided for @arrival.
  ///
  /// In fr, this message translates to:
  /// **'Arrivée'**
  String get arrival;

  /// No description provided for @route.
  ///
  /// In fr, this message translates to:
  /// **'Itinéraire'**
  String get route;

  /// No description provided for @remove_route.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer l’itinéraire'**
  String get remove_route;

  /// No description provided for @remvove_address.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer l’adresse ?'**
  String get remvove_address;

  /// No description provided for @new_address.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle adresse'**
  String get new_address;

  /// No description provided for @new_address_added.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle adresse ajouté.'**
  String get new_address_added;

  /// No description provided for @edit_your_address.
  ///
  /// In fr, this message translates to:
  /// **'Modifiez votre adresse'**
  String get edit_your_address;

  /// No description provided for @news_messages.
  ///
  /// In fr, this message translates to:
  /// **'Messages d’actualité'**
  String get news_messages;

  /// No description provided for @disruptions_and_works.
  ///
  /// In fr, this message translates to:
  /// **'Perturbations et travaux'**
  String get disruptions_and_works;

  /// No description provided for @create_alert.
  ///
  /// In fr, this message translates to:
  /// **'Créer une alerte'**
  String get create_alert;

  /// No description provided for @alert_type.
  ///
  /// In fr, this message translates to:
  /// **'Type de l’alerte'**
  String get alert_type;

  /// No description provided for @alert_days.
  ///
  /// In fr, this message translates to:
  /// **'Jours de l’alerte'**
  String get alert_days;

  /// No description provided for @edit_alert.
  ///
  /// In fr, this message translates to:
  /// **'Modifier une alerte'**
  String get edit_alert;

  /// No description provided for @get_notified_disruptions.
  ///
  /// In fr, this message translates to:
  /// **'Être prévenu en cas de perturbations'**
  String get get_notified_disruptions;

  /// No description provided for @works_calendar.
  ///
  /// In fr, this message translates to:
  /// **'Calendrier des travaux'**
  String get works_calendar;

  /// No description provided for @offline_data_available.
  ///
  /// In fr, this message translates to:
  /// **'Données disponible hors connexion'**
  String get offline_data_available;

  /// No description provided for @loading.
  ///
  /// In fr, this message translates to:
  /// **'Chargement...'**
  String get loading;

  /// No description provided for @no_internet_connection.
  ///
  /// In fr, this message translates to:
  /// **'Aucune connexion internet'**
  String get no_internet_connection;

  /// No description provided for @no_information.
  ///
  /// In fr, this message translates to:
  /// **'Aucune information'**
  String get no_information;

  /// No description provided for @unable_to_retrieve_information.
  ///
  /// In fr, this message translates to:
  /// **'Récupération des informations impossible'**
  String get unable_to_retrieve_information;

  /// No description provided for @sure_to_remove_favorite.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de supprimer ce favori ?'**
  String get sure_to_remove_favorite;

  /// No description provided for @sure_to_remove_history.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de supprimer ce lieu ?'**
  String get sure_to_remove_history;

  /// No description provided for @favorite_added.
  ///
  /// In fr, this message translates to:
  /// **'Favoris ajouté.'**
  String get favorite_added;

  /// No description provided for @favorite_removed.
  ///
  /// In fr, this message translates to:
  /// **'Favoris retiré.'**
  String get favorite_removed;

  /// No description provided for @add_to_favorites.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter aux favoris'**
  String get add_to_favorites;

  /// No description provided for @add_lines_to_favorites.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez vos lignes à vos favoris pour y accéder encore plus rapidement et à tout moment.'**
  String get add_lines_to_favorites;

  /// No description provided for @remove_favorite.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce favori'**
  String get remove_favorite;

  /// No description provided for @remove_history.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer de l\'historique'**
  String get remove_history;

  /// No description provided for @add_line_to_favorites.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une ligne à vos favoris'**
  String get add_line_to_favorites;

  /// No description provided for @locating_your_position.
  ///
  /// In fr, this message translates to:
  /// **'Nous recherchons votre position...'**
  String get locating_your_position;

  /// No description provided for @navika_uses_location.
  ///
  /// In fr, this message translates to:
  /// **'Navika utilise votre position uniquement lorsque l’application est ouverte, pour afficher votre position sur la carte ou vous proposer les points d’arrêts à proximité.'**
  String get navika_uses_location;

  /// No description provided for @your_position.
  ///
  /// In fr, this message translates to:
  /// **'Votre position'**
  String get your_position;

  /// No description provided for @where_are_we_departing_from.
  ///
  /// In fr, this message translates to:
  /// **'D’où partons-nous ?'**
  String get where_are_we_departing_from;

  /// No description provided for @where_are_we_going.
  ///
  /// In fr, this message translates to:
  /// **'Où allons-nous ?'**
  String get where_are_we_going;

  /// No description provided for @home_search.
  ///
  /// In fr, this message translates to:
  /// **'Où allons-nous ? Rechercher une adresse, une station...'**
  String get home_search;

  /// No description provided for @undefined_address_or_label.
  ///
  /// In fr, this message translates to:
  /// **'Adresse ou libellé non défini'**
  String get undefined_address_or_label;

  /// No description provided for @home.
  ///
  /// In fr, this message translates to:
  /// **'Maison'**
  String get home;

  /// No description provided for @nearby.
  ///
  /// In fr, this message translates to:
  /// **'À proximité'**
  String get nearby;

  /// No description provided for @address_modified.
  ///
  /// In fr, this message translates to:
  /// **'Adresse modifié'**
  String get address_modified;

  /// No description provided for @choose_preferred_display_mode.
  ///
  /// In fr, this message translates to:
  /// **'Définissez le mode d’affichage que vous préfèrerez.'**
  String get choose_preferred_display_mode;

  /// No description provided for @access_type.
  ///
  /// In fr, this message translates to:
  /// **'Quel accès ?'**
  String get access_type;

  /// No description provided for @app_theme.
  ///
  /// In fr, this message translates to:
  /// **'Thème de l’application'**
  String get app_theme;

  /// No description provided for @reorganize_home.
  ///
  /// In fr, this message translates to:
  /// **'Réorganiser l’accueil'**
  String get reorganize_home;

  /// No description provided for @reorganize_this_page.
  ///
  /// In fr, this message translates to:
  /// **'Réorganiser cette page'**
  String get reorganize_this_page;

  /// No description provided for @middle.
  ///
  /// In fr, this message translates to:
  /// **'Milieu'**
  String get middle;

  /// No description provided for @before.
  ///
  /// In fr, this message translates to:
  /// **'Avant'**
  String get before;

  /// No description provided for @past.
  ///
  /// In fr, this message translates to:
  /// **'Passé'**
  String get past;

  /// No description provided for @support_navika.
  ///
  /// In fr, this message translates to:
  /// **'Soutenir Navika'**
  String get support_navika;

  /// No description provided for @navika_open_source.
  ///
  /// In fr, this message translates to:
  /// **'Navika est une application open-source, totalement gratuite et surtout sans pub. Si Navika vous plaît, vous pouvez soutenir son développement en laissant une petite pièce.'**
  String get navika_open_source;

  /// No description provided for @view_all_schedules.
  ///
  /// In fr, this message translates to:
  /// **'Tous les horaires ➜'**
  String get view_all_schedules;

  /// No description provided for @network_maps.
  ///
  /// In fr, this message translates to:
  /// **'Plans du réseau'**
  String get network_maps;

  /// No description provided for @route_type.
  ///
  /// In fr, this message translates to:
  /// **'Type du trajet'**
  String get route_type;

  /// No description provided for @works.
  ///
  /// In fr, this message translates to:
  /// **'Travaux'**
  String get works;

  /// No description provided for @road.
  ///
  /// In fr, this message translates to:
  /// **'Route'**
  String get road;

  /// No description provided for @traffic_status.
  ///
  /// In fr, this message translates to:
  /// **'État du trafic'**
  String get traffic_status;

  /// No description provided for @work.
  ///
  /// In fr, this message translates to:
  /// **'Travail'**
  String get work;

  /// No description provided for @delete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get edit;

  /// No description provided for @create.
  ///
  /// In fr, this message translates to:
  /// **'Créer'**
  String get create;

  /// No description provided for @validate.
  ///
  /// In fr, this message translates to:
  /// **'Valider'**
  String get validate;

  /// No description provided for @cancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get save;

  /// No description provided for @regular_trips.
  ///
  /// In fr, this message translates to:
  /// **'Vos trajets réguliers'**
  String get regular_trips;

  /// No description provided for @your_routes.
  ///
  /// In fr, this message translates to:
  /// **'Vos itinéraires'**
  String get your_routes;

  /// No description provided for @save_regular_trip.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer un trajet régulier'**
  String get save_regular_trip;

  /// No description provided for @save_trip.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer un trajet'**
  String get save_trip;

  /// No description provided for @select_trip.
  ///
  /// In fr, this message translates to:
  /// **'Sélection du trajet'**
  String get select_trip;

  /// No description provided for @departure.
  ///
  /// In fr, this message translates to:
  /// **'Départ'**
  String get departure;

  /// No description provided for @departing_at.
  ///
  /// In fr, this message translates to:
  /// **'Départ à'**
  String get departing_at;

  /// No description provided for @arriving_at.
  ///
  /// In fr, this message translates to:
  /// **'Arrivée à'**
  String get arriving_at;

  /// No description provided for @add_address.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une adresse, une gare, un arrêt ou une station'**
  String get add_address;

  /// No description provided for @address_deleted.
  ///
  /// In fr, this message translates to:
  /// **'Adresse supprimé'**
  String get address_deleted;

  /// No description provided for @address_deletion_error.
  ///
  /// In fr, this message translates to:
  /// **'Erreur lors de la suppression de l’adresse'**
  String get address_deletion_error;

  /// No description provided for @search_station.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une gare, un arrêt ou une station'**
  String get search_station;

  /// No description provided for @light.
  ///
  /// In fr, this message translates to:
  /// **'Clair'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In fr, this message translates to:
  /// **'Sombre'**
  String get dark;

  /// No description provided for @system_settings.
  ///
  /// In fr, this message translates to:
  /// **'Selon les paramètres du système'**
  String get system_settings;

  /// No description provided for @set_preferred_display_mode.
  ///
  /// In fr, this message translates to:
  /// **'Définissez le mode d’affichage que vous préférez'**
  String get set_preferred_display_mode;

  /// No description provided for @details_unavailable.
  ///
  /// In fr, this message translates to:
  /// **'Les détails ne sont pas disponibles pour ce trajet'**
  String get details_unavailable;

  /// No description provided for @nothing_found.
  ///
  /// In fr, this message translates to:
  /// **'Nous n’avons rien trouvé'**
  String get nothing_found;

  /// No description provided for @sure_to_delete_favorite.
  ///
  /// In fr, this message translates to:
  /// **'Etes-vous sûr de supprimer ce favori ?'**
  String get sure_to_delete_favorite;

  /// No description provided for @sure_to_delete_route.
  ///
  /// In fr, this message translates to:
  /// **'Etes-vous sûr de supprimer cet itinéraire ?'**
  String get sure_to_delete_route;

  /// No description provided for @favorite_added_details.
  ///
  /// In fr, this message translates to:
  /// **'Favoris ajouté, les détails de cette ligne sont disponibles même hors connexion'**
  String get favorite_added_details;

  /// No description provided for @group_trains_by_line.
  ///
  /// In fr, this message translates to:
  /// **'Choisisez le style d’affichage des prochains départs'**
  String get group_trains_by_line;

  /// No description provided for @ungrouped.
  ///
  /// In fr, this message translates to:
  /// **'Dégroupé'**
  String get ungrouped;

  /// No description provided for @hide_arriving_trains.
  ///
  /// In fr, this message translates to:
  /// **'Voulez-vous masquer les trains à l’arrivée ?'**
  String get hide_arriving_trains;

  /// No description provided for @receive_disruption_alerts.
  ///
  /// In fr, this message translates to:
  /// **'Être prévenu en cas de perturbations'**
  String get receive_disruption_alerts;

  /// No description provided for @your_timetables.
  ///
  /// In fr, this message translates to:
  /// **'Vos horaires'**
  String get your_timetables;

  /// No description provided for @display_your_trains.
  ///
  /// In fr, this message translates to:
  /// **'Affichage des prochains départs'**
  String get display_your_trains;

  /// No description provided for @timetable_details.
  ///
  /// In fr, this message translates to:
  /// **'Détails sur vos horaires'**
  String get timetable_details;

  /// No description provided for @trip.
  ///
  /// In fr, this message translates to:
  /// **'Trajet'**
  String get trip;

  /// No description provided for @theoretical.
  ///
  /// In fr, this message translates to:
  /// **'Théorique'**
  String get theoretical;

  /// No description provided for @modified.
  ///
  /// In fr, this message translates to:
  /// **'Modifié'**
  String get modified;

  /// No description provided for @deleted.
  ///
  /// In fr, this message translates to:
  /// **'Supprimé'**
  String get deleted;

  /// No description provided for @delayed.
  ///
  /// In fr, this message translates to:
  /// **'Retardé'**
  String get delayed;

  /// No description provided for @on_time.
  ///
  /// In fr, this message translates to:
  /// **'À l’heure'**
  String get on_time;

  /// No description provided for @terminal_display.
  ///
  /// In fr, this message translates to:
  /// **'Affichage des terminus'**
  String get terminal_display;

  /// No description provided for @main.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get main;

  /// No description provided for @timetables.
  ///
  /// In fr, this message translates to:
  /// **'Horaires'**
  String get timetables;

  /// No description provided for @lines.
  ///
  /// In fr, this message translates to:
  /// **'Lignes'**
  String get lines;

  /// No description provided for @traffic_info.
  ///
  /// In fr, this message translates to:
  /// **'Info Trafic'**
  String get traffic_info;

  /// No description provided for @maps.
  ///
  /// In fr, this message translates to:
  /// **'Plans'**
  String get maps;

  /// No description provided for @disruptions.
  ///
  /// In fr, this message translates to:
  /// **'Perturbations'**
  String get disruptions;

  /// No description provided for @additional_stop.
  ///
  /// In fr, this message translates to:
  /// **'Arrêt supplémentaire'**
  String get additional_stop;

  /// No description provided for @stop_deleted.
  ///
  /// In fr, this message translates to:
  /// **'Arrêt supprimé'**
  String get stop_deleted;

  /// No description provided for @new_departure_station.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle gare de départ'**
  String get new_departure_station;

  /// No description provided for @exceptional_terminus.
  ///
  /// In fr, this message translates to:
  /// **'Terminus exceptionnel'**
  String get exceptional_terminus;

  /// No description provided for @exceptional_terminus_short.
  ///
  /// In fr, this message translates to:
  /// **'Terminus ex.'**
  String get exceptional_terminus_short;

  /// No description provided for @exceptional_origin.
  ///
  /// In fr, this message translates to:
  /// **'Origine exceptionnelle'**
  String get exceptional_origin;

  /// No description provided for @modified_train.
  ///
  /// In fr, this message translates to:
  /// **'Desserte modifié'**
  String get modified_train;

  /// No description provided for @modified_train_short.
  ///
  /// In fr, this message translates to:
  /// **'Modifié'**
  String get modified_train_short;

  /// No description provided for @timetable_sheet.
  ///
  /// In fr, this message translates to:
  /// **'Fiche horaire'**
  String get timetable_sheet;

  /// No description provided for @today.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd’hui'**
  String get today;

  /// No description provided for @tomorrow.
  ///
  /// In fr, this message translates to:
  /// **'Demain'**
  String get tomorrow;

  /// No description provided for @upcoming.
  ///
  /// In fr, this message translates to:
  /// **'À venir'**
  String get upcoming;

  /// No description provided for @time_range.
  ///
  /// In fr, this message translates to:
  /// **'Plage horaire'**
  String get time_range;

  /// No description provided for @search.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher'**
  String get search;

  /// No description provided for @search_line.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une ligne'**
  String get search_line;

  /// No description provided for @recent.
  ///
  /// In fr, this message translates to:
  /// **'Récents'**
  String get recent;

  /// No description provided for @server_not_responding.
  ///
  /// In fr, this message translates to:
  /// **'Le serveur n’a pas répondu'**
  String get server_not_responding;

  /// No description provided for @avoid_line.
  ///
  /// In fr, this message translates to:
  /// **'Éviter une ligne ?'**
  String get avoid_line;

  /// No description provided for @avoid.
  ///
  /// In fr, this message translates to:
  /// **'Éviter une ligne'**
  String get avoid;

  /// No description provided for @uncheck_line_to_avoid.
  ///
  /// In fr, this message translates to:
  /// **'Décocher une ligne pour éviter celle-ci'**
  String get uncheck_line_to_avoid;

  /// No description provided for @label.
  ///
  /// In fr, this message translates to:
  /// **'Libellé'**
  String get label;

  /// No description provided for @traveler_profile.
  ///
  /// In fr, this message translates to:
  /// **'Profil de voyageur'**
  String get traveler_profile;

  /// No description provided for @see_more.
  ///
  /// In fr, this message translates to:
  /// **'Voir le reste ➜'**
  String get see_more;

  /// No description provided for @all_your_routes.
  ///
  /// In fr, this message translates to:
  /// **'Tous vos itinéraires ➜'**
  String get all_your_routes;

  /// No description provided for @modify_time.
  ///
  /// In fr, this message translates to:
  /// **'Modifier l’heure'**
  String get modify_time;

  /// No description provided for @select_line_to_add_to_favorites.
  ///
  /// In fr, this message translates to:
  /// **'Selectionner la ligne à ajouter aux favoris.'**
  String get select_line_to_add_to_favorites;

  /// No description provided for @saved_routes.
  ///
  /// In fr, this message translates to:
  /// **'Itinéraires enregistrés'**
  String get saved_routes;

  /// No description provided for @traffic.
  ///
  /// In fr, this message translates to:
  /// **'Trafic'**
  String get traffic;

  /// No description provided for @add_stop_to_favorites.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez un arrêt à vos favoris pour accéder à vos horaires plus rapidement.'**
  String get add_stop_to_favorites;

  /// No description provided for @favorite_deletion_error.
  ///
  /// In fr, this message translates to:
  /// **'Erreur lors de la suppression du favori.'**
  String get favorite_deletion_error;

  /// No description provided for @line_details.
  ///
  /// In fr, this message translates to:
  /// **'Détails de la ligne'**
  String get line_details;

  /// No description provided for @no_work_planned.
  ///
  /// In fr, this message translates to:
  /// **'Aucun travaux prévu à cette date'**
  String get no_work_planned;

  /// No description provided for @choose_display_mode.
  ///
  /// In fr, this message translates to:
  /// **'Définissez le mode d’affichage que vous préférez.'**
  String get choose_display_mode;

  /// No description provided for @added.
  ///
  /// In fr, this message translates to:
  /// **'Supplémentaire'**
  String get added;

  /// No description provided for @onboard_services.
  ///
  /// In fr, this message translates to:
  /// **'Services à bord'**
  String get onboard_services;

  /// No description provided for @indicative_information.
  ///
  /// In fr, this message translates to:
  /// **'Informations fourni à titre indicatif'**
  String get indicative_information;

  /// No description provided for @no_stops.
  ///
  /// In fr, this message translates to:
  /// **'Sans arrêts'**
  String get no_stops;

  /// No description provided for @stop_served.
  ///
  /// In fr, this message translates to:
  /// **'Arrêt desservi'**
  String get stop_served;

  /// No description provided for @stops_served.
  ///
  /// In fr, this message translates to:
  /// **'Arrêts desservis'**
  String get stops_served;

  /// No description provided for @stop.
  ///
  /// In fr, this message translates to:
  /// **'arrêt'**
  String get stop;

  /// No description provided for @stops.
  ///
  /// In fr, this message translates to:
  /// **'arrêts'**
  String get stops;

  /// No description provided for @no_next_departure.
  ///
  /// In fr, this message translates to:
  /// **'Aucun départ prochainement'**
  String get no_next_departure;

  /// No description provided for @see_schedules.
  ///
  /// In fr, this message translates to:
  /// **'Voir les horaires ➜'**
  String get see_schedules;

  /// No description provided for @choose_icon_address.
  ///
  /// In fr, this message translates to:
  /// **'Choisisez une icone pour cette adresse'**
  String get choose_icon_address;

  /// No description provided for @train_size_short.
  ///
  /// In fr, this message translates to:
  /// **'Train court'**
  String get train_size_short;

  /// No description provided for @train_size_medium.
  ///
  /// In fr, this message translates to:
  /// **'Train moyen'**
  String get train_size_medium;

  /// No description provided for @train_size_long.
  ///
  /// In fr, this message translates to:
  /// **'Train long'**
  String get train_size_long;

  /// No description provided for @trip_details_unavailable.
  ///
  /// In fr, this message translates to:
  /// **'Les détails ne sont pas disponibles pour ce trajet'**
  String get trip_details_unavailable;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
