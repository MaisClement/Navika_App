import 'package:flutter/cupertino.dart';
import 'package:quiver/strings.dart';

class Lines_Info {
  final lines = <Info>[]; 

  void addLine(String id, String name, String libelle, AssetImage image, String mode, AssetImage image_mode_dark, AssetImage image_mode_white) {
    var line = Info(id, name, libelle, image, mode, image_mode_dark, image_mode_white);
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
      if (line.name == name) return line;
    }
    return lines[0];
  }
}

class Info {
  final String id;
  final String name;
  final String libelle;
  final AssetImage image;
  final String mode;
  final AssetImage image_mode_dark;
  final AssetImage image_mode_white;

  Info(this.id, this.name, this.libelle, this.image, this.mode, this.image_mode_dark, this.image_mode_white);
}

final LINES = Lines_Info()
..addLine('0', '0', '0', AssetImage('assets/null.png'), '0', AssetImage('assets/null.png'), AssetImage('assets/null.png'))
..addLine('C01742', 'RER A', 'RER A', AssetImage('assets/idfm/lines_dark_small/RER_A.png'), 'RER', AssetImage('assets/idfm/RER_dark.png'), AssetImage('assets/idfm/RER_white.png'))
..addLine('C01743', 'RER B', 'RER B', AssetImage('assets/idfm/lines_dark_small/RER_B.png'), 'RER', AssetImage('assets/idfm/RER_dark.png'), AssetImage('assets/idfm/RER_white.png'))
..addLine('C01727', 'RER C', 'RER C', AssetImage('assets/idfm/lines_dark_small/RER_C.png'), 'RER', AssetImage('assets/idfm/RER_dark.png'), AssetImage('assets/idfm/RER_white.png'))
..addLine('C01728', 'RER D', 'RER D', AssetImage('assets/idfm/lines_dark_small/RER_D.png'), 'RER', AssetImage('assets/idfm/RER_dark.png'), AssetImage('assets/idfm/RER_white.png'))
..addLine('C01729', 'RER E', 'RER E', AssetImage('assets/idfm/lines_dark_small/RER_E.png'), 'RER', AssetImage('assets/idfm/RER_dark.png'), AssetImage('assets/idfm/RER_white.png'))

..addLine('C01371', 'METRO 1',  'Métro 1',  AssetImage('assets/idfm/lines_dark_small/METRO_1.png'),   'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01372', 'METRO 2',  'Métro 2',  AssetImage('assets/idfm/lines_dark_small/METRO_2.png'),   'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01373', 'METRO 3',  'Métro 3',  AssetImage('assets/idfm/lines_dark_small/METRO_3.png'),   'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01386', 'METRO 3B', 'Métro 3B', AssetImage('assets/idfm/lines_dark_small/METRO_3bis.png'),  'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01374', 'METRO 4',  'Métro 4',  AssetImage('assets/idfm/lines_dark_small/METRO_4.png'),   'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01375', 'METRO 5',  'Métro 5',  AssetImage('assets/idfm/lines_dark_small/METRO_5.png'),   'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01376', 'METRO 6',  'Métro 6',  AssetImage('assets/idfm/lines_dark_small/METRO_6.png'),   'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01377', 'METRO 7',  'Métro 7',  AssetImage('assets/idfm/lines_dark_small/METRO_7.png'),   'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01387', 'METRO 7B', 'Métro 7B', AssetImage('assets/idfm/lines_dark_small/METRO_7bis.png'),  'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01378', 'METRO 8',  'Métro 8',  AssetImage('assets/idfm/lines_dark_small/METRO_8.png'),   'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01379', 'METRO 9',  'Métro 9',  AssetImage('assets/idfm/lines_dark_small/METRO_9.png'),   'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01380', 'METRO 10', 'Métro 10', AssetImage('assets/idfm/lines_dark_small/METRO_10.png'),  'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01381', 'METRO 11', 'Métro 11', AssetImage('assets/idfm/lines_dark_small/METRO_11.png'),  'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01382', 'METRO 12', 'Métro 12', AssetImage('assets/idfm/lines_dark_small/METRO_12.png'),  'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01383', 'METRO 13', 'Métro 13', AssetImage('assets/idfm/lines_dark_small/METRO_13.png'),  'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))
..addLine('C01384', 'METRO 14', 'Métro 14', AssetImage('assets/idfm/lines_dark_small/METRO_14.png'),  'METRO', AssetImage('assets/idfm/METRO_dark.png'), AssetImage('assets/idfm/METRO_white.png'))

..addLine('C01388', 'Orly val', 'Orly val', AssetImage('assets/val/lines_small/ORLYVAL.png'),  'VAL', AssetImage('assets/null.png'), AssetImage('assets/null.png'))
..addLine('C00563', 'CDG Val', 'CDG Val', AssetImage('assets/val/lines_small/CDGVAL.png'),  'VAL', AssetImage('assets/null.png'), AssetImage('assets/null.png'))

..addLine('C01389', 'T1', 'Tram T1',    AssetImage('assets/idfm/lines_dark_small/TRAM_T1.png'),  'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C01390', 'T2', 'Tram T2',    AssetImage('assets/idfm/lines_dark_small/TRAM_T2.png'),  'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C01391', 'T3A', 'Tram T3a',  AssetImage('assets/idfm/lines_dark_small/TRAM_T3a.png'), 'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C01679', 'T3B', 'Tram T3b',  AssetImage('assets/idfm/lines_dark_small/TRAM_T3b.png'), 'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C01843', 'T4', 'Tram T4',    AssetImage('assets/idfm/lines_dark_small/TRAM_T4.png'),  'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C01684', 'T5', 'Tram T5',    AssetImage('assets/idfm/lines_dark_small/TRAM_T5.png'),  'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C01794', 'T6', 'Tram T6',    AssetImage('assets/idfm/lines_dark_small/TRAM_T6.png'),  'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C01774', 'T7', 'Tram T7',    AssetImage('assets/idfm/lines_dark_small/TRAM_T7.png'),  'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C01795', 'T8', 'Tram T8',    AssetImage('assets/idfm/lines_dark_small/TRAM_T8.png'),  'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C02317', 'T9', 'Tram T9',    AssetImage('assets/idfm/lines_dark_small/TRAM_T9.png'),  'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C01999', 'T11', 'Tram T11',  AssetImage('assets/idfm/lines_dark_small/TRAM_T11.png'), 'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))
..addLine('C02344', 'T13', 'Tram T13',  AssetImage('assets/idfm/lines_dark_small/TRAM_T13.png'), 'TRAM', AssetImage('assets/idfm/TRAM_dark.png'), AssetImage('assets/idfm/TRAM_white.png'))

..addLine('C01737', 'TRANSILIEN H', 'Transilien H', AssetImage('assets/idfm/lines_dark_small/TRAIN_H.png'), 'TRAIN', AssetImage('assets/idfm/TRAIN_dark.png'), AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('C01739', 'TRANSILIEN J', 'Transilien J', AssetImage('assets/idfm/lines_dark_small/TRAIN_J.png'), 'TRAIN', AssetImage('assets/idfm/TRAIN_dark.png'), AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('C01738', 'TRANSILIEN K', 'Transilien K', AssetImage('assets/idfm/lines_dark_small/TRAIN_K.png'), 'TRAIN', AssetImage('assets/idfm/TRAIN_dark.png'), AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('C01740', 'TRANSILIEN L', 'Transilien L', AssetImage('assets/idfm/lines_dark_small/TRAIN_L.png'), 'TRAIN', AssetImage('assets/idfm/TRAIN_dark.png'), AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('C01736', 'TRANSILIEN N', 'Transilien N', AssetImage('assets/idfm/lines_dark_small/TRAIN_N.png'), 'TRAIN', AssetImage('assets/idfm/TRAIN_dark.png'), AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('C01730', 'TRANSILIEN P', 'Transilien P', AssetImage('assets/idfm/lines_dark_small/TRAIN_P.png'), 'TRAIN', AssetImage('assets/idfm/TRAIN_dark.png'), AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('C01731', 'TRANSILIEN R', 'Transilien R', AssetImage('assets/idfm/lines_dark_small/TRAIN_R.png'), 'TRAIN', AssetImage('assets/idfm/TRAIN_dark.png'), AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('C01741', 'TRANSILIEN U', 'Transilien U', AssetImage('assets/idfm/lines_dark_small/TRAIN_U.png'), 'TRAIN', AssetImage('assets/idfm/TRAIN_dark.png'), AssetImage('assets/idfm/TRAIN_white.png'))

..addLine('C01648', 'N133', 'N133', AssetImage('assets/noctilien/NOCT_133.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01396', 'N42', 'N42',   AssetImage('assets/noctilien/NOCT_42.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01393', 'N52', 'N52',   AssetImage('assets/noctilien/NOCT_52.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01401', 'N21', 'N21',   AssetImage('assets/noctilien/NOCT_21.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01404', 'N32', 'N32',   AssetImage('assets/noctilien/NOCT_32.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01406', 'N43', 'N43',   AssetImage('assets/noctilien/NOCT_43.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01410', 'N71', 'N71',   AssetImage('assets/noctilien/NOCT_71.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01418', 'N14', 'N14',   AssetImage('assets/noctilien/NOCT_14.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01807', 'N66', 'N66',   AssetImage('assets/noctilien/NOCT_66.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01633', 'N132', 'N132', AssetImage('assets/noctilien/NOCT_132.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01639', 'N141', 'N141', AssetImage('assets/noctilien/NOCT_141.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01646', 'N145', 'N145', AssetImage('assets/noctilien/NOCT_145.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01413', 'N01', 'N01',   AssetImage('assets/noctilien/NOCT_01.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01414', 'N02', 'N02',   AssetImage('assets/noctilien/NOCT_02.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01636', 'N131', 'N131', AssetImage('assets/noctilien/NOCT_131.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01397', 'N23', 'N23',   AssetImage('assets/noctilien/NOCT_23.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01398', 'N34', 'N34',   AssetImage('assets/noctilien/NOCT_34.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01400', 'N31', 'N31',   AssetImage('assets/noctilien/NOCT_31.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01405', 'N45', 'N45',   AssetImage('assets/noctilien/NOCT_45.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01409', 'N53', 'N53',   AssetImage('assets/noctilien/NOCT_53.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01416', 'N16', 'N16',   AssetImage('assets/noctilien/NOCT_16.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01421', 'N122', 'N122', AssetImage('assets/noctilien/NOCT_122.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01638', 'N140', 'N140', AssetImage('assets/noctilien/NOCT_140.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01392', 'N24', 'N24',   AssetImage('assets/noctilien/NOCT_24.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01395', 'N44', 'N44',   AssetImage('assets/noctilien/NOCT_44.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01403', 'N62', 'N62',   AssetImage('assets/noctilien/NOCT_62.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01407', 'N22', 'N22',   AssetImage('assets/noctilien/NOCT_22.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01412', 'N35', 'N35',   AssetImage('assets/noctilien/NOCT_35.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01417', 'N15', 'N15',   AssetImage('assets/noctilien/NOCT_15.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01422', 'N153', 'N153', AssetImage('assets/noctilien/NOCT_153.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01637', 'N150', 'N150', AssetImage('assets/noctilien/NOCT_150.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01641', 'N152', 'N152', AssetImage('assets/noctilien/NOCT_152.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01643', 'N135', 'N135', AssetImage('assets/noctilien/NOCT_135.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01644', 'N143', 'N143', AssetImage('assets/noctilien/NOCT_143.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01399', 'N33', 'N33',   AssetImage('assets/noctilien/NOCT_33.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01402', 'N61', 'N61',   AssetImage('assets/noctilien/NOCT_61.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01415', 'N11', 'N11',   AssetImage('assets/noctilien/NOCT_11.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01635', 'N151', 'N151', AssetImage('assets/noctilien/NOCT_151.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01642', 'N134', 'N134', AssetImage('assets/noctilien/NOCT_134.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01645', 'N144', 'N144', AssetImage('assets/noctilien/NOCT_144.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01634', 'N130', 'N130', AssetImage('assets/noctilien/NOCT_130.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01394', 'N51', 'N51',   AssetImage('assets/noctilien/NOCT_51.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01408', 'N63', 'N63',   AssetImage('assets/noctilien/NOCT_63.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01411', 'N41', 'N41',   AssetImage('assets/noctilien/NOCT_41.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01419', 'N13', 'N13',   AssetImage('assets/noctilien/NOCT_13.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01420', 'N12', 'N12',   AssetImage('assets/noctilien/NOCT_12.png'),   'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01640', 'N142', 'N142', AssetImage('assets/noctilien/NOCT_142.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('C01647', 'N154', 'N154', AssetImage('assets/noctilien/NOCT_154.png'),  'NOCTILIEN', AssetImage('assets/idfm/NOCTILIEN_dark.png'), AssetImage('assets/idfm/NOCTILIEN_white.png'))

..addLine('C01744', 'TER', 'TER Centre - Val de Loire', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
..addLine('C01863', 'TER', 'TER Hauts-de-France', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
..addLine('C01747', 'TER', 'TER Grand-Est', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
..addLine('C02375', 'TER', 'TER Normandie', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
..addLine('C01745', 'TER', 'TER Bourgogne - Franche-Comté', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
..addLine('C02368', 'TER', 'TER Centre - Val de Loire', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
..addLine('C02372', 'TER', 'TER Hauts-de-France', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
..addLine('C02370', 'TER', 'TER Normandie', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
..addLine('C01748', 'TER', 'TER Normandie', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
..addLine('C01857', 'TER', 'TER Centre - Val-de-Loire', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
..addLine('C01746', 'TER', 'TER Hauts-de-Franche', AssetImage('assets/null.png'),  'TER', AssetImage('assets/sncf/TER_dark.png'), AssetImage('assets/sncf/TER_white.png'))
;