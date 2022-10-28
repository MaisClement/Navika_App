import 'package:flutter/cupertino.dart';

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
      if (line.name == name) {
        print ({name, line.id});
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
  final AssetImage image;
  final String mode;
  final AssetImage image_mode_dark;
  final AssetImage image_mode_white;

  Info(this.id, this.name, this.libelle, this.image, this.mode, this.image_mode_dark, this.image_mode_white);
}

final LINES = Lines_Info()
..addLine('IDFM:0', '0', '0', const AssetImage('assets/null.png'), '0', const AssetImage('assets/null.png'), const AssetImage('assets/null.png'))
..addLine('IDFM:C01742', 'RER A', 'RER A', const AssetImage('assets/idfm/lines_dark_small/RER_A.png'), 'RER', const AssetImage('assets/idfm/RER_dark.png'), const AssetImage('assets/idfm/RER_white.png'))
..addLine('IDFM:C01743', 'RER B', 'RER B', const AssetImage('assets/idfm/lines_dark_small/RER_B.png'), 'RER', const AssetImage('assets/idfm/RER_dark.png'), const AssetImage('assets/idfm/RER_white.png'))
..addLine('IDFM:C01727', 'RER C', 'RER C', const AssetImage('assets/idfm/lines_dark_small/RER_C.png'), 'RER', const AssetImage('assets/idfm/RER_dark.png'), const AssetImage('assets/idfm/RER_white.png'))
..addLine('IDFM:C01728', 'RER D', 'RER D', const AssetImage('assets/idfm/lines_dark_small/RER_D.png'), 'RER', const AssetImage('assets/idfm/RER_dark.png'), const AssetImage('assets/idfm/RER_white.png'))
..addLine('IDFM:C01729', 'RER E', 'RER E', const AssetImage('assets/idfm/lines_dark_small/RER_E.png'), 'RER', const AssetImage('assets/idfm/RER_dark.png'), const AssetImage('assets/idfm/RER_white.png'))

..addLine('IDFM:C01371', 'METRO 1',  'Métro 1',  const AssetImage('assets/idfm/lines_dark_small/METRO_1.png'),   'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01372', 'METRO 2',  'Métro 2',  const AssetImage('assets/idfm/lines_dark_small/METRO_2.png'),   'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01373', 'METRO 3',  'Métro 3',  const AssetImage('assets/idfm/lines_dark_small/METRO_3.png'),   'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01386', 'METRO 3B', 'Métro 3B', const AssetImage('assets/idfm/lines_dark_small/METRO_3b.png'),  'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01374', 'METRO 4',  'Métro 4',  const AssetImage('assets/idfm/lines_dark_small/METRO_4.png'),   'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01375', 'METRO 5',  'Métro 5',  const AssetImage('assets/idfm/lines_dark_small/METRO_5.png'),   'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01376', 'METRO 6',  'Métro 6',  const AssetImage('assets/idfm/lines_dark_small/METRO_6.png'),   'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01377', 'METRO 7',  'Métro 7',  const AssetImage('assets/idfm/lines_dark_small/METRO_7.png'),   'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01387', 'METRO 7B', 'Métro 7B', const AssetImage('assets/idfm/lines_dark_small/METRO_7b.png'),  'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01378', 'METRO 8',  'Métro 8',  const AssetImage('assets/idfm/lines_dark_small/METRO_8.png'),   'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01379', 'METRO 9',  'Métro 9',  const AssetImage('assets/idfm/lines_dark_small/METRO_9.png'),   'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01380', 'METRO 10', 'Métro 10', const AssetImage('assets/idfm/lines_dark_small/METRO_10.png'),  'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01381', 'METRO 11', 'Métro 11', const AssetImage('assets/idfm/lines_dark_small/METRO_11.png'),  'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01382', 'METRO 12', 'Métro 12', const AssetImage('assets/idfm/lines_dark_small/METRO_12.png'),  'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01383', 'METRO 13', 'Métro 13', const AssetImage('assets/idfm/lines_dark_small/METRO_13.png'),  'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))
..addLine('IDFM:C01384', 'METRO 14', 'Métro 14', const AssetImage('assets/idfm/lines_dark_small/METRO_14.png'),  'METRO', const AssetImage('assets/idfm/METRO_dark.png'), const AssetImage('assets/idfm/METRO_white.png'))

..addLine('IDFM:C01388', 'Orly val', 'Orly val', const AssetImage('assets/idfm/val/lines/ORLYVAL.png'),  'VAL', const AssetImage('assets/null.png'), const AssetImage('assets/null.png'))
..addLine('IDFM:C00563', 'CDG Val', 'CDG Val', const AssetImage('assets/idfm/val/lines/CDGVAL.png'),  'VAL', const AssetImage('assets/null.png'), const AssetImage('assets/null.png'))

..addLine('IDFM:C01389', 'T1', 'Tram T1',    const AssetImage('assets/idfm/lines_dark_small/TRAM_T1.png'),  'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C01390', 'T2', 'Tram T2',    const AssetImage('assets/idfm/lines_dark_small/TRAM_T2.png'),  'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C01391', 'T3A', 'Tram T3a',  const AssetImage('assets/idfm/lines_dark_small/TRAM_T3a.png'), 'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C01679', 'T3B', 'Tram T3b',  const AssetImage('assets/idfm/lines_dark_small/TRAM_T3b.png'), 'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C01843', 'T4', 'Tram T4',    const AssetImage('assets/idfm/lines_dark_small/TRAM_T4.png'),  'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C01684', 'T5', 'Tram T5',    const AssetImage('assets/idfm/lines_dark_small/TRAM_T5.png'),  'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C01794', 'T6', 'Tram T6',    const AssetImage('assets/idfm/lines_dark_small/TRAM_T6.png'),  'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C01774', 'T7', 'Tram T7',    const AssetImage('assets/idfm/lines_dark_small/TRAM_T7.png'),  'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C01795', 'T8', 'Tram T8',    const AssetImage('assets/idfm/lines_dark_small/TRAM_T8.png'),  'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C02317', 'T9', 'Tram T9',    const AssetImage('assets/idfm/lines_dark_small/TRAM_T9.png'),  'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C01999', 'T11', 'Tram T11',  const AssetImage('assets/idfm/lines_dark_small/TRAM_T11.png'), 'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))
..addLine('IDFM:C02344', 'T13', 'Tram T13',  const AssetImage('assets/idfm/lines_dark_small/TRAM_T13.png'), 'TRAM', const AssetImage('assets/idfm/TRAM_dark.png'), const AssetImage('assets/idfm/TRAM_white.png'))

..addLine('IDFM:C01737', 'TRANSILIEN H', 'Transilien H', const AssetImage('assets/idfm/lines_dark_small/TRAIN_H.png'), 'TRAIN', const AssetImage('assets/idfm/TRAIN_dark.png'), const AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('IDFM:C01739', 'TRANSILIEN J', 'Transilien J', const AssetImage('assets/idfm/lines_dark_small/TRAIN_J.png'), 'TRAIN', const AssetImage('assets/idfm/TRAIN_dark.png'), const AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('IDFM:C01738', 'TRANSILIEN K', 'Transilien K', const AssetImage('assets/idfm/lines_dark_small/TRAIN_K.png'), 'TRAIN', const AssetImage('assets/idfm/TRAIN_dark.png'), const AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('IDFM:C01740', 'TRANSILIEN L', 'Transilien L', const AssetImage('assets/idfm/lines_dark_small/TRAIN_L.png'), 'TRAIN', const AssetImage('assets/idfm/TRAIN_dark.png'), const AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('IDFM:C01736', 'TRANSILIEN N', 'Transilien N', const AssetImage('assets/idfm/lines_dark_small/TRAIN_N.png'), 'TRAIN', const AssetImage('assets/idfm/TRAIN_dark.png'), const AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('IDFM:C01730', 'TRANSILIEN P', 'Transilien P', const AssetImage('assets/idfm/lines_dark_small/TRAIN_P.png'), 'TRAIN', const AssetImage('assets/idfm/TRAIN_dark.png'), const AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('IDFM:C01731', 'TRANSILIEN R', 'Transilien R', const AssetImage('assets/idfm/lines_dark_small/TRAIN_R.png'), 'TRAIN', const AssetImage('assets/idfm/TRAIN_dark.png'), const AssetImage('assets/idfm/TRAIN_white.png'))
..addLine('IDFM:C01741', 'TRANSILIEN U', 'Transilien U', const AssetImage('assets/idfm/lines_dark_small/TRAIN_U.png'), 'TRAIN', const AssetImage('assets/idfm/TRAIN_dark.png'), const AssetImage('assets/idfm/TRAIN_white.png'))

..addLine('IDFM:C01648', 'N133', 'N133', const AssetImage('assets/idfm/noctilien/NOCT_133.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01396', 'N42', 'N42',   const AssetImage('assets/idfm/noctilien/NOCT_42.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01393', 'N52', 'N52',   const AssetImage('assets/idfm/noctilien/NOCT_52.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01401', 'N21', 'N21',   const AssetImage('assets/idfm/noctilien/NOCT_21.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01404', 'N32', 'N32',   const AssetImage('assets/idfm/noctilien/NOCT_32.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01406', 'N43', 'N43',   const AssetImage('assets/idfm/noctilien/NOCT_43.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01410', 'N71', 'N71',   const AssetImage('assets/idfm/noctilien/NOCT_71.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01418', 'N14', 'N14',   const AssetImage('assets/idfm/noctilien/NOCT_14.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01807', 'N66', 'N66',   const AssetImage('assets/idfm/noctilien/NOCT_66.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01633', 'N132', 'N132', const AssetImage('assets/idfm/noctilien/NOCT_132.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01639', 'N141', 'N141', const AssetImage('assets/idfm/noctilien/NOCT_141.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01646', 'N145', 'N145', const AssetImage('assets/idfm/noctilien/NOCT_145.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01413', 'N01', 'N01',   const AssetImage('assets/idfm/noctilien/NOCT_01.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01414', 'N02', 'N02',   const AssetImage('assets/idfm/noctilien/NOCT_02.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01636', 'N131', 'N131', const AssetImage('assets/idfm/noctilien/NOCT_131.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01397', 'N23', 'N23',   const AssetImage('assets/idfm/noctilien/NOCT_23.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01398', 'N34', 'N34',   const AssetImage('assets/idfm/noctilien/NOCT_34.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01400', 'N31', 'N31',   const AssetImage('assets/idfm/noctilien/NOCT_31.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01405', 'N45', 'N45',   const AssetImage('assets/idfm/noctilien/NOCT_45.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01409', 'N53', 'N53',   const AssetImage('assets/idfm/noctilien/NOCT_53.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01416', 'N16', 'N16',   const AssetImage('assets/idfm/noctilien/NOCT_16.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01421', 'N122', 'N122', const AssetImage('assets/idfm/noctilien/NOCT_122.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01638', 'N140', 'N140', const AssetImage('assets/idfm/noctilien/NOCT_140.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01392', 'N24', 'N24',   const AssetImage('assets/idfm/noctilien/NOCT_24.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01395', 'N44', 'N44',   const AssetImage('assets/idfm/noctilien/NOCT_44.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01403', 'N62', 'N62',   const AssetImage('assets/idfm/noctilien/NOCT_62.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01407', 'N22', 'N22',   const AssetImage('assets/idfm/noctilien/NOCT_22.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01412', 'N35', 'N35',   const AssetImage('assets/idfm/noctilien/NOCT_35.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01417', 'N15', 'N15',   const AssetImage('assets/idfm/noctilien/NOCT_15.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01422', 'N153', 'N153', const AssetImage('assets/idfm/noctilien/NOCT_153.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01637', 'N150', 'N150', const AssetImage('assets/idfm/noctilien/NOCT_150.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01641', 'N152', 'N152', const AssetImage('assets/idfm/noctilien/NOCT_152.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01643', 'N135', 'N135', const AssetImage('assets/idfm/noctilien/NOCT_135.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01644', 'N143', 'N143', const AssetImage('assets/idfm/noctilien/NOCT_143.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01399', 'N33', 'N33',   const AssetImage('assets/idfm/noctilien/NOCT_33.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01402', 'N61', 'N61',   const AssetImage('assets/idfm/noctilien/NOCT_61.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01415', 'N11', 'N11',   const AssetImage('assets/idfm/noctilien/NOCT_11.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01635', 'N151', 'N151', const AssetImage('assets/idfm/noctilien/NOCT_151.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01642', 'N134', 'N134', const AssetImage('assets/idfm/noctilien/NOCT_134.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01645', 'N144', 'N144', const AssetImage('assets/idfm/noctilien/NOCT_144.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01634', 'N130', 'N130', const AssetImage('assets/idfm/noctilien/NOCT_130.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01394', 'N51', 'N51',   const AssetImage('assets/idfm/noctilien/NOCT_51.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01408', 'N63', 'N63',   const AssetImage('assets/idfm/noctilien/NOCT_63.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01411', 'N41', 'N41',   const AssetImage('assets/idfm/noctilien/NOCT_41.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01419', 'N13', 'N13',   const AssetImage('assets/idfm/noctilien/NOCT_13.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01420', 'N12', 'N12',   const AssetImage('assets/idfm/noctilien/NOCT_12.png'),   'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01640', 'N142', 'N142', const AssetImage('assets/idfm/noctilien/NOCT_142.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))
..addLine('IDFM:C01647', 'N154', 'N154', const AssetImage('assets/idfm/noctilien/NOCT_154.png'),  'NOCTILIEN', const AssetImage('assets/idfm/NOCTILIEN_dark.png'), const AssetImage('assets/idfm/NOCTILIEN_white.png'))

..addLine('IDFM:C01744', 'TER', 'TER Centre - Val de Loire', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
..addLine('IDFM:C01863', 'TER', 'TER Hauts-de-France', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
..addLine('IDFM:C01747', 'TER', 'TER Grand-Est', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
..addLine('IDFM:C02375', 'TER', 'TER Normandie', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
..addLine('IDFM:C01745', 'TER', 'TER Bourgogne - Franche-Comté', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
..addLine('IDFM:C02368', 'TER', 'TER Centre - Val de Loire', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
..addLine('IDFM:C02372', 'TER', 'TER Hauts-de-France', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
..addLine('IDFM:C02370', 'TER', 'TER Normandie', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
..addLine('IDFM:C01748', 'TER', 'TER Normandie', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
..addLine('IDFM:C01857', 'TER', 'TER Centre - Val-de-Loire', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
..addLine('IDFM:C01746', 'TER', 'TER Hauts-de-Franche', const AssetImage('assets/null.png'),  'TER', const AssetImage('assets/sncf/TER_dark.png'), const AssetImage('assets/sncf/TER_white.png'))
;