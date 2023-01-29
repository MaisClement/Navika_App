
class LinesInfo {
  final lines = <Info>[]; 

  void addLine(String id, String name, String libelle, String image, String mode, String imageModeDark, String imageModeWhite) {
    var line = Info(id, name, libelle, image, mode, imageModeDark, imageModeWhite);
    lines.add(line);
  }

  void reset(){
    lines.clear();
  }

  bool isLineById(id) {
    for (var line in lines) {
      if (line.id == id) return true;
    }
    return false;
  }

  Info getLinesById(id) {
    for (var line in lines) {
      if (line.id == id) return line;
    }
    return lines[0];
  }

  Info getLines(name) {
    for (var line in lines) {
      if (line.name == name) {
        return line;
      }
    }
    return lines[0];
  }
}

class Info {
  final String id;
  final String name;
  final String libelle;
  final String image;
  final String mode;
  final String imageModeDark;
  final String imageModeWhite;

  Info(this.id, this.name, this.libelle, this.image, this.mode, this.imageModeDark, this.imageModeWhite);
}

final LINES = LinesInfo()
..addLine('0', '', '','assets/null.png', '0','assets/null.png','assets/null.png')
..addLine('C01742', 'RER A', 'RER A','assets/icons/lines_small/RER_A.png', 'RER','assets/icons/RER_dark.png','assets/icons/RER_white.png')
..addLine('C01743', 'RER B', 'RER B','assets/icons/lines_small/RER_B.png', 'RER','assets/icons/RER_dark.png','assets/icons/RER_white.png')
..addLine('C01727', 'RER C', 'RER C','assets/icons/lines_small/RER_C.png', 'RER','assets/icons/RER_dark.png','assets/icons/RER_white.png')
..addLine('C01728', 'RER D', 'RER D','assets/icons/lines_small/RER_D.png', 'RER','assets/icons/RER_dark.png','assets/icons/RER_white.png')
..addLine('C01729', 'RER E', 'RER E','assets/icons/lines_small/RER_E.png', 'RER','assets/icons/RER_dark.png','assets/icons/RER_white.png')

..addLine('C01371', 'METRO 1',  'Métro 1', 'assets/icons/lines_small/METRO_1.png',   'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01372', 'METRO 2',  'Métro 2', 'assets/icons/lines_small/METRO_2.png',   'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01373', 'METRO 3',  'Métro 3', 'assets/icons/lines_small/METRO_3.png',   'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01386', 'METRO 3B', 'Métro 3B','assets/icons/lines_small/METRO_3b.png',  'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01374', 'METRO 4',  'Métro 4', 'assets/icons/lines_small/METRO_4.png',   'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01375', 'METRO 5',  'Métro 5', 'assets/icons/lines_small/METRO_5.png',   'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01376', 'METRO 6',  'Métro 6', 'assets/icons/lines_small/METRO_6.png',   'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01377', 'METRO 7',  'Métro 7', 'assets/icons/lines_small/METRO_7.png',   'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01387', 'METRO 7B', 'Métro 7B','assets/icons/lines_small/METRO_7b.png',  'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01378', 'METRO 8',  'Métro 8', 'assets/icons/lines_small/METRO_8.png',   'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01379', 'METRO 9',  'Métro 9', 'assets/icons/lines_small/METRO_9.png',   'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01380', 'METRO 10', 'Métro 10','assets/icons/lines_small/METRO_10.png',  'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01381', 'METRO 11', 'Métro 11','assets/icons/lines_small/METRO_11.png',  'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01382', 'METRO 12', 'Métro 12','assets/icons/lines_small/METRO_12.png',  'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01383', 'METRO 13', 'Métro 13','assets/icons/lines_small/METRO_13.png',  'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')
..addLine('C01384', 'METRO 14', 'Métro 14','assets/icons/lines_small/METRO_14.png',  'METRO','assets/icons/METRO_dark.png','assets/icons/METRO_white.png')

..addLine('C01388', 'Orly val', 'Orly val','assets/val/lines/ORLYVAL.png',  'VAL','assets/null.png','assets/null.png')
..addLine('C00563', 'CDG Val', 'CDG Val','assets/val/lines/CDGVAL.png',  'VAL','assets/null.png','assets/null.png')

..addLine('C01389', 'T1', 'Tram T1',   'assets/icons/lines_small/TRAM_T1.png',  'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C01390', 'T2', 'Tram T2',   'assets/icons/lines_small/TRAM_T2.png',  'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C01391', 'T3A', 'Tram T3a', 'assets/icons/lines_small/TRAM_T3a.png', 'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C01679', 'T3B', 'Tram T3b', 'assets/icons/lines_small/TRAM_T3b.png', 'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C01843', 'T4', 'Tram T4',   'assets/icons/lines_small/TRAM_T4.png',  'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C01684', 'T5', 'Tram T5',   'assets/icons/lines_small/TRAM_T5.png',  'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C01794', 'T6', 'Tram T6',   'assets/icons/lines_small/TRAM_T6.png',  'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C01774', 'T7', 'Tram T7',   'assets/icons/lines_small/TRAM_T7.png',  'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C01795', 'T8', 'Tram T8',   'assets/icons/lines_small/TRAM_T8.png',  'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C02317', 'T9', 'Tram T9',   'assets/icons/lines_small/TRAM_T9.png',  'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C01999', 'T11', 'Tram T11', 'assets/icons/lines_small/TRAM_T11.png', 'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')
..addLine('C02344', 'T13', 'Tram T13', 'assets/icons/lines_small/TRAM_T13.png', 'TRAM','assets/icons/TRAM_dark.png','assets/icons/TRAM_white.png')

..addLine('C01737', 'TRANSILIEN H', 'Transilien H','assets/icons/lines_small/TRAIN_H.png', 'TRAIN','assets/icons/TRAIN_dark.png','assets/icons/TRAIN_white.png')
..addLine('C01739', 'TRANSILIEN J', 'Transilien J','assets/icons/lines_small/TRAIN_J.png', 'TRAIN','assets/icons/TRAIN_dark.png','assets/icons/TRAIN_white.png')
..addLine('C01738', 'TRANSILIEN K', 'Transilien K','assets/icons/lines_small/TRAIN_K.png', 'TRAIN','assets/icons/TRAIN_dark.png','assets/icons/TRAIN_white.png')
..addLine('C01740', 'TRANSILIEN L', 'Transilien L','assets/icons/lines_small/TRAIN_L.png', 'TRAIN','assets/icons/TRAIN_dark.png','assets/icons/TRAIN_white.png')
..addLine('C01736', 'TRANSILIEN N', 'Transilien N','assets/icons/lines_small/TRAIN_N.png', 'TRAIN','assets/icons/TRAIN_dark.png','assets/icons/TRAIN_white.png')
..addLine('C01730', 'TRANSILIEN P', 'Transilien P','assets/icons/lines_small/TRAIN_P.png', 'TRAIN','assets/icons/TRAIN_dark.png','assets/icons/TRAIN_white.png')
..addLine('C01731', 'TRANSILIEN R', 'Transilien R','assets/icons/lines_small/TRAIN_R.png', 'TRAIN','assets/icons/TRAIN_dark.png','assets/icons/TRAIN_white.png')
..addLine('C01741', 'TRANSILIEN U', 'Transilien U','assets/icons/lines_small/TRAIN_U.png', 'TRAIN','assets/icons/TRAIN_dark.png','assets/icons/TRAIN_white.png')

..addLine('C01648', 'N133', 'N133','assets/noctilien/NOCT_133.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01396', 'N42', 'N42',  'assets/noctilien/NOCT_42.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01393', 'N52', 'N52',  'assets/noctilien/NOCT_52.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01401', 'N21', 'N21',  'assets/noctilien/NOCT_21.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01404', 'N32', 'N32',  'assets/noctilien/NOCT_32.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01406', 'N43', 'N43',  'assets/noctilien/NOCT_43.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01410', 'N71', 'N71',  'assets/noctilien/NOCT_71.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01418', 'N14', 'N14',  'assets/noctilien/NOCT_14.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01807', 'N66', 'N66',  'assets/noctilien/NOCT_66.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01633', 'N132', 'N132','assets/noctilien/NOCT_132.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01639', 'N141', 'N141','assets/noctilien/NOCT_141.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01646', 'N145', 'N145','assets/noctilien/NOCT_145.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01413', 'N01', 'N01',  'assets/noctilien/NOCT_01.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01414', 'N02', 'N02',  'assets/noctilien/NOCT_02.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01636', 'N131', 'N131','assets/noctilien/NOCT_131.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01397', 'N23', 'N23',  'assets/noctilien/NOCT_23.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01398', 'N34', 'N34',  'assets/noctilien/NOCT_34.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01400', 'N31', 'N31',  'assets/noctilien/NOCT_31.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01405', 'N45', 'N45',  'assets/noctilien/NOCT_45.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01409', 'N53', 'N53',  'assets/noctilien/NOCT_53.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01416', 'N16', 'N16',  'assets/noctilien/NOCT_16.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01421', 'N122', 'N122','assets/noctilien/NOCT_122.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01638', 'N140', 'N140','assets/noctilien/NOCT_140.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01392', 'N24', 'N24',  'assets/noctilien/NOCT_24.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01395', 'N44', 'N44',  'assets/noctilien/NOCT_44.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01403', 'N62', 'N62',  'assets/noctilien/NOCT_62.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01407', 'N22', 'N22',  'assets/noctilien/NOCT_22.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01412', 'N35', 'N35',  'assets/noctilien/NOCT_35.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01417', 'N15', 'N15',  'assets/noctilien/NOCT_15.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01422', 'N153', 'N153','assets/noctilien/NOCT_153.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01637', 'N150', 'N150','assets/noctilien/NOCT_150.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01641', 'N152', 'N152','assets/noctilien/NOCT_152.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01643', 'N135', 'N135','assets/noctilien/NOCT_135.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01644', 'N143', 'N143','assets/noctilien/NOCT_143.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01399', 'N33', 'N33',  'assets/noctilien/NOCT_33.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01402', 'N61', 'N61',  'assets/noctilien/NOCT_61.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01415', 'N11', 'N11',  'assets/noctilien/NOCT_11.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01635', 'N151', 'N151','assets/noctilien/NOCT_151.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01642', 'N134', 'N134','assets/noctilien/NOCT_134.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01645', 'N144', 'N144','assets/noctilien/NOCT_144.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01634', 'N130', 'N130','assets/noctilien/NOCT_130.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01394', 'N51', 'N51',  'assets/noctilien/NOCT_51.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01408', 'N63', 'N63',  'assets/noctilien/NOCT_63.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01411', 'N41', 'N41',  'assets/noctilien/NOCT_41.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01419', 'N13', 'N13',  'assets/noctilien/NOCT_13.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01420', 'N12', 'N12',  'assets/noctilien/NOCT_12.png',   'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01640', 'N142', 'N142','assets/noctilien/NOCT_142.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')
..addLine('C01647', 'N154', 'N154','assets/noctilien/NOCT_154.png',  'NOCTILIEN','assets/icons/NOCTILIEN_dark.png','assets/noctilien_white.png')

..addLine('C01744', 'TER', 'TER Centre - Val de Loire','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('C01863', 'TER', 'TER Hauts-de-France','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('C01747', 'TER', 'TER Grand-Est','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('C02375', 'TER', 'TER Normandie','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('C01745', 'TER', 'TER Bourgogne - Franche-Comté','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('C02368', 'TER', 'TER Centre - Val de Loire','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('C02372', 'TER', 'TER Hauts-de-France','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('C02370', 'TER', 'TER Normandie','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('C01748', 'TER', 'TER Normandie','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('C01857', 'TER', 'TER Centre - Val-de-Loire','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('C01746', 'TER', 'TER Hauts-de-Franche','assets/sncf/TER_color.png',  'TER','assets/sncf/TER_dark.png','assets/sncf/TER_white.png')

..addLine('TER', 'TER', 'TER','assets/sncf/TER_color.png',  'TER', 'assets/sncf/TER_dark.png','assets/sncf/TER_white.png')
..addLine('SNCF', 'SNCF', 'Trains SNCF','assets/null.png',  'SNCF','assets/sncf/logo_color.png','assets/sncf/logo_white.png')
;