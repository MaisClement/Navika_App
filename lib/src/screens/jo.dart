// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/widgets/places/empty.dart';
import 'package:navika/src/widgets/settings/button.dart';

// 📦 Package imports:

class JO extends StatefulWidget {
  const JO({super.key});

  @override
  State<JO> createState() => _SettingsState();
}

String removeDiacritics(String str) {
  var withDia = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  var withoutDia = 'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

  for (int i = 0; i < withDia.length; i++) {
    str = str.replaceAll(withDia[i], withoutDia[i]);
  }
  return str;
}

List filterVenues(List venues, String search) {
  search = removeDiacritics(search.toLowerCase());
  List filterVenues = venues.where((venue) {
    String name = removeDiacritics(venue['name'].replaceAll(' ', '').toLowerCase());
    String sub = removeDiacritics(venue['sports'].replaceAll(' ', '').toLowerCase());
    return name.contains(search) || sub.contains(search);
  }).toList();
  filterVenues.sort((a,b) {
    return a['name'].compareTo(b['name']);
 });
 return filterVenues;
}

class _SettingsState extends State<JO> {
  List venues = [
    {
      'name': 'Pont Alexandre III',
      'icon': NavikaIcons.swiming,
      'sports': 'Cyclisme sur route - arrivée Contre-la-montre (CRD), Natation marathon (OWS), Triathlon (TRI), Para Triathlon (PTRI)',
      'coord': {'lat': '48.8637', 'lon': '2.3134'}
    },
    {
      'name': 'Arena Bercy',
      'icon': NavikaIcons.basketball,
      'sports': 'Basketball (BKB), Gymnastique artistique (GAR), Gymnastique trampoline (GTR), Basketball fauteuil (PWBK)',
      'coord': {'lat': '48.83863', 'lon': '2.378597'}
    },
    {
      'name': 'Arena Champ de Mars',
      'icon': NavikaIcons.sport,
      'sports': 'Judo (JUD), Lutte (WRE), Para Judo (PJUD), Rugby fauteuil (PWRU)',
      'coord': {'lat': '48.8531', 'lon': '2.30252'}
    },
    {
      'name': 'Arena Porte de la Chapelle',
      'icon': NavikaIcons.badminton,
      'sports': 'Badminton (BDM), Gymnastique rythmique (GRY), Para badminton (PBDM), Para Haltérophilie (PPWL)',
      'coord': {'lat': '48.8997292', 'lon': '2.3605141'}
    },
    {
      'name': 'Clichy-sous-Bois',
      'icon': NavikaIcons.biking,
      'sports': 'Para cyclisme sur route (PCRD)',
      'coord': {'lat': '48.906345', 'lon': '2.553544'}
    },
    {
      'name': 'Paris La Défense Arena',
      'icon': NavikaIcons.swiming,
      'sports': 'Natation (SWM), Water-polo (WPO), Para Natation (PSWM)',
      'coord': {'lat': '48.8954', 'lon': '2.2294'}
    },
    {
      'name': 'Grand Palais',
      'icon': NavikaIcons.sport,
      'sports': 'Escrime (FEN), Taekwondo (TKW), Escrime fauteuil (PWFE), Para Taekwondo (PTKW)',
      'coord': {'lat': '48.86616355', 'lon': '2.3125474'}
    },
    {
      'name': 'Hôtel de Ville',
      'icon': NavikaIcons.running,
      'sports': 'Athlétisme - départ Marathon (ATM)',
      'coord': {'lat': '48.8563881', 'lon': '2.35222203'}
    },
    {
      'name': 'Arena Paris Nord',
      'icon': NavikaIcons.sport,
      'sports': 'Boxe (BOX), Pentathlon moderne (MDN), Volleyball assis (PVBS)',
      'coord': {'lat': '48.9721', 'lon': '2.5149'}
    },
    {
      'name': 'Parc des Princes',
      'icon': NavikaIcons.foot,
      'sports': 'Football (FBL)',
      'coord': {'lat': '48.84156974', 'lon': '2.253048697'}
    },
    {
      'name': 'Stade Roland Garros',
      'icon': NavikaIcons.tennis,
      'sports': 'Tennis (TEN), Boxe (BOX), Tennis fauteuil (PWTE)',
      'coord': {'lat': '48.845968', 'lon': '2.253522'}
    },
    {
      'name': 'Arena Paris Sud 1',
      'icon': NavikaIcons.volley,
      'sports': 'Volley-ball (VVO), Boccia (PBOC)',
      'coord': {'lat': '48.832968', 'lon': '2.2840069'}
    },
    {
      'name': 'Château de Versailles',
      'icon': NavikaIcons.horse,
      'sports': 'Sports équestres - dressage (EQD), Sports équestres - concours complet (EQE), Sports équestres - saut d’obstacles (EQJ), Pentathlon moderne (MPN), Para Equitation (PEQU)',
      'coord': {'lat': '48.81432266', 'lon': '2.08452588'}
    },
    {
      'name': "Stade nautique de Vaires-sur-Marne - stade d'eaux vives",
      'icon': NavikaIcons.rafting,
      'sports': 'Canoë-kayak slalom (CSL)',
      'coord': {'lat': '48.86223209583829', 'lon': '2.6395463613678416'}
    },
    {
      'name': 'Centre Aquatique',
      'icon': NavikaIcons.swiming,
      'sports': 'Natation artistique (SWA), Plongeon (DIV), Water-polo (WPO)',
      'coord': {'lat': '48.923723', 'lon': '2.35578'}
    },
    {
      'name': 'Colline d’Elancourt',
      'icon': NavikaIcons.biking,
      'sports': 'Cyclisme VTT (MTB)',
      'coord': {'lat': '48.78981063', 'lon': '1.9642379'}
    },
    {
      'name': 'La Concorde 1',
      'icon': NavikaIcons.basketball,
      'sports': 'Basketball 3x3 (BK3), Breaking (BKG)',
      'coord': {'lat': '48.86640642', 'lon': '2.32119515'}
    },
    {
      'name': 'La Concorde 2',
      'icon': NavikaIcons.biking,
      'sports': 'BMX freestyle (BMF)',
      'coord': {'lat': '48.86504456', 'lon': '2.32119516'}
    },
    {
      'name': 'La Concorde 3',
      'icon': NavikaIcons.skate,
      'sports': 'Skateboard (SKB)',
      'coord': {'lat': '48.86486788', 'lon': '2.32139191'}
    },
    {
      'name': 'La Courneuve',
      'icon': NavikaIcons.running,
      'sports': 'Para Athlétisme - départ Marathon (PATM)',
      'coord': {'lat': '48.9372382', 'lon': '2.3994101'}
    },
    {
      'name': 'Stade de France',
      'icon': NavikaIcons.running,
      'sports': 'Athlétisme (ATH), Rugby à 7 (RU7), Cérémonie de clôture (OCC), Para Athlétisme (PATH), Cérémonie de clôture Paralympique (PCC)',
      'coord': {'lat': '48.924475', 'lon': '2.360127'}
    },
    {
      'name': 'Trocadéro',
      'icon': NavikaIcons.biking,
      'sports': 'Athlétisme marche (ATW), Cyclisme sur route - Course sur route (CRD)',
      'coord': {'lat': '48.85972558', 'lon': '2.29221884'}
    },
    {
      'name': 'Vélodrome National de Saint-Quentin-en-Yvelines',
      'icon': NavikaIcons.biking,
      'sports': 'Cyclisme sur piste (CTR), Para Cyclisme sur piste (PCTR)',
      'coord': {'lat': '48.78800979', 'lon': '2.03498269'}
    },
    {
      'name': 'Stade BMX de Saint-Quentin-en-Yvelines',
      'icon': NavikaIcons.biking,
      'sports': 'BMX Racing (BMX)',
      'coord': {'lat': '48.78800979', 'lon': '2.03498269'}
    },
    {
      'name': 'Stade Tour Eiffel',
      'icon': NavikaIcons.volley,
      'sports': 'Volley-ball de plage (VBV), Cécifoot (PFBB)',
      'coord': {'lat': '48.85613', 'lon': '2.2978'}
    },
    {
      'name': 'Invalides',
      'icon': NavikaIcons.biking,
      'sports': 'Athlétisme - arrivée Marathon (ATM), Cyclisme sur route - départ Contre-la-montre (CRD) Tir à l’arc (ARC), Para Tir à l’arc (PARC), Para Athlétisme - arrivée Marathon (PATM)',
      'coord': {'lat': '48.85704803', 'lon': '2.312835932'}
    },
    {
      'name': 'Site d’escalade du Bourget',
      'icon': NavikaIcons.climbing,
      'sports': 'Escalade (CLB)',
      'coord': {'lat': '48.93693402', 'lon': '2.41997931'}
    },
    {
      'name': 'La Concorde 4',
      'icon': NavikaIcons.skate,
      'sports': 'Skateboard (SKB)',
      'coord': {'lat': '48.86573765', 'lon': '2.3220383'}
    },
    {
      'name': 'La Concorde',
      'icon': NavikaIcons.stars,
      'sports': "Cérémonie d'ouverture Paralympique (POC)",
      'coord': {'lat': '48.86570357457259', 'lon': '2.321214226315764'}
    },
    {
      'name': 'Golf National',
      'icon': NavikaIcons.golf,
      'sports': 'Golf (GLF)',
      'coord': {'lat': '48.7532', 'lon': '2.0758'}
    },
    {
      'name': 'Arena Paris Sud 4',
      'icon': NavikaIcons.table_tennis,
      'sports': 'Tennis de table (TTE), Tennis de table para (PTTE)',
      'coord': {'lat': '48.830184', 'lon': '2.289033'}
    },
    {
      'name': 'Arena Paris Sud 6',
      'icon': NavikaIcons.basketball,
      'sports': 'Handball (HBL), Haltérophilie (WLF), Goalball (PGBL)',
      'coord': {'lat': '48.829381', 'lon': '2.290865'}
    },
    {
      'name': "Stade nautique de Vaires-sur-Marne - bassin d'eaux calmes",
      'icon': NavikaIcons.boat,
      'sports': 'Aviron (ROW), Canoë - course en ligne (CSP), Para Aviron (PROW), Para Canoë (PCSP)',
      'coord': {'lat': '48.8623', 'lon': '2.6348'}
    },
    {
      'name': 'Stade Yves-du-Manoir',
      'icon': NavikaIcons.sport,
      'sports': 'Hockey (HOC)',
      'coord': {'lat': '48.92934371', 'lon': '2.24777122'}
    }
  ];

  TextEditingController textController = TextEditingController();
  FocusNode textFieldNode = FocusNode();
  String search = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(textFieldNode);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff391674),
          title: TextField(
            controller: textController,
            focusNode: textFieldNode,
            style: const TextStyle(color: Color(0xffffffff)),
            decoration: const InputDecoration(
                hintStyle: TextStyle(color: Color(0xffffffff)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffffffff)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffffffff)),
                ),
                hintText: 'Rechercher un site, un sport, un événement...'),
            onChanged: (text) {
              setState(() {
                search = text;
              });
            },
          ),
          leading: closeLeadingAppBar(context),
        ),
        backgroundColor: const Color(0xff391674),
        body: ListView(
          children: [
            if (filterVenues(venues, search).isEmpty)
              PlacesEmpty(
                color: const Color(0xffffffff),
              ),
            for (var venue in filterVenues(venues, search))
              SettingsButton(
                name: venue['name'],
                sub: venue['sports'],
                icon: venue['icon'],
                function: () {
                  RouteStateScope.of(context).go('/address/${venue['coord']['lat']};${venue['coord']['lon']}');
                },
              ),
            
          ],
        ),
      );
}
