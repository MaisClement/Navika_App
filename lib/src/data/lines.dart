
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

..addLine('IDFM:C01389', 'T1', 'Tram T1',   'assets/img/icons/lines/TRAM_T1.png',  'assets/img/icons/lines/TRAM_T1_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C01390', 'T2', 'Tram T2',   'assets/img/icons/lines/TRAM_T2.png',  'assets/img/icons/lines/TRAM_T2_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C01391', 'T3A', 'Tram T3a', 'assets/img/icons/lines/TRAM_T3a.png', 'assets/img/icons/lines/TRAM_T3a_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C01679', 'T3B', 'Tram T3b', 'assets/img/icons/lines/TRAM_T3b.png', 'assets/img/icons/lines/TRAM_T3b_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C01843', 'T4', 'Tram T4',   'assets/img/icons/lines/TRAM_T4.png',  'assets/img/icons/lines/TRAM_T4_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C01684', 'T5', 'Tram T5',   'assets/img/icons/lines/TRAM_T5.png',  'assets/img/icons/lines/TRAM_T5_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C01794', 'T6', 'Tram T6',   'assets/img/icons/lines/TRAM_T6.png',  'assets/img/icons/lines/TRAM_T6_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C01774', 'T7', 'Tram T7',   'assets/img/icons/lines/TRAM_T7.png',  'assets/img/icons/lines/TRAM_T7_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C01795', 'T8', 'Tram T8',   'assets/img/icons/lines/TRAM_T8.png',  'assets/img/icons/lines/TRAM_T8_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C02317', 'T9', 'Tram T9',   'assets/img/icons/lines/TRAM_T9.png',  'assets/img/icons/lines/TRAM_T9_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C02528', 'T10', 'Tram T10', 'assets/img/icons/lines/TRAM_T10.png',  'assets/img/icons/lines/TRAM_T10_light.png',  'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C01999', 'T11', 'Tram T11', 'assets/img/icons/lines/TRAM_T11.png', 'assets/img/icons/lines/TRAM_T11_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C02529', 'T12', 'Tram T12', 'assets/img/icons/lines/TRAM_T12.png', 'assets/img/icons/lines/TRAM_T12_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')
..addLine('IDFM:C02344', 'T13', 'Tram T13', 'assets/img/icons/lines/TRAM_T13.png', 'assets/img/icons/lines/TRAM_T13_light.png', 'TRAM','assets/img/icons/tram.png', 'assets/img/icons/tram_light.png')

..addLine('IDFM:C01737', 'TRANSILIEN H', 'Transilien H', 'assets/img/icons/lines/TRAIN_H.png', 'assets/img/icons/lines/TRAIN_H_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01739', 'TRANSILIEN J', 'Transilien J', 'assets/img/icons/lines/TRAIN_J.png', 'assets/img/icons/lines/TRAIN_J_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01738', 'TRANSILIEN K', 'Transilien K', 'assets/img/icons/lines/TRAIN_K.png', 'assets/img/icons/lines/TRAIN_K_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01740', 'TRANSILIEN L', 'Transilien L', 'assets/img/icons/lines/TRAIN_L.png', 'assets/img/icons/lines/TRAIN_L_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01736', 'TRANSILIEN N', 'Transilien N', 'assets/img/icons/lines/TRAIN_N.png', 'assets/img/icons/lines/TRAIN_N_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01730', 'TRANSILIEN P', 'Transilien P', 'assets/img/icons/lines/TRAIN_P.png', 'assets/img/icons/lines/TRAIN_P_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01731', 'TRANSILIEN R', 'Transilien R', 'assets/img/icons/lines/TRAIN_R.png', 'assets/img/icons/lines/TRAIN_R_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:C01741', 'TRANSILIEN U', 'Transilien U', 'assets/img/icons/lines/TRAIN_U.png', 'assets/img/icons/lines/TRAIN_U_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')
..addLine('IDFM:V01741', 'TRANSILIEN V', 'Transilien V', 'assets/img/icons/lines/TRAIN_V.png', 'assets/img/icons/lines/TRAIN_V_light.png', 'TRAIN','assets/img/icons/train.png','assets/img/icons/train_light.png')

..addLine('IDFM:C01744', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01863', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01747', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C02375', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01745', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C02368', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C02372', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C02370', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01748', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01857', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')
..addLine('IDFM:C01746', 'TER', 'TER', 'assets/img/icons/sncf/TER_color.png', 'assets/img/icons/sncf/TER_color.png', 'TER', 'assets/img/icons/sncf/TER.png', 'assets/img/icons/sncf/TER_white.png')

..addLine('TER',  'TER',  'TER',         'assets/img/icons/sncf/TER_color.png',  'assets/img/icons/sncf/TER_color.png',  'TER',  'assets/img/icons/sncf/TER.png',   'assets/img/icons/sncf/TER_white.png')
..addLine('SNCF', 'SNCF', 'Trains SNCF', 'assets/img/icons/sncf/logo_color.png', 'assets/img/icons/sncf/logo_color.png', 'SNCF', 'assets/img/icons/sncf/logo_color.png', 'assets/img/icons/sncf/logo_white.png')
;
