
class LinesInfo {
  final lines = <Info>[]; 

  void addLine(String id, String name, String libelle, String imageDark, String imageLight, String mode, String imageModeDark, String imageModeLight) {
    var line = Info(id, name, libelle, imageDark, imageLight, mode, imageModeDark, imageModeLight);
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
  final String imageDark;
  final String imageLight;
  final String mode;
  final String imageModeDark;
  final String imageModeLight;

  Info(this.id, this.name, this.libelle, this.imageDark, this.imageLight, this.mode, this.imageModeDark, this.imageModeLight);
}

final LINES = LinesInfo()
..addLine('0', '', '','assets/img/null.png', 'assets/img/null.png', '0','assets/img/null.png', 'assets/img/null.png')
..addLine('C01742', 'RER A', 'RER A', 'assets/img/icons/lines/RER_A.png', 'assets/img/icons/lines/RER_A_light.png', 'RER','assets/img/icons/RER.png', 'assets/img/icons/RER_light.png')
..addLine('C01743', 'RER B', 'RER B', 'assets/img/icons/lines/RER_B.png', 'assets/img/icons/lines/RER_B_light.png', 'RER','assets/img/icons/RER.png', 'assets/img/icons/RER_light.png')
..addLine('C01727', 'RER C', 'RER C', 'assets/img/icons/lines/RER_C.png', 'assets/img/icons/lines/RER_C_light.png', 'RER','assets/img/icons/RER.png', 'assets/img/icons/RER_light.png')
..addLine('C01728', 'RER D', 'RER D', 'assets/img/icons/lines/RER_D.png', 'assets/img/icons/lines/RER_D_light.png', 'RER','assets/img/icons/RER.png', 'assets/img/icons/RER_light.png')
..addLine('C01729', 'RER E', 'RER E', 'assets/img/icons/lines/RER_E.png', 'assets/img/icons/lines/RER_E_light.png', 'RER','assets/img/icons/RER.png', 'assets/img/icons/RER_light.png')

..addLine('C01371', 'METRO 1',  'Métro 1',  'assets/img/icons/lines/METRO_1.png',   'assets/img/icons/lines/METRO_1_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01372', 'METRO 2',  'Métro 2',  'assets/img/icons/lines/METRO_2.png',   'assets/img/icons/lines/METRO_2_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01373', 'METRO 3',  'Métro 3',  'assets/img/icons/lines/METRO_3.png',   'assets/img/icons/lines/METRO_3_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01386', 'METRO 3B', 'Métro 3B', 'assets/img/icons/lines/METRO_3b.png',  'assets/img/icons/lines/METRO_3b_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01374', 'METRO 4',  'Métro 4',  'assets/img/icons/lines/METRO_4.png',   'assets/img/icons/lines/METRO_4_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01375', 'METRO 5',  'Métro 5',  'assets/img/icons/lines/METRO_5.png',   'assets/img/icons/lines/METRO_5_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01376', 'METRO 6',  'Métro 6',  'assets/img/icons/lines/METRO_6.png',   'assets/img/icons/lines/METRO_6_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01377', 'METRO 7',  'Métro 7',  'assets/img/icons/lines/METRO_7.png',   'assets/img/icons/lines/METRO_7_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01387', 'METRO 7B', 'Métro 7B', 'assets/img/icons/lines/METRO_7b.png',  'assets/img/icons/lines/METRO_7b_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01378', 'METRO 8',  'Métro 8',  'assets/img/icons/lines/METRO_8.png',   'assets/img/icons/lines/METRO_8_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01379', 'METRO 9',  'Métro 9',  'assets/img/icons/lines/METRO_9.png',   'assets/img/icons/lines/METRO_9_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01380', 'METRO 10', 'Métro 10', 'assets/img/icons/lines/METRO_10.png',  'assets/img/icons/lines/METRO_10_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01381', 'METRO 11', 'Métro 11', 'assets/img/icons/lines/METRO_11.png',  'assets/img/icons/lines/METRO_11_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01382', 'METRO 12', 'Métro 12', 'assets/img/icons/lines/METRO_12.png',  'assets/img/icons/lines/METRO_12_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01383', 'METRO 13', 'Métro 13', 'assets/img/icons/lines/METRO_13.png',  'assets/img/icons/lines/METRO_13_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('C01384', 'METRO 14', 'Métro 14', 'assets/img/icons/lines/METRO_14.png',  'assets/img/icons/lines/METRO_14_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')

..addLine('C01388', 'Orly val', 'Orly val', 'assets/img/icons/lines/ORLYVAL.png', 'assets/img/icons/lines/ORLYVAL.png',  'VAL', 'assets/img/null.png', 'assets/img/null.png')
..addLine('C00563', 'CDG Val',  'CDG Val',  'assets/img/icons/lines/CDGVAL.png',  'assets/img/icons/lines/CDGVAL.png',   'VAL', 'assets/img/null.png', 'assets/img/null.png')

..addLine('C01389', 'T1', 'Tram T1',   'assets/img/icons/lines/TRAM_T1.png',  'assets/img/icons/lines/TRAM_T1_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01390', 'T2', 'Tram T2',   'assets/img/icons/lines/TRAM_T2.png',  'assets/img/icons/lines/TRAM_T2_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01391', 'T3A', 'Tram T3a', 'assets/img/icons/lines/TRAM_T3a.png', 'assets/img/icons/lines/TRAM_T3a_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01679', 'T3B', 'Tram T3b', 'assets/img/icons/lines/TRAM_T3b.png', 'assets/img/icons/lines/TRAM_T3b_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01843', 'T4', 'Tram T4',   'assets/img/icons/lines/TRAM_T4.png',  'assets/img/icons/lines/TRAM_T4_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01684', 'T5', 'Tram T5',   'assets/img/icons/lines/TRAM_T5.png',  'assets/img/icons/lines/TRAM_T5_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01794', 'T6', 'Tram T6',   'assets/img/icons/lines/TRAM_T6.png',  'assets/img/icons/lines/TRAM_T6_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01774', 'T7', 'Tram T7',   'assets/img/icons/lines/TRAM_T7.png',  'assets/img/icons/lines/TRAM_T7_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01795', 'T8', 'Tram T8',   'assets/img/icons/lines/TRAM_T8.png',  'assets/img/icons/lines/TRAM_T8_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C02317', 'T9', 'Tram T9',   'assets/img/icons/lines/TRAM_T9.png',  'assets/img/icons/lines/TRAM_T9_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01999', 'T11', 'Tram T11', 'assets/img/icons/lines/TRAM_T11.png', 'assets/img/icons/lines/TRAM_T11_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C02344', 'T13', 'Tram T13', 'assets/img/icons/lines/TRAM_T13.png', 'assets/img/icons/lines/TRAM_T13_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')

..addLine('C01737', 'TRANSILIEN H', 'Transilien H', 'assets/img/icons/lines/TRAIN_H.png', 'assets/img/icons/lines/TRAIN_H_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('C01739', 'TRANSILIEN J', 'Transilien J', 'assets/img/icons/lines/TRAIN_J.png', 'assets/img/icons/lines/TRAIN_J_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('C01738', 'TRANSILIEN K', 'Transilien K', 'assets/img/icons/lines/TRAIN_K.png', 'assets/img/icons/lines/TRAIN_K_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('C01740', 'TRANSILIEN L', 'Transilien L', 'assets/img/icons/lines/TRAIN_L.png', 'assets/img/icons/lines/TRAIN_L_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('C01736', 'TRANSILIEN N', 'Transilien N', 'assets/img/icons/lines/TRAIN_N.png', 'assets/img/icons/lines/TRAIN_N_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('C01730', 'TRANSILIEN P', 'Transilien P', 'assets/img/icons/lines/TRAIN_P.png', 'assets/img/icons/lines/TRAIN_P_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('C01731', 'TRANSILIEN R', 'Transilien R', 'assets/img/icons/lines/TRAIN_R.png', 'assets/img/icons/lines/TRAIN_R_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('C01741', 'TRANSILIEN U', 'Transilien U', 'assets/img/icons/lines/TRAIN_U.png', 'assets/img/icons/lines/TRAIN_U_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')

..addLine('C01648', 'N133', 'N133', 'assets/img/icons/noctilien/NOCT_133.png', 'assets/img/icons/noctilien/NOCT_133.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01396', 'N42', 'N42',   'assets/img/icons/noctilien/NOCT_42.png',  'assets/img/icons/noctilien/NOCT_42.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01393', 'N52', 'N52',   'assets/img/icons/noctilien/NOCT_52.png',  'assets/img/icons/noctilien/NOCT_52.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01401', 'N21', 'N21',   'assets/img/icons/noctilien/NOCT_21.png',  'assets/img/icons/noctilien/NOCT_21.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01404', 'N32', 'N32',   'assets/img/icons/noctilien/NOCT_32.png',  'assets/img/icons/noctilien/NOCT_32.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01406', 'N43', 'N43',   'assets/img/icons/noctilien/NOCT_43.png',  'assets/img/icons/noctilien/NOCT_43.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01410', 'N71', 'N71',   'assets/img/icons/noctilien/NOCT_71.png',  'assets/img/icons/noctilien/NOCT_71.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01418', 'N14', 'N14',   'assets/img/icons/noctilien/NOCT_14.png',  'assets/img/icons/noctilien/NOCT_14.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01807', 'N66', 'N66',   'assets/img/icons/noctilien/NOCT_66.png',  'assets/img/icons/noctilien/NOCT_66.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01633', 'N132', 'N132', 'assets/img/icons/noctilien/NOCT_132.png', 'assets/img/icons/noctilien/NOCT_132.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01639', 'N141', 'N141', 'assets/img/icons/noctilien/NOCT_141.png', 'assets/img/icons/noctilien/NOCT_141.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01646', 'N145', 'N145', 'assets/img/icons/noctilien/NOCT_145.png', 'assets/img/icons/noctilien/NOCT_145.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01413', 'N01', 'N01',   'assets/img/icons/noctilien/NOCT_01.png',  'assets/img/icons/noctilien/NOCT_01.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01414', 'N02', 'N02',   'assets/img/icons/noctilien/NOCT_02.png',  'assets/img/icons/noctilien/NOCT_02.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01636', 'N131', 'N131', 'assets/img/icons/noctilien/NOCT_131.png', 'assets/img/icons/noctilien/NOCT_131.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01397', 'N23', 'N23',   'assets/img/icons/noctilien/NOCT_23.png',  'assets/img/icons/noctilien/NOCT_23.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01398', 'N34', 'N34',   'assets/img/icons/noctilien/NOCT_34.png',  'assets/img/icons/noctilien/NOCT_34.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01400', 'N31', 'N31',   'assets/img/icons/noctilien/NOCT_31.png',  'assets/img/icons/noctilien/NOCT_31.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01405', 'N45', 'N45',   'assets/img/icons/noctilien/NOCT_45.png',  'assets/img/icons/noctilien/NOCT_45.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01409', 'N53', 'N53',   'assets/img/icons/noctilien/NOCT_53.png',  'assets/img/icons/noctilien/NOCT_53.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01416', 'N16', 'N16',   'assets/img/icons/noctilien/NOCT_16.png',  'assets/img/icons/noctilien/NOCT_16.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01421', 'N122', 'N122', 'assets/img/icons/noctilien/NOCT_122.png', 'assets/img/icons/noctilien/NOCT_122.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01638', 'N140', 'N140', 'assets/img/icons/noctilien/NOCT_140.png', 'assets/img/icons/noctilien/NOCT_140.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01392', 'N24', 'N24',   'assets/img/icons/noctilien/NOCT_24.png',  'assets/img/icons/noctilien/NOCT_24.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01395', 'N44', 'N44',   'assets/img/icons/noctilien/NOCT_44.png',  'assets/img/icons/noctilien/NOCT_44.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01403', 'N62', 'N62',   'assets/img/icons/noctilien/NOCT_62.png',  'assets/img/icons/noctilien/NOCT_62.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01407', 'N22', 'N22',   'assets/img/icons/noctilien/NOCT_22.png',  'assets/img/icons/noctilien/NOCT_22.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01412', 'N35', 'N35',   'assets/img/icons/noctilien/NOCT_35.png',  'assets/img/icons/noctilien/NOCT_35.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01417', 'N15', 'N15',   'assets/img/icons/noctilien/NOCT_15.png',  'assets/img/icons/noctilien/NOCT_15.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01422', 'N153', 'N153', 'assets/img/icons/noctilien/NOCT_153.png', 'assets/img/icons/noctilien/NOCT_153.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01637', 'N150', 'N150', 'assets/img/icons/noctilien/NOCT_150.png', 'assets/img/icons/noctilien/NOCT_150.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01641', 'N152', 'N152', 'assets/img/icons/noctilien/NOCT_152.png', 'assets/img/icons/noctilien/NOCT_152.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01643', 'N135', 'N135', 'assets/img/icons/noctilien/NOCT_135.png', 'assets/img/icons/noctilien/NOCT_135.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01644', 'N143', 'N143', 'assets/img/icons/noctilien/NOCT_143.png', 'assets/img/icons/noctilien/NOCT_143.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01399', 'N33', 'N33',   'assets/img/icons/noctilien/NOCT_33.png',  'assets/img/icons/noctilien/NOCT_33.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01402', 'N61', 'N61',   'assets/img/icons/noctilien/NOCT_61.png',  'assets/img/icons/noctilien/NOCT_61.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01415', 'N11', 'N11',   'assets/img/icons/noctilien/NOCT_11.png',  'assets/img/icons/noctilien/NOCT_11.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01635', 'N151', 'N151', 'assets/img/icons/noctilien/NOCT_151.png', 'assets/img/icons/noctilien/NOCT_151.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01642', 'N134', 'N134', 'assets/img/icons/noctilien/NOCT_134.png', 'assets/img/icons/noctilien/NOCT_134.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01645', 'N144', 'N144', 'assets/img/icons/noctilien/NOCT_144.png', 'assets/img/icons/noctilien/NOCT_144.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01634', 'N130', 'N130', 'assets/img/icons/noctilien/NOCT_130.png', 'assets/img/icons/noctilien/NOCT_130.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01394', 'N51', 'N51',   'assets/img/icons/noctilien/NOCT_51.png',  'assets/img/icons/noctilien/NOCT_51.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01408', 'N63', 'N63',   'assets/img/icons/noctilien/NOCT_63.png',  'assets/img/icons/noctilien/NOCT_63.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01411', 'N41', 'N41',   'assets/img/icons/noctilien/NOCT_41.png',  'assets/img/icons/noctilien/NOCT_41.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01419', 'N13', 'N13',   'assets/img/icons/noctilien/NOCT_13.png',  'assets/img/icons/noctilien/NOCT_13.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01420', 'N12', 'N12',   'assets/img/icons/noctilien/NOCT_12.png',  'assets/img/icons/noctilien/NOCT_12.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01640', 'N142', 'N142', 'assets/img/icons/noctilien/NOCT_142.png', 'assets/img/icons/noctilien/NOCT_142.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('C01647', 'N154', 'N154', 'assets/img/icons/noctilien/NOCT_154.png', 'assets/img/icons/noctilien/NOCT_154.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')

..addLine('C01744', 'TER', 'TER Centre - Val de Loire',     'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('C01863', 'TER', 'TER Hauts-de-France',           'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('C01747', 'TER', 'TER Grand-Est',                 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('C02375', 'TER', 'TER Normandie',                 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('C01745', 'TER', 'TER Bourgogne - Franche-Comté', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('C02368', 'TER', 'TER Centre - Val de Loire',     'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('C02372', 'TER', 'TER Hauts-de-France',           'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('C02370', 'TER', 'TER Normandie',                 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('C01748', 'TER', 'TER Normandie',                 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('C01857', 'TER', 'TER Centre - Val-de-Loire',     'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('C01746', 'TER', 'TER Hauts-de-Franche',          'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER_dark.png', 'assets/img/icons/sncf/TER_white.png')


..addLine('TER',  'TER',  'TER',         'assets/img/icons/sncf/TER_color.png',  'assets/img/icons/sncf/TER_color.png',  'TER',  'assets/img/icons/sncf/TER_dark.png',   'assets/img/icons/sncf/TER_white.png')
..addLine('SNCF', 'SNCF', 'Trains SNCF', 'assets/img/icons/sncf/logo_color.png', 'assets/img/icons/sncf/logo_color.png', 'SNCF', 'assets/img/icons/sncf/logo_color.png', 'assets/img/icons/sncf/logo_white.png')
;