// Copyright (c) 2018-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:ffi';
import 'package:here_sdk/src/_library_context.dart' as __lib;

/// This enum represents language codes.
///
/// The basic naming pattern
/// consists of a 2-letter ISO 639-1 language code followed by a 2-letter ISO
/// 3166-1 country code. Some language codes consist only of a language code, i.e.
/// without a country code. When there is no ISO 639-1 language code, the related
/// ISO 639-2 or ISO 639-3 language code is used. In case the script is specified,
/// its ISO 15924 code is used.
enum LanguageCode {
    /// English (United States)
    enUs,
    /// Afrikaans
    afZa,
    /// Albanian
    sqAl,
    /// Amharic (Ethiopia)
    amEt,
    /// Arabic (Saudi Arabia)
    arSa,
    /// Armenian
    hyAm,
    /// Assamese (India)
    asIn,
    /// Azeri - Latin
    azLatnAz,
    /// Bangla (Bangladesh)
    bnBd,
    /// Bangla (India)
    bnIn,
    /// Basque
    euEs,
    /// Belarusian
    beBy,
    /// Bosnian - Latin
    bsLatnBa,
    /// Bulgarian
    bgBg,
    /// Catalan (Spain)
    caEs,
    /// Central Kurdish - Arabic
    kuArab,
    /// Chinese (Simplified China)
    zhCn,
    /// Chinese (Traditional Hong Kong)
    zhHk,
    /// Chinese (Traditional Taiwan)
    zhTw,
    /// Croatian
    hrHr,
    /// Czech
    csCz,
    /// Danish
    daDk,
    /// Dari - Arabic (Afghanistan)
    prsArabAf,
    /// Flemish Dutch (Belgium)
    nlBe,
    /// Dutch
    nlNl,
    /// English (British)
    enGb,
    /// Estonian
    etEe,
    /// Farsi (Iran)
    faIr,
    /// Filipino
    filPh,
    /// Finnish
    fiFi,
    /// French
    frFr,
    /// French (Canada)
    frCa,
    /// Galician
    glEs,
    /// Georgian
    kaGe,
    /// German
    deDe,
    /// Greek
    elGr,
    /// Gujarati (India)
    guIn,
    /// Hausa - Latin (Nigeria)
    haLatnNg,
    /// Hebrew
    heIl,
    /// Hindi
    hiIn,
    /// Hungarian
    huHu,
    /// Icelandic
    isIs,
    /// Igbo - Latin (Nigera)
    igLatnNg,
    /// Indonesian (Bahasa)
    idId,
    /// Irish
    gaIe,
    /// IsiXhosa
    xh,
    /// IsiZulu (South Africa)
    zuZa,
    /// Italian
    itIt,
    /// Japanese
    jaJp,
    /// Kannada (India)
    knIn,
    /// Kazakh
    kkKz,
    /// Khmer (Cambodia)
    kmKh,
    /// K'iche' - Latin (Guatemala)
    qucLatnGt,
    /// Kinyarwanda (Rwanda)
    rwRw,
    /// KiSwahili
    sw,
    /// Konkani (India)
    kokIn,
    /// Korean
    koKr,
    /// Kyrgyz - Cyrillic
    kyCyrlKg,
    /// Latvian
    lvLv,
    /// Lithuanian
    ltLt,
    /// Luxembourgish
    lbLu,
    /// Macedonian
    mkMk,
    /// Malay (Bahasa)
    msMy,
    /// Malayalam (India)
    mlIn,
    /// Maltese  (Malta)
    mtMt,
    /// Maori - Latin (New Zealand)
    miLatnNz,
    /// Marathi (India)
    mrIn,
    /// Mongolian - Cyrillic
    mnCyrlMn,
    /// Nepali (Nepal)
    neNp,
    /// Norwegian (Bokmal)
    nbNo,
    /// Norwegian (Nynorsk)
    nnNo,
    /// Odia (India)
    orIn,
    /// Polish
    plPl,
    /// Portuguese (Brazil)
    ptBr,
    /// Portuguese (Portugal)
    ptPt,
    /// Punjabi - Gurmukhi
    paGuru,
    /// Punjabi - Arabic
    paArab,
    /// Quechua - Latin (Peru)
    quLatnPe,
    /// Romanian
    roRo,
    /// Russian
    ruRu,
    /// Scottish Gaelic - Latin
    gdLatnGb,
    /// Serbian - Cyrillic (Bosnia)
    srCyrlBa,
    /// Serbian - Cyrillic (Serbia)
    srCyrlRs,
    /// Serbian - Latin (Serbia)
    srLatnRs,
    /// Sesotho Sa Leboa (South Africa)
    nsoZa,
    /// Setswana
    tn,
    /// Sindhi - Arabic
    sdArab,
    /// Sinhala (Sri Lanka)
    siLk,
    /// Slovak
    skSk,
    /// Slovenian
    slSi,
    /// Spanish (Argentina)
    esAr,
    /// Spanish (Mexico)
    esMx,
    /// Spanish (Spain)
    esEs,
    /// Swedish
    svSe,
    /// Tajik - Cyrillic
    tgCyrlTj,
    /// Tamil
    ta,
    /// Tatar - Cyrillic (Russia)
    ttCyrlRu,
    /// Telugu (India)
    teIn,
    /// Thai
    thTh,
    /// Tigrinya (Ethiopia)
    tiEt,
    /// Turkish
    trTr,
    /// Turkmen - Latin
    tkLatnTm,
    /// Ukrainian
    ukUa,
    /// Urdu
    ur,
    /// Uyghur - Arabic
    ugArab,
    /// Uzbek - Cyrillic
    uzCyrlUz,
    /// Uzbek - Latin
    uzLatnUz,
    /// Valencian (Spain)
    catEs,
    /// Vietnamese
    viVn,
    /// Welsh
    cyGb,
    /// Wolof - Latin
    woLatn,
    /// Yoruba - Latin
    yoLatn
}

// LanguageCode "private" section, not exported.

int sdkCoreLanguagecodeToFfi(LanguageCode value) {
  switch (value) {
  case LanguageCode.enUs:
    return 0;
  case LanguageCode.afZa:
    return 1;
  case LanguageCode.sqAl:
    return 2;
  case LanguageCode.amEt:
    return 3;
  case LanguageCode.arSa:
    return 4;
  case LanguageCode.hyAm:
    return 5;
  case LanguageCode.asIn:
    return 6;
  case LanguageCode.azLatnAz:
    return 7;
  case LanguageCode.bnBd:
    return 8;
  case LanguageCode.bnIn:
    return 9;
  case LanguageCode.euEs:
    return 10;
  case LanguageCode.beBy:
    return 11;
  case LanguageCode.bsLatnBa:
    return 12;
  case LanguageCode.bgBg:
    return 13;
  case LanguageCode.caEs:
    return 14;
  case LanguageCode.kuArab:
    return 15;
  case LanguageCode.zhCn:
    return 16;
  case LanguageCode.zhHk:
    return 17;
  case LanguageCode.zhTw:
    return 18;
  case LanguageCode.hrHr:
    return 19;
  case LanguageCode.csCz:
    return 20;
  case LanguageCode.daDk:
    return 21;
  case LanguageCode.prsArabAf:
    return 22;
  case LanguageCode.nlBe:
    return 23;
  case LanguageCode.nlNl:
    return 24;
  case LanguageCode.enGb:
    return 25;
  case LanguageCode.etEe:
    return 26;
  case LanguageCode.faIr:
    return 27;
  case LanguageCode.filPh:
    return 28;
  case LanguageCode.fiFi:
    return 29;
  case LanguageCode.frFr:
    return 30;
  case LanguageCode.frCa:
    return 31;
  case LanguageCode.glEs:
    return 32;
  case LanguageCode.kaGe:
    return 33;
  case LanguageCode.deDe:
    return 34;
  case LanguageCode.elGr:
    return 35;
  case LanguageCode.guIn:
    return 36;
  case LanguageCode.haLatnNg:
    return 37;
  case LanguageCode.heIl:
    return 38;
  case LanguageCode.hiIn:
    return 39;
  case LanguageCode.huHu:
    return 40;
  case LanguageCode.isIs:
    return 41;
  case LanguageCode.igLatnNg:
    return 42;
  case LanguageCode.idId:
    return 43;
  case LanguageCode.gaIe:
    return 44;
  case LanguageCode.xh:
    return 45;
  case LanguageCode.zuZa:
    return 46;
  case LanguageCode.itIt:
    return 47;
  case LanguageCode.jaJp:
    return 48;
  case LanguageCode.knIn:
    return 49;
  case LanguageCode.kkKz:
    return 50;
  case LanguageCode.kmKh:
    return 51;
  case LanguageCode.qucLatnGt:
    return 52;
  case LanguageCode.rwRw:
    return 53;
  case LanguageCode.sw:
    return 54;
  case LanguageCode.kokIn:
    return 55;
  case LanguageCode.koKr:
    return 56;
  case LanguageCode.kyCyrlKg:
    return 57;
  case LanguageCode.lvLv:
    return 58;
  case LanguageCode.ltLt:
    return 59;
  case LanguageCode.lbLu:
    return 60;
  case LanguageCode.mkMk:
    return 61;
  case LanguageCode.msMy:
    return 62;
  case LanguageCode.mlIn:
    return 63;
  case LanguageCode.mtMt:
    return 64;
  case LanguageCode.miLatnNz:
    return 65;
  case LanguageCode.mrIn:
    return 66;
  case LanguageCode.mnCyrlMn:
    return 67;
  case LanguageCode.neNp:
    return 68;
  case LanguageCode.nbNo:
    return 69;
  case LanguageCode.nnNo:
    return 70;
  case LanguageCode.orIn:
    return 71;
  case LanguageCode.plPl:
    return 72;
  case LanguageCode.ptBr:
    return 73;
  case LanguageCode.ptPt:
    return 74;
  case LanguageCode.paGuru:
    return 75;
  case LanguageCode.paArab:
    return 76;
  case LanguageCode.quLatnPe:
    return 77;
  case LanguageCode.roRo:
    return 78;
  case LanguageCode.ruRu:
    return 79;
  case LanguageCode.gdLatnGb:
    return 80;
  case LanguageCode.srCyrlBa:
    return 81;
  case LanguageCode.srCyrlRs:
    return 82;
  case LanguageCode.srLatnRs:
    return 83;
  case LanguageCode.nsoZa:
    return 84;
  case LanguageCode.tn:
    return 85;
  case LanguageCode.sdArab:
    return 86;
  case LanguageCode.siLk:
    return 87;
  case LanguageCode.skSk:
    return 88;
  case LanguageCode.slSi:
    return 89;
  case LanguageCode.esAr:
    return 90;
  case LanguageCode.esMx:
    return 91;
  case LanguageCode.esEs:
    return 92;
  case LanguageCode.svSe:
    return 93;
  case LanguageCode.tgCyrlTj:
    return 94;
  case LanguageCode.ta:
    return 95;
  case LanguageCode.ttCyrlRu:
    return 96;
  case LanguageCode.teIn:
    return 97;
  case LanguageCode.thTh:
    return 98;
  case LanguageCode.tiEt:
    return 99;
  case LanguageCode.trTr:
    return 100;
  case LanguageCode.tkLatnTm:
    return 101;
  case LanguageCode.ukUa:
    return 102;
  case LanguageCode.ur:
    return 103;
  case LanguageCode.ugArab:
    return 104;
  case LanguageCode.uzCyrlUz:
    return 105;
  case LanguageCode.uzLatnUz:
    return 106;
  case LanguageCode.catEs:
    return 107;
  case LanguageCode.viVn:
    return 108;
  case LanguageCode.cyGb:
    return 109;
  case LanguageCode.woLatn:
    return 110;
  case LanguageCode.yoLatn:
    return 111;
  default:
    throw StateError("Invalid enum value $value for LanguageCode enum.");
  }
}

LanguageCode sdkCoreLanguagecodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LanguageCode.enUs;
  case 1:
    return LanguageCode.afZa;
  case 2:
    return LanguageCode.sqAl;
  case 3:
    return LanguageCode.amEt;
  case 4:
    return LanguageCode.arSa;
  case 5:
    return LanguageCode.hyAm;
  case 6:
    return LanguageCode.asIn;
  case 7:
    return LanguageCode.azLatnAz;
  case 8:
    return LanguageCode.bnBd;
  case 9:
    return LanguageCode.bnIn;
  case 10:
    return LanguageCode.euEs;
  case 11:
    return LanguageCode.beBy;
  case 12:
    return LanguageCode.bsLatnBa;
  case 13:
    return LanguageCode.bgBg;
  case 14:
    return LanguageCode.caEs;
  case 15:
    return LanguageCode.kuArab;
  case 16:
    return LanguageCode.zhCn;
  case 17:
    return LanguageCode.zhHk;
  case 18:
    return LanguageCode.zhTw;
  case 19:
    return LanguageCode.hrHr;
  case 20:
    return LanguageCode.csCz;
  case 21:
    return LanguageCode.daDk;
  case 22:
    return LanguageCode.prsArabAf;
  case 23:
    return LanguageCode.nlBe;
  case 24:
    return LanguageCode.nlNl;
  case 25:
    return LanguageCode.enGb;
  case 26:
    return LanguageCode.etEe;
  case 27:
    return LanguageCode.faIr;
  case 28:
    return LanguageCode.filPh;
  case 29:
    return LanguageCode.fiFi;
  case 30:
    return LanguageCode.frFr;
  case 31:
    return LanguageCode.frCa;
  case 32:
    return LanguageCode.glEs;
  case 33:
    return LanguageCode.kaGe;
  case 34:
    return LanguageCode.deDe;
  case 35:
    return LanguageCode.elGr;
  case 36:
    return LanguageCode.guIn;
  case 37:
    return LanguageCode.haLatnNg;
  case 38:
    return LanguageCode.heIl;
  case 39:
    return LanguageCode.hiIn;
  case 40:
    return LanguageCode.huHu;
  case 41:
    return LanguageCode.isIs;
  case 42:
    return LanguageCode.igLatnNg;
  case 43:
    return LanguageCode.idId;
  case 44:
    return LanguageCode.gaIe;
  case 45:
    return LanguageCode.xh;
  case 46:
    return LanguageCode.zuZa;
  case 47:
    return LanguageCode.itIt;
  case 48:
    return LanguageCode.jaJp;
  case 49:
    return LanguageCode.knIn;
  case 50:
    return LanguageCode.kkKz;
  case 51:
    return LanguageCode.kmKh;
  case 52:
    return LanguageCode.qucLatnGt;
  case 53:
    return LanguageCode.rwRw;
  case 54:
    return LanguageCode.sw;
  case 55:
    return LanguageCode.kokIn;
  case 56:
    return LanguageCode.koKr;
  case 57:
    return LanguageCode.kyCyrlKg;
  case 58:
    return LanguageCode.lvLv;
  case 59:
    return LanguageCode.ltLt;
  case 60:
    return LanguageCode.lbLu;
  case 61:
    return LanguageCode.mkMk;
  case 62:
    return LanguageCode.msMy;
  case 63:
    return LanguageCode.mlIn;
  case 64:
    return LanguageCode.mtMt;
  case 65:
    return LanguageCode.miLatnNz;
  case 66:
    return LanguageCode.mrIn;
  case 67:
    return LanguageCode.mnCyrlMn;
  case 68:
    return LanguageCode.neNp;
  case 69:
    return LanguageCode.nbNo;
  case 70:
    return LanguageCode.nnNo;
  case 71:
    return LanguageCode.orIn;
  case 72:
    return LanguageCode.plPl;
  case 73:
    return LanguageCode.ptBr;
  case 74:
    return LanguageCode.ptPt;
  case 75:
    return LanguageCode.paGuru;
  case 76:
    return LanguageCode.paArab;
  case 77:
    return LanguageCode.quLatnPe;
  case 78:
    return LanguageCode.roRo;
  case 79:
    return LanguageCode.ruRu;
  case 80:
    return LanguageCode.gdLatnGb;
  case 81:
    return LanguageCode.srCyrlBa;
  case 82:
    return LanguageCode.srCyrlRs;
  case 83:
    return LanguageCode.srLatnRs;
  case 84:
    return LanguageCode.nsoZa;
  case 85:
    return LanguageCode.tn;
  case 86:
    return LanguageCode.sdArab;
  case 87:
    return LanguageCode.siLk;
  case 88:
    return LanguageCode.skSk;
  case 89:
    return LanguageCode.slSi;
  case 90:
    return LanguageCode.esAr;
  case 91:
    return LanguageCode.esMx;
  case 92:
    return LanguageCode.esEs;
  case 93:
    return LanguageCode.svSe;
  case 94:
    return LanguageCode.tgCyrlTj;
  case 95:
    return LanguageCode.ta;
  case 96:
    return LanguageCode.ttCyrlRu;
  case 97:
    return LanguageCode.teIn;
  case 98:
    return LanguageCode.thTh;
  case 99:
    return LanguageCode.tiEt;
  case 100:
    return LanguageCode.trTr;
  case 101:
    return LanguageCode.tkLatnTm;
  case 102:
    return LanguageCode.ukUa;
  case 103:
    return LanguageCode.ur;
  case 104:
    return LanguageCode.ugArab;
  case 105:
    return LanguageCode.uzCyrlUz;
  case 106:
    return LanguageCode.uzLatnUz;
  case 107:
    return LanguageCode.catEs;
  case 108:
    return LanguageCode.viVn;
  case 109:
    return LanguageCode.cyGb;
  case 110:
    return LanguageCode.woLatn;
  case 111:
    return LanguageCode.yoLatn;
  default:
    throw StateError("Invalid numeric value $handle for LanguageCode enum.");
  }
}

void sdkCoreLanguagecodeReleaseFfiHandle(int handle) {}

final _sdkCoreLanguagecodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_LanguageCode_create_handle_nullable'));
final _sdkCoreLanguagecodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LanguageCode_release_handle_nullable'));
final _sdkCoreLanguagecodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_LanguageCode_get_value_nullable'));

Pointer<Void> sdkCoreLanguagecodeToFfiNullable(LanguageCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreLanguagecodeToFfi(value);
  final result = _sdkCoreLanguagecodeCreateHandleNullable(_handle);
  sdkCoreLanguagecodeReleaseFfiHandle(_handle);
  return result;
}

LanguageCode? sdkCoreLanguagecodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreLanguagecodeGetValueNullable(handle);
  final result = sdkCoreLanguagecodeFromFfi(_handle);
  sdkCoreLanguagecodeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreLanguagecodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreLanguagecodeReleaseHandleNullable(handle);

// End of LanguageCode "private" section.


