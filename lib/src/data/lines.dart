
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
..addLine('IDFM:C01742', 'RER A', 'RER A', 'assets/img/icons/lines/RER_A.png', 'assets/img/icons/lines/RER_A_light.png', 'RER','assets/img/icons/RER.png', 'assets/img/icons/RER_light.png')
..addLine('IDFM:C01743', 'RER B', 'RER B', 'assets/img/icons/lines/RER_B.png', 'assets/img/icons/lines/RER_B_light.png', 'RER','assets/img/icons/RER.png', 'assets/img/icons/RER_light.png')
..addLine('IDFM:C01727', 'RER C', 'RER C', 'assets/img/icons/lines/RER_C.png', 'assets/img/icons/lines/RER_C_light.png', 'RER','assets/img/icons/RER.png', 'assets/img/icons/RER_light.png')
..addLine('IDFM:C01728', 'RER D', 'RER D', 'assets/img/icons/lines/RER_D.png', 'assets/img/icons/lines/RER_D_light.png', 'RER','assets/img/icons/RER.png', 'assets/img/icons/RER_light.png')
..addLine('IDFM:C01729', 'RER E', 'RER E', 'assets/img/icons/lines/RER_E.png', 'assets/img/icons/lines/RER_E_light.png', 'RER','assets/img/icons/RER.png', 'assets/img/icons/RER_light.png')

..addLine('IDFM:C01371', 'METRO 1',  'Métro 1',  'assets/img/icons/lines/METRO_1.png',   'assets/img/icons/lines/METRO_1_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01372', 'METRO 2',  'Métro 2',  'assets/img/icons/lines/METRO_2.png',   'assets/img/icons/lines/METRO_2_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01373', 'METRO 3',  'Métro 3',  'assets/img/icons/lines/METRO_3.png',   'assets/img/icons/lines/METRO_3_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01386', 'METRO 3B', 'Métro 3bis', 'assets/img/icons/lines/METRO_3b.png',  'assets/img/icons/lines/METRO_3b_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01374', 'METRO 4',  'Métro 4',  'assets/img/icons/lines/METRO_4.png',   'assets/img/icons/lines/METRO_4_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01375', 'METRO 5',  'Métro 5',  'assets/img/icons/lines/METRO_5.png',   'assets/img/icons/lines/METRO_5_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01376', 'METRO 6',  'Métro 6',  'assets/img/icons/lines/METRO_6.png',   'assets/img/icons/lines/METRO_6_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01377', 'METRO 7',  'Métro 7',  'assets/img/icons/lines/METRO_7.png',   'assets/img/icons/lines/METRO_7_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01387', 'METRO 7B', 'Métro 7bis', 'assets/img/icons/lines/METRO_7b.png',  'assets/img/icons/lines/METRO_7b_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01378', 'METRO 8',  'Métro 8',  'assets/img/icons/lines/METRO_8.png',   'assets/img/icons/lines/METRO_8_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01379', 'METRO 9',  'Métro 9',  'assets/img/icons/lines/METRO_9.png',   'assets/img/icons/lines/METRO_9_light.png',  'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01380', 'METRO 10', 'Métro 10', 'assets/img/icons/lines/METRO_10.png',  'assets/img/icons/lines/METRO_10_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01381', 'METRO 11', 'Métro 11', 'assets/img/icons/lines/METRO_11.png',  'assets/img/icons/lines/METRO_11_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01382', 'METRO 12', 'Métro 12', 'assets/img/icons/lines/METRO_12.png',  'assets/img/icons/lines/METRO_12_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01383', 'METRO 13', 'Métro 13', 'assets/img/icons/lines/METRO_13.png',  'assets/img/icons/lines/METRO_13_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')
..addLine('IDFM:C01384', 'METRO 14', 'Métro 14', 'assets/img/icons/lines/METRO_14.png',  'assets/img/icons/lines/METRO_14_light.png', 'METRO', 'assets/img/icons/metro.png', 'assets/img/icons/metro_light.png')

..addLine('IDFM:C01388', 'Orly val', 'Orly val', 'assets/img/icons/lines/ORLYVAL.png', 'assets/img/icons/lines/ORLYVAL.png',  'VAL', 'assets/img/null.png', 'assets/img/null.png')
..addLine('IDFM:C00563', 'CDG Val',  'CDG Val',  'assets/img/icons/lines/CDGVAL.png',  'assets/img/icons/lines/CDGVAL.png',   'VAL', 'assets/img/null.png', 'assets/img/null.png')

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
..addLine('C02528', 'T10', 'Tram T10', 'assets/img/icons/lines/TRAM_T10.png',  'assets/img/icons/lines/TRAM_T10_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01999', 'T11', 'Tram T11', 'assets/img/icons/lines/TRAM_T11.png', 'assets/img/icons/lines/TRAM_T11_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C01999', 'T12', 'Tram T12', 'assets/img/icons/lines/TRAM_T12.png', 'assets/img/icons/lines/TRAM_T12_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('C02344', 'T13', 'Tram T13', 'assets/img/icons/lines/TRAM_T13.png', 'assets/img/icons/lines/TRAM_T13_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')

..addLine('IDFM:C01737', 'TRANSILIEN H', 'Transilien H', 'assets/img/icons/lines/TRAIN_H.png', 'assets/img/icons/lines/TRAIN_H_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01739', 'TRANSILIEN J', 'Transilien J', 'assets/img/icons/lines/TRAIN_J.png', 'assets/img/icons/lines/TRAIN_J_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01738', 'TRANSILIEN K', 'Transilien K', 'assets/img/icons/lines/TRAIN_K.png', 'assets/img/icons/lines/TRAIN_K_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01740', 'TRANSILIEN L', 'Transilien L', 'assets/img/icons/lines/TRAIN_L.png', 'assets/img/icons/lines/TRAIN_L_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01736', 'TRANSILIEN N', 'Transilien N', 'assets/img/icons/lines/TRAIN_N.png', 'assets/img/icons/lines/TRAIN_N_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01730', 'TRANSILIEN P', 'Transilien P', 'assets/img/icons/lines/TRAIN_P.png', 'assets/img/icons/lines/TRAIN_P_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01731', 'TRANSILIEN R', 'Transilien R', 'assets/img/icons/lines/TRAIN_R.png', 'assets/img/icons/lines/TRAIN_R_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01741', 'TRANSILIEN U', 'Transilien U', 'assets/img/icons/lines/TRAIN_U.png', 'assets/img/icons/lines/TRAIN_U_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')

..addLine('IDFM:C01648', 'N133', 'N133', 'assets/img/icons/noctilien/NOCT_133.png', 'assets/img/icons/noctilien/NOCT_133.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01396', 'N42', 'N42',   'assets/img/icons/noctilien/NOCT_42.png',  'assets/img/icons/noctilien/NOCT_42.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01393', 'N52', 'N52',   'assets/img/icons/noctilien/NOCT_52.png',  'assets/img/icons/noctilien/NOCT_52.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01401', 'N21', 'N21',   'assets/img/icons/noctilien/NOCT_21.png',  'assets/img/icons/noctilien/NOCT_21.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01404', 'N32', 'N32',   'assets/img/icons/noctilien/NOCT_32.png',  'assets/img/icons/noctilien/NOCT_32.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01406', 'N43', 'N43',   'assets/img/icons/noctilien/NOCT_43.png',  'assets/img/icons/noctilien/NOCT_43.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01410', 'N71', 'N71',   'assets/img/icons/noctilien/NOCT_71.png',  'assets/img/icons/noctilien/NOCT_71.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01418', 'N14', 'N14',   'assets/img/icons/noctilien/NOCT_14.png',  'assets/img/icons/noctilien/NOCT_14.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01807', 'N66', 'N66',   'assets/img/icons/noctilien/NOCT_66.png',  'assets/img/icons/noctilien/NOCT_66.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01633', 'N132', 'N132', 'assets/img/icons/noctilien/NOCT_132.png', 'assets/img/icons/noctilien/NOCT_132.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01639', 'N141', 'N141', 'assets/img/icons/noctilien/NOCT_141.png', 'assets/img/icons/noctilien/NOCT_141.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01646', 'N145', 'N145', 'assets/img/icons/noctilien/NOCT_145.png', 'assets/img/icons/noctilien/NOCT_145.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01413', 'N01', 'N01',   'assets/img/icons/noctilien/NOCT_01.png',  'assets/img/icons/noctilien/NOCT_01.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01414', 'N02', 'N02',   'assets/img/icons/noctilien/NOCT_02.png',  'assets/img/icons/noctilien/NOCT_02.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01636', 'N131', 'N131', 'assets/img/icons/noctilien/NOCT_131.png', 'assets/img/icons/noctilien/NOCT_131.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01397', 'N23', 'N23',   'assets/img/icons/noctilien/NOCT_23.png',  'assets/img/icons/noctilien/NOCT_23.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01398', 'N34', 'N34',   'assets/img/icons/noctilien/NOCT_34.png',  'assets/img/icons/noctilien/NOCT_34.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01400', 'N31', 'N31',   'assets/img/icons/noctilien/NOCT_31.png',  'assets/img/icons/noctilien/NOCT_31.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01405', 'N45', 'N45',   'assets/img/icons/noctilien/NOCT_45.png',  'assets/img/icons/noctilien/NOCT_45.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01409', 'N53', 'N53',   'assets/img/icons/noctilien/NOCT_53.png',  'assets/img/icons/noctilien/NOCT_53.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01416', 'N16', 'N16',   'assets/img/icons/noctilien/NOCT_16.png',  'assets/img/icons/noctilien/NOCT_16.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01421', 'N122', 'N122', 'assets/img/icons/noctilien/NOCT_122.png', 'assets/img/icons/noctilien/NOCT_122.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01638', 'N140', 'N140', 'assets/img/icons/noctilien/NOCT_140.png', 'assets/img/icons/noctilien/NOCT_140.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01392', 'N24', 'N24',   'assets/img/icons/noctilien/NOCT_24.png',  'assets/img/icons/noctilien/NOCT_24.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01395', 'N44', 'N44',   'assets/img/icons/noctilien/NOCT_44.png',  'assets/img/icons/noctilien/NOCT_44.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01403', 'N62', 'N62',   'assets/img/icons/noctilien/NOCT_62.png',  'assets/img/icons/noctilien/NOCT_62.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01407', 'N22', 'N22',   'assets/img/icons/noctilien/NOCT_22.png',  'assets/img/icons/noctilien/NOCT_22.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01412', 'N35', 'N35',   'assets/img/icons/noctilien/NOCT_35.png',  'assets/img/icons/noctilien/NOCT_35.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01417', 'N15', 'N15',   'assets/img/icons/noctilien/NOCT_15.png',  'assets/img/icons/noctilien/NOCT_15.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01422', 'N153', 'N153', 'assets/img/icons/noctilien/NOCT_153.png', 'assets/img/icons/noctilien/NOCT_153.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01637', 'N150', 'N150', 'assets/img/icons/noctilien/NOCT_150.png', 'assets/img/icons/noctilien/NOCT_150.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01641', 'N152', 'N152', 'assets/img/icons/noctilien/NOCT_152.png', 'assets/img/icons/noctilien/NOCT_152.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01643', 'N135', 'N135', 'assets/img/icons/noctilien/NOCT_135.png', 'assets/img/icons/noctilien/NOCT_135.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01644', 'N143', 'N143', 'assets/img/icons/noctilien/NOCT_143.png', 'assets/img/icons/noctilien/NOCT_143.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01399', 'N33', 'N33',   'assets/img/icons/noctilien/NOCT_33.png',  'assets/img/icons/noctilien/NOCT_33.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01402', 'N61', 'N61',   'assets/img/icons/noctilien/NOCT_61.png',  'assets/img/icons/noctilien/NOCT_61.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01415', 'N11', 'N11',   'assets/img/icons/noctilien/NOCT_11.png',  'assets/img/icons/noctilien/NOCT_11.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01635', 'N151', 'N151', 'assets/img/icons/noctilien/NOCT_151.png', 'assets/img/icons/noctilien/NOCT_151.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01642', 'N134', 'N134', 'assets/img/icons/noctilien/NOCT_134.png', 'assets/img/icons/noctilien/NOCT_134.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01645', 'N144', 'N144', 'assets/img/icons/noctilien/NOCT_144.png', 'assets/img/icons/noctilien/NOCT_144.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01634', 'N130', 'N130', 'assets/img/icons/noctilien/NOCT_130.png', 'assets/img/icons/noctilien/NOCT_130.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01394', 'N51', 'N51',   'assets/img/icons/noctilien/NOCT_51.png',  'assets/img/icons/noctilien/NOCT_51.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01408', 'N63', 'N63',   'assets/img/icons/noctilien/NOCT_63.png',  'assets/img/icons/noctilien/NOCT_63.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01411', 'N41', 'N41',   'assets/img/icons/noctilien/NOCT_41.png',  'assets/img/icons/noctilien/NOCT_41.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01419', 'N13', 'N13',   'assets/img/icons/noctilien/NOCT_13.png',  'assets/img/icons/noctilien/NOCT_13.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01420', 'N12', 'N12',   'assets/img/icons/noctilien/NOCT_12.png',  'assets/img/icons/noctilien/NOCT_12.png',   'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01640', 'N142', 'N142', 'assets/img/icons/noctilien/NOCT_142.png', 'assets/img/icons/noctilien/NOCT_142.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')
..addLine('IDFM:C01647', 'N154', 'N154', 'assets/img/icons/noctilien/NOCT_154.png', 'assets/img/icons/noctilien/NOCT_154.png',  'NOCTILIEN','assets/img/icons/noctilien.png','assets/img/noctilien_light.png')

..addLine('IDFM:C01744', 'TER', 'TER Centre - Val de Loire',     'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01863', 'TER', 'TER Hauts-de-France',           'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01747', 'TER', 'TER Grand-Est',                 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C02375', 'TER', 'TER Normandie',                 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01745', 'TER', 'TER Bourgogne - Franche-Comté', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C02368', 'TER', 'TER Centre - Val de Loire',     'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C02372', 'TER', 'TER Hauts-de-France',           'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C02370', 'TER', 'TER Normandie',                 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01748', 'TER', 'TER Normandie',                 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01857', 'TER', 'TER Centre - Val-de-Loire',     'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01746', 'TER', 'TER Hauts-de-Franche',          'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')

..addLine('TER',  'TER',  'TER',         'assets/img/icons/sncf/TER_color.png',  'assets/img/icons/sncf/TER_color.png',  'TER',  'assets/img/icons/sncf/TER.png',   'assets/img/icons/sncf/TER_white.png')
..addLine('SNCF', 'SNCF', 'Trains SNCF', 'assets/img/icons/sncf/logo_color.png', 'assets/img/icons/sncf/logo_color.png', 'SNCF', 'assets/img/icons/sncf/logo_color.png', 'assets/img/icons/sncf/logo_white.png')
;

List lines = [
    {
        'id': 'IDFM:C01742',
        'name': 'RER A',
        'label': 'RER A',
        'icon': '/lines/RER_A',
        'mode': 'RER'
    },
    {
        'id': 'IDFM:C01743',
        'name': 'RER B',
        'label': 'RER B',
        'icon': '/lines/RER_B',
        'mode': 'RER'
    },
    {
        'id': 'IDFM:C01727',
        'name': 'RER C',
        'label': 'RER C',
        'icon': '/lines/RER_C',
        'mode': 'RER'
    },
    {
        'id': 'IDFM:C01728',
        'name': 'RER D',
        'label': 'RER D',
        'icon': '/lines/RER_D',
        'mode': 'RER'
    },
    {
        'id': 'IDFM:C01729',
        'name': 'RER E',
        'label': 'RER E',
        'icon': '/lines/RER_E',
        'mode': 'RER'
    },
    {
        'id': 'IDFM:C01371',
        'name': 'METRO 1',
        'label': 'Métro 1',
        'icon': '/lines/METRO_1',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01372',
        'name': 'METRO 2',
        'label': 'Métro 2',
        'icon': '/lines/METRO_2',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01373',
        'name': 'METRO 3',
        'label': 'Métro 3',
        'icon': '/lines/METRO_3',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01386',
        'name': 'METRO 3B',
        'label': 'Métro 3bis',
        'icon': '/lines/METRO_3b',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01374',
        'name': 'METRO 4',
        'label': 'Métro 4',
        'icon': '/lines/METRO_4',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01375',
        'name': 'METRO 5',
        'label': 'Métro 5',
        'icon': '/lines/METRO_5',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01376',
        'name': 'METRO 6',
        'label': 'Métro 6',
        'icon': '/lines/METRO_6',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01377',
        'name': 'METRO 7',
        'label': 'Métro 7',
        'icon': '/lines/METRO_7',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01387',
        'name': 'METRO 7B',
        'label': 'Métro 7bis',
        'icon': '/lines/METRO_7b',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01378',
        'name': 'METRO 8',
        'label': 'Métro 8',
        'icon': '/lines/METRO_8',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01379',
        'name': 'METRO 9',
        'label': 'Métro 9',
        'icon': '/lines/METRO_9',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01380',
        'name': 'METRO 10',
        'label': 'Métro 10',
        'icon': '/lines/METRO_10',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01381',
        'name': 'METRO 11',
        'label': 'Métro 11',
        'icon': '/lines/METRO_11',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01382',
        'name': 'METRO 12',
        'label': 'Métro 12',
        'icon': '/lines/METRO_12',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01383',
        'name': 'METRO 13',
        'label': 'Métro 13',
        'icon': '/lines/METRO_13',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01384',
        'name': 'METRO 14',
        'label': 'Métro 14',
        'icon': '/lines/METRO_14',
        'mode': 'METRO'
    },
    {
        'id': 'IDFM:C01388',
        'name': 'Orly val',
        'label': 'Orly val',
        'icon': '/lines/ORLYVAL',
        'mode': 'VAL'
    },
    {
        'id': 'IDFM:C00563',
        'name': 'CDG Val',
        'label': 'CDG Val',
        'icon': '/lines/CDGVAL',
        'mode': 'VAL'
    },
    {
        'id': 'IDFM:C01389',
        'name': 'T1',
        'label': 'Tram T1',
        'icon': '/lines/TRAM_T1',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C01390',
        'name': 'T2',
        'label': 'Tram T2',
        'icon': '/lines/TRAM_T2',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C01391',
        'name': 'T3A',
        'label': 'Tram T3a',
        'icon': '/lines/TRAM_T3a',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C01679',
        'name': 'T3B',
        'label': 'Tram T3b',
        'icon': '/lines/TRAM_T3b',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C01843',
        'name': 'T4',
        'label': 'Tram T4',
        'icon': '/lines/TRAM_T4',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C01684',
        'name': 'T5',
        'label': 'Tram T5',
        'icon': '/lines/TRAM_T5',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C01794',
        'name': 'T6',
        'label': 'Tram T6',
        'icon': '/lines/TRAM_T6',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C01774',
        'name': 'T7',
        'label': 'Tram T7',
        'icon': '/lines/TRAM_T7',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C01795',
        'name': 'T8',
        'label': 'Tram T8',
        'icon': '/lines/TRAM_T8',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C02317',
        'name': 'T9',
        'label': 'Tram T9',
        'icon': '/lines/TRAM_T9',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C01999',
        'name': 'T11',
        'label': 'Tram T11',
        'icon': '/lines/TRAM_T11',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C02344',
        'name': 'T13',
        'label': 'Tram T13',
        'icon': '/lines/TRAM_T13',
        'mode': 'TRAM'
    },
    {
        'id': 'IDFM:C01737',
        'name': 'TRANSILIEN H',
        'label': 'Transilien H',
        'icon': '/lines/TRAIN_H',
        'mode': 'TRAIN'
    },
    {
        'id': 'IDFM:C01739',
        'name': 'TRANSILIEN J',
        'label': 'Transilien J',
        'icon': '/lines/TRAIN_J',
        'mode': 'TRAIN'
    },
    {
        'id': 'IDFM:C01738',
        'name': 'TRANSILIEN K',
        'label': 'Transilien K',
        'icon': '/lines/TRAIN_K',
        'mode': 'TRAIN'
    },
    {
        'id': 'IDFM:C01740',
        'name': 'TRANSILIEN L',
        'label': 'Transilien L',
        'icon': '/lines/TRAIN_L',
        'mode': 'TRAIN'
    },
    {
        'id': 'IDFM:C01736',
        'name': 'TRANSILIEN N',
        'label': 'Transilien N',
        'icon': '/lines/TRAIN_N',
        'mode': 'TRAIN'
    },
    {
        'id': 'IDFM:C01730',
        'name': 'TRANSILIEN P',
        'label': 'Transilien P',
        'icon': '/lines/TRAIN_P',
        'mode': 'TRAIN'
    },
    {
        'id': 'IDFM:C01731',
        'name': 'TRANSILIEN R',
        'label': 'Transilien R',
        'icon': '/lines/TRAIN_R',
        'mode': 'TRAIN'
    },
    {
        'id': 'IDFM:C01741',
        'name': 'TRANSILIEN U',
        'label': 'Transilien U',
        'icon': '/lines/TRAIN_U',
        'mode': 'TRAIN'
    },
    {
        'id': 'IDFM:C01648',
        'name': 'N133',
        'label': 'N133',
        'icon': '/noctilien/NOCT_133',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01396',
        'name': 'N42',
        'label': 'N42',
        'icon': '/noctilien/NOCT_42',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01393',
        'name': 'N52',
        'label': 'N52',
        'icon': '/noctilien/NOCT_52',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01401',
        'name': 'N21',
        'label': 'N21',
        'icon': '/noctilien/NOCT_21',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01404',
        'name': 'N32',
        'label': 'N32',
        'icon': '/noctilien/NOCT_32',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01406',
        'name': 'N43',
        'label': 'N43',
        'icon': '/noctilien/NOCT_43',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01410',
        'name': 'N71',
        'label': 'N71',
        'icon': '/noctilien/NOCT_71',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01418',
        'name': 'N14',
        'label': 'N14',
        'icon': '/noctilien/NOCT_14',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01807',
        'name': 'N66',
        'label': 'N66',
        'icon': '/noctilien/NOCT_66',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01633',
        'name': 'N132',
        'label': 'N132',
        'icon': '/noctilien/NOCT_132',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01639',
        'name': 'N141',
        'label': 'N141',
        'icon': '/noctilien/NOCT_141',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01646',
        'name': 'N145',
        'label': 'N145',
        'icon': '/noctilien/NOCT_145',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01413',
        'name': 'N01',
        'label': 'N01',
        'icon': '/noctilien/NOCT_01',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01414',
        'name': 'N02',
        'label': 'N02',
        'icon': '/noctilien/NOCT_02',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01636',
        'name': 'N131',
        'label': 'N131',
        'icon': '/noctilien/NOCT_131',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01397',
        'name': 'N23',
        'label': 'N23',
        'icon': '/noctilien/NOCT_23',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01398',
        'name': 'N34',
        'label': 'N34',
        'icon': '/noctilien/NOCT_34',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01400',
        'name': 'N31',
        'label': 'N31',
        'icon': '/noctilien/NOCT_31',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01405',
        'name': 'N45',
        'label': 'N45',
        'icon': '/noctilien/NOCT_45',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01409',
        'name': 'N53',
        'label': 'N53',
        'icon': '/noctilien/NOCT_53',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01416',
        'name': 'N16',
        'label': 'N16',
        'icon': '/noctilien/NOCT_16',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01421',
        'name': 'N122',
        'label': 'N122',
        'icon': '/noctilien/NOCT_122',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01638',
        'name': 'N140',
        'label': 'N140',
        'icon': '/noctilien/NOCT_140',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01392',
        'name': 'N24',
        'label': 'N24',
        'icon': '/noctilien/NOCT_24',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01395',
        'name': 'N44',
        'label': 'N44',
        'icon': '/noctilien/NOCT_44',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01403',
        'name': 'N62',
        'label': 'N62',
        'icon': '/noctilien/NOCT_62',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01407',
        'name': 'N22',
        'label': 'N22',
        'icon': '/noctilien/NOCT_22',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01412',
        'name': 'N35',
        'label': 'N35',
        'icon': '/noctilien/NOCT_35',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01417',
        'name': 'N15',
        'label': 'N15',
        'icon': '/noctilien/NOCT_15',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01422',
        'name': 'N153',
        'label': 'N153',
        'icon': '/noctilien/NOCT_153',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01637',
        'name': 'N150',
        'label': 'N150',
        'icon': '/noctilien/NOCT_150',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01641',
        'name': 'N152',
        'label': 'N152',
        'icon': '/noctilien/NOCT_152',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01643',
        'name': 'N135',
        'label': 'N135',
        'icon': '/noctilien/NOCT_135',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01644',
        'name': 'N143',
        'label': 'N143',
        'icon': '/noctilien/NOCT_143',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01399',
        'name': 'N33',
        'label': 'N33',
        'icon': '/noctilien/NOCT_33',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01402',
        'name': 'N61',
        'label': 'N61',
        'icon': '/noctilien/NOCT_61',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01415',
        'name': 'N11',
        'label': 'N11',
        'icon': '/noctilien/NOCT_11',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01635',
        'name': 'N151',
        'label': 'N151',
        'icon': '/noctilien/NOCT_151',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01642',
        'name': 'N134',
        'label': 'N134',
        'icon': '/noctilien/NOCT_134',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01645',
        'name': 'N144',
        'label': 'N144',
        'icon': '/noctilien/NOCT_144',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01634',
        'name': 'N130',
        'label': 'N130',
        'icon': '/noctilien/NOCT_130',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01394',
        'name': 'N51',
        'label': 'N51',
        'icon': '/noctilien/NOCT_51',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01408',
        'name': 'N63',
        'label': 'N63',
        'icon': '/noctilien/NOCT_63',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01411',
        'name': 'N41',
        'label': 'N41',
        'icon': '/noctilien/NOCT_41',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01419',
        'name': 'N13',
        'label': 'N13',
        'icon': '/noctilien/NOCT_13',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01420',
        'name': 'N12',
        'label': 'N12',
        'icon': '/noctilien/NOCT_12',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01640',
        'name': 'N142',
        'label': 'N142',
        'icon': '/noctilien/NOCT_142',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01647',
        'name': 'N154',
        'label': 'N154',
        'icon': '/noctilien/NOCT_154',
        'mode': 'NOCTILIEN'
    },
    {
        'id': 'IDFM:C01744',
        'name': 'TER',
        'label': 'TER Centre - Val de Loire',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'IDFM:C01863',
        'name': 'TER',
        'label': 'TER Hauts-de-France',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'IDFM:C01747',
        'name': 'TER',
        'label': 'TER Grand-Est',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'IDFM:C02375',
        'name': 'TER',
        'label': 'TER Normandie',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'IDFM:C01745',
        'name': 'TER',
        'label': 'TER Bourgogne - Franche-Comté',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'IDFM:C02368',
        'name': 'TER',
        'label': 'TER Centre - Val de Loire',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'IDFM:C02372',
        'name': 'TER',
        'label': 'TER Hauts-de-France',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'IDFM:C02370',
        'name': 'TER',
        'label': 'TER Normandie',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'IDFM:C01748',
        'name': 'TER',
        'label': 'TER Normandie',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'IDFM:C01857',
        'name': 'TER',
        'label': 'TER Centre - Val-de-Loire',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'IDFM:C01746',
        'name': 'TER',
        'label': 'TER Hauts-de-Franche',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'TER',
        'name': 'TER',
        'label': 'TER',
        'icon': '/sncf/TER_color',
        'mode': 'TER'
    },
    {
        'id': 'SNCF',
        'name': 'SNCF',
        'label': 'Trains SNCF',
        'icon': '/sncf/logo_color',
        'mode': 'SNCF'
    },
];