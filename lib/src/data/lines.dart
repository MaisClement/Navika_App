
class LinesInfo {
  List lines = []; 

  void setLines(List _lines) {
    lines = _lines;
  }

  void reset(){
    lines.clear();
  }

  Map? getLines(el) {
    for (var line in lines) {
      if (el is Map) {
        if (line['id'] == el['id'] || line['name'] == el['name']) {
          return line;
        }
        if (line['code'] != null && line['code'] == el['code']) {
          return line;
        }
      } else {
        if (line['id'] == el || line['name'] == el) {
          return line;
        }
        if (line['code'] != null && line['code'] == el) {
          return line;
        }
      }

      
    }
    return lines[0];
  }
}

final LINES = LinesInfo()..setLines(
  [
    {'id': '0','code': null, 'name': '','logo': null,'logo_light': null,'symbol': null,'symbol_light': null},
    {'id': 'IDFM:C01742','code': null, 'name': 'RER A','logo': 'lines/RER_A.png','logo_light': 'lines/RER_A_light.png','symbol': 'RER.png','symbol_light': 'RER_light.png'},
    {'id': 'IDFM:C01743','code': null, 'name': 'RER B','logo': 'lines/RER_B.png','logo_light': 'lines/RER_B_light.png','symbol': 'RER.png','symbol_light': 'RER_light.png'},
    {'id': 'IDFM:C01727','code': null, 'name': 'RER C','logo': 'lines/RER_C.png','logo_light': 'lines/RER_C_light.png','symbol': 'RER.png','symbol_light': 'RER_light.png'},
    {'id': 'IDFM:C01728','code': null, 'name': 'RER D','logo': 'lines/RER_D.png','logo_light': 'lines/RER_D_light.png','symbol': 'RER.png','symbol_light': 'RER_light.png'},
    {'id': 'IDFM:C01729','code': null, 'name': 'RER E','logo': 'lines/RER_E.png','logo_light': 'lines/RER_E_light.png','symbol': 'RER.png','symbol_light': 'RER_light.png'},
    {'id': 'IDFM:C01371','code': null, 'name': 'Métro 1','logo': 'lines/METRO_1.png','logo_light': 'lines/METRO_1_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01372','code': null, 'name': 'Métro 2','logo': 'lines/METRO_2.png','logo_light': 'lines/METRO_2_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01373','code': null, 'name': 'Métro 3','logo': 'lines/METRO_3.png','logo_light': 'lines/METRO_3_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01386','code': null, 'name': 'Métro 3bis','logo': 'lines/METRO_3b.png','logo_light': 'lines/METRO_3b_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01374','code': null, 'name': 'Métro 4','logo': 'lines/METRO_4.png','logo_light': 'lines/METRO_4_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01375','code': null, 'name': 'Métro 5','logo': 'lines/METRO_5.png','logo_light': 'lines/METRO_5_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01376','code': null, 'name': 'Métro 6','logo': 'lines/METRO_6.png','logo_light': 'lines/METRO_6_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01377','code': null, 'name': 'Métro 7','logo': 'lines/METRO_7.png','logo_light': 'lines/METRO_7_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01387','code': null, 'name': 'Métro 7bis','logo': 'lines/METRO_7b.png','logo_light': 'lines/METRO_7b_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01378','code': null, 'name': 'Métro 8','logo': 'lines/METRO_8.png','logo_light': 'lines/METRO_8_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01379','code': null, 'name': 'Métro 9','logo': 'lines/METRO_9.png','logo_light': 'lines/METRO_9_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01380','code': null, 'name': 'Métro 10','logo': 'lines/METRO_10.png','logo_light': 'lines/METRO_10_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01381','code': null, 'name': 'Métro 11','logo': 'lines/METRO_11.png','logo_light': 'lines/METRO_11_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01382','code': null, 'name': 'Métro 12','logo': 'lines/METRO_12.png','logo_light': 'lines/METRO_12_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01383','code': null, 'name': 'Métro 13','logo': 'lines/METRO_13.png','logo_light': 'lines/METRO_13_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01384','code': null, 'name': 'Métro 14','logo': 'lines/METRO_14.png','logo_light': 'lines/METRO_14_light.png','symbol': 'metro.png','symbol_light': 'metro_light.png'},
    {'id': 'IDFM:C01388','code': null, 'name': 'Orly val','logo': 'lines/ORLYVAL.png','logo_light': 'lines/ORLYVAL.png','symbol': null,'symbol_light': null},
    {'id': 'IDFM:C00563','code': null, 'name': 'CDG Val','logo': 'lines/CDGVAL.png','logo_light': 'lines/CDGVAL.png','symbol': null,'symbol_light': null},
    {'id': 'IDFM:C01389','code': null, 'name': 'Tram T1','logo': 'lines/TRAM_T1.png','logo_light': 'lines/TRAM_T1_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C01390','code': null, 'name': 'Tram T2','logo': 'lines/TRAM_T2.png','logo_light': 'lines/TRAM_T2_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C01391','code': null, 'name': 'Tram T3a','logo': 'lines/TRAM_T3a.png','logo_light': 'lines/TRAM_T3a_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C01679','code': null, 'name': 'Tram T3b','logo': 'lines/TRAM_T3b.png','logo_light': 'lines/TRAM_T3b_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C01843','code': null, 'name': 'Tram T4','logo': 'lines/TRAM_T4.png','logo_light': 'lines/TRAM_T4_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C01684','code': null, 'name': 'Tram T5','logo': 'lines/TRAM_T5.png','logo_light': 'lines/TRAM_T5_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C01794','code': null, 'name': 'Tram T6','logo': 'lines/TRAM_T6.png','logo_light': 'lines/TRAM_T6_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C01774','code': null, 'name': 'Tram T7','logo': 'lines/TRAM_T7.png','logo_light': 'lines/TRAM_T7_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C01795','code': null, 'name': 'Tram T8','logo': 'lines/TRAM_T8.png','logo_light': 'lines/TRAM_T8_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C02317','code': null, 'name': 'Tram T9','logo': 'lines/TRAM_T9.png','logo_light': 'lines/TRAM_T9_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C02528','code': null, 'name': 'Tram T10','logo': 'lines/TRAM_T10.png','logo_light': 'lines/TRAM_T10_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C01999','code': null, 'name': 'Tram T11','logo': 'lines/TRAM_T11.png','logo_light': 'lines/TRAM_T11_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C02529','code': null, 'name': 'Tram T12','logo': 'lines/TRAM_T12.png','logo_light': 'lines/TRAM_T12_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C02344','code': null, 'name': 'Tram T13','logo': 'lines/TRAM_T13.png','logo_light': 'lines/TRAM_T13_light.png','symbol': 'tram.png','symbol_light': 'tram_light.png'},
    {'id': 'IDFM:C01737','code': null, 'name': 'Transilien H','logo': 'lines/TRAIN_H.png','logo_light': 'lines/TRAIN_H_light.png','symbol': 'train.png','symbol_light': 'train_light.png'},
    {'id': 'IDFM:C01739','code': null, 'name': 'Transilien J','logo': 'lines/TRAIN_J.png','logo_light': 'lines/TRAIN_J_light.png','symbol': 'train.png','symbol_light': 'train_light.png'},
    {'id': 'IDFM:C01738','code': null, 'name': 'Transilien K','logo': 'lines/TRAIN_K.png','logo_light': 'lines/TRAIN_K_light.png','symbol': 'train.png','symbol_light': 'train_light.png'},
    {'id': 'IDFM:C01740','code': null, 'name': 'Transilien L','logo': 'lines/TRAIN_L.png','logo_light': 'lines/TRAIN_L_light.png','symbol': 'train.png','symbol_light': 'train_light.png'},
    {'id': 'IDFM:C01736','code': null, 'name': 'Transilien N','logo': 'lines/TRAIN_N.png','logo_light': 'lines/TRAIN_N_light.png','symbol': 'train.png','symbol_light': 'train_light.png'},
    {'id': 'IDFM:C01730','code': null, 'name': 'Transilien P','logo': 'lines/TRAIN_P.png','logo_light': 'lines/TRAIN_P_light.png','symbol': 'train.png','symbol_light': 'train_light.png'},
    {'id': 'IDFM:C01731','code': null, 'name': 'Transilien R','logo': 'lines/TRAIN_R.png','logo_light': 'lines/TRAIN_R_light.png','symbol': 'train.png','symbol_light': 'train_light.png'},
    {'id': 'IDFM:C01741','code': null, 'name': 'Transilien U','logo': 'lines/TRAIN_U.png','logo_light': 'lines/TRAIN_U_light.png','symbol': 'train.png','symbol_light': 'train_light.png'},
    {'id': 'IDFM:V01741','code': null, 'name': 'Transilien V','logo': 'lines/TRAIN_V.png','logo_light': 'lines/TRAIN_V_light.png','symbol': 'train.png','symbol_light': 'train_light.png'},
    {'id': 'IDFM:C01744','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'IDFM:C01863','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'IDFM:C01747','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'IDFM:C02375','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'IDFM:C01745','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'IDFM:C02368','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'IDFM:C02372','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'IDFM:C02370','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'IDFM:C01748','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'IDFM:C01857','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'IDFM:C01746','code': null, 'name': 'TER','logo': 'sncf/TER_color.png','logo_light': 'sncf/TER_color.png','symbol': 'sncf/TER.png','symbol_light': 'sncf/TER_light.png'},
    {'id': 'TER', 'code': 'TER',  'name': '',      'logo': 'sncf/TER.png','logo_light': 'sncf/TER_light.png','symbol': null,'symbol_light': null},
    {'id': 'TGV', 'code': 'TGV',  'name': '',      'logo': 'sncf/inoui.png','logo_light': 'sncf/inoui_light.png','symbol': null,'symbol_light': null},
    {'id': 'IC',  'code': 'IC',   'name': '',      'logo': 'sncf/intercites.png','logo_light': 'sncf/intercites_light.png','symbol': null,'symbol_light': null},
    {'id': 'SNCF','code': 'SNCF', 'name': '',      'logo': 'sncf/SNCF.png','logo_light': 'sncf/logo_light.png','symbol': null,'symbol_light': null},
  ]
);