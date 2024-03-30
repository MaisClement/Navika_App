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

/// This enum represents country codes in accordance with the ISO 3166-1 standard using alpha-3 codes.
enum CountryCode {
    /// Aruba
    abw,
    /// Afghanistan
    afg,
    /// Angola
    ago,
    /// Anguilla
    aia,
    /// Aland Islands
    ala,
    /// Albania
    alb,
    /// Andorra
    and,
    /// United Arab Emirates
    are,
    /// Argentina
    arg,
    /// Armenia
    arm,
    /// American Samoa
    asm,
    /// Antarctica
    ata,
    /// French Southern Territories
    atf,
    /// Antigua and Barbuda
    atg,
    /// Australia
    aus,
    /// Austria
    aut,
    /// Azerbaijan
    aze,
    /// Burundi
    bdi,
    /// Belgium
    bel,
    /// Benin
    ben,
    /// Bonaire, Sint Eustatius and Saba
    bes,
    /// Burkina Faso
    bfa,
    /// Bangladesh
    bgd,
    /// Bulgaria
    bgr,
    /// Bahrain
    bhr,
    /// Bahamas
    bhs,
    /// Bosnia and Herzegovina
    bih,
    /// Saint Barthelemy
    blm,
    /// Belarus
    blr,
    /// Belize
    blz,
    /// Bermuda
    bmu,
    /// Bolivia (Plurinational State of)
    bol,
    /// Brazil
    bra,
    /// Barbados
    brb,
    /// Brunei Darussalam
    brn,
    /// Bhutan
    btn,
    /// Bouvet Island
    bvt,
    /// Botswana
    bwa,
    /// Central African Republic
    caf,
    /// Canada
    can,
    /// Cocos (Keeling) Islands
    cck,
    /// Switzerland
    che,
    /// Chile
    chl,
    /// China
    chn,
    /// Cote d'Ivoire
    civ,
    /// Cameroon
    cmr,
    /// Congo, Democratic Republic of the
    cod,
    /// Congo
    cog,
    /// Cook Islands
    cok,
    /// Colombia
    col,
    /// Comoros
    com,
    /// Cabo Verde
    cpv,
    /// Costa Rica
    cri,
    /// Cuba
    cub,
    /// Curacao
    cuw,
    /// Christmas Island
    cxr,
    /// Cayman Islands
    cym,
    /// Cyprus
    cyp,
    /// Czechia
    cze,
    /// Germany
    deu,
    /// Djibouti
    dji,
    /// Dominica
    dma,
    /// Denmark
    dnk,
    /// Dominican Republic
    dom,
    /// Algeria
    dza,
    /// Ecuador
    ecu,
    /// Egypt
    egy,
    /// Eritrea
    eri,
    /// Western Sahara
    esh,
    /// Spain
    esp,
    /// Estonia
    est,
    /// Ethiopia
    eth,
    /// Finland
    fin,
    /// Fiji
    fji,
    /// Falkland Islands (Malvinas)
    flk,
    /// France
    fra,
    /// Faroe Islands
    fro,
    /// Micronesia (Federated States of)
    fsm,
    /// Gabon
    gab,
    /// United Kingdom of Great Britain and Northern Ireland
    gbr,
    /// Georgia
    geo,
    /// Guernsey
    ggy,
    /// Ghana
    gha,
    /// Gibraltar
    gib,
    /// Guinea
    gin,
    /// Guadeloupe
    glp,
    /// Gambia
    gmb,
    /// Guinea-Bissau
    gnb,
    /// Equatorial Guinea
    gnq,
    /// Greece
    grc,
    /// Grenada
    grd,
    /// Greenland
    grl,
    /// Guatemala
    gtm,
    /// French Guiana
    guf,
    /// Guam
    gum,
    /// Guyana
    guy,
    /// Hong Kong
    hkg,
    /// Heard Island and McDonald Islands
    hmd,
    /// Honduras
    hnd,
    /// Croatia
    hrv,
    /// Haiti
    hti,
    /// Hungary
    hun,
    /// Indonesia
    idn,
    /// Isle of Man
    imn,
    /// India
    ind,
    /// British Indian Ocean Territory
    iot,
    /// Ireland
    irl,
    /// Iran (Islamic Republic of)
    irn,
    /// Iraq
    irq,
    /// Iceland
    isl,
    /// Israel
    isr,
    /// Italy
    ita,
    /// Jamaica
    jam,
    /// Jersey
    jey,
    /// Jordan
    jor,
    /// Japan
    jpn,
    /// Kazakhstan
    kaz,
    /// Kenya
    ken,
    /// Kyrgyzstan
    kgz,
    /// Cambodia
    khm,
    /// Kiribati
    kir,
    /// Saint Kitts and Nevis
    kna,
    /// Korea, Republic of
    kor,
    /// Kuwait
    kwt,
    /// Lao People's Democratic Republic
    lao,
    /// Lebanon
    lbn,
    /// Liberia
    lbr,
    /// Libya
    lby,
    /// Saint Lucia
    lca,
    /// Liechtenstein
    lie,
    /// Sri Lanka
    lka,
    /// Lesotho
    lso,
    /// Lithuania
    ltu,
    /// Luxembourg
    lux,
    /// Latvia
    lva,
    /// Macao
    mac,
    /// Saint Martin (French part)
    maf,
    /// Morocco
    mar,
    /// Monaco
    mco,
    /// Moldova, Republic of
    mda,
    /// Madagascar
    mdg,
    /// Maldives
    mdv,
    /// Mexico
    mex,
    /// Marshall Islands
    mhl,
    /// North Macedonia
    mkd,
    /// Mali
    mli,
    /// Malta
    mlt,
    /// Myanmar
    mmr,
    /// Montenegro
    mne,
    /// Mongolia
    mng,
    /// Northern Mariana Islands
    mnp,
    /// Mozambique
    moz,
    /// Mauritania
    mrt,
    /// Montserrat
    msr,
    /// Martinique
    mtq,
    /// Mauritius
    mus,
    /// Malawi
    mwi,
    /// Malaysia
    mys,
    /// Mayotte
    myt,
    /// Namibia
    nam,
    /// New Caledonia
    ncl,
    /// Niger
    ner,
    /// Norfolk Island
    nfk,
    /// Nigeria
    nga,
    /// Nicaragua
    nic,
    /// Niue
    niu,
    /// Netherlands
    nld,
    /// Norway
    nor,
    /// Nepal
    npl,
    /// Nauru
    nru,
    /// New Zealand
    nzl,
    /// Oman
    omn,
    /// Pakistan
    pak,
    /// Panama
    pan,
    /// Pitcairn
    pcn,
    /// Peru
    per,
    /// Philippines
    phl,
    /// Palau
    plw,
    /// Papua New Guinea
    png,
    /// Poland
    pol,
    /// Puerto Rico
    pri,
    /// Korea (Democratic People's Republic of)
    prk,
    /// Portugal
    prt,
    /// Paraguay
    pry,
    /// Palestine, State of
    pse,
    /// French Polynesia
    pyf,
    /// Qatar
    qat,
    /// Reunion
    reu,
    /// Romania
    rou,
    /// Russian Federation
    rus,
    /// Rwanda
    rwa,
    /// Saudi Arabia
    sau,
    /// Sudan
    sdn,
    /// Senegal
    sen,
    /// Singapore
    sgp,
    /// South Georgia and the South Sandwich Islands
    sgs,
    /// Saint Helena, Ascension and Tristan da Cunha
    shn,
    /// Svalbard and Jan Mayen
    sjm,
    /// Solomon Islands
    slb,
    /// Sierra Leone
    sle,
    /// El Salvador
    slv,
    /// San Marino
    smr,
    /// Somalia
    som,
    /// Saint Pierre and Miquelon
    spm,
    /// Serbia
    srb,
    /// South Sudan
    ssd,
    /// Sao Tome and Principe
    stp,
    /// Suriname
    sur,
    /// Slovakia
    svk,
    /// Slovenia
    svn,
    /// Sweden
    swe,
    /// Eswatini
    swz,
    /// Sint Maarten (Dutch part)
    sxm,
    /// Seychelles
    syc,
    /// Syrian Arab Republic
    syr,
    /// Turks and Caicos Islands
    tca,
    /// Chad
    tcd,
    /// Togo
    tgo,
    /// Thailand
    tha,
    /// Tajikistan
    tjk,
    /// Tokelau
    tkl,
    /// Turkmenistan
    tkm,
    /// Timor-Leste
    tls,
    /// Tonga
    ton,
    /// Trinidad and Tobago
    tto,
    /// Tunisia
    tun,
    /// Turkey
    tur,
    /// Tuvalu
    tuv,
    /// Taiwan, Province of China
    twn,
    /// Tanzania, United Republic of
    tza,
    /// Uganda
    uga,
    /// Ukraine
    ukr,
    /// United States Minor Outlying Islands
    umi,
    /// Uruguay
    ury,
    /// United States of America
    usa,
    /// Uzbekistan
    uzb,
    /// Holy See
    vat,
    /// Saint Vincent and the Grenadines
    vct,
    /// Venezuela (Bolivarian Republic of)
    ven,
    /// Virgin Islands (British)
    vgb,
    /// Virgin Islands (U.S.)
    vir,
    /// Viet Nam
    vnm,
    /// Vanuatu
    vut,
    /// Wallis and Futuna
    wlf,
    /// Samoa
    wsm,
    /// Yemen
    yem,
    /// South Africa
    zaf,
    /// Zambia
    zmb,
    /// Zimbabwe
    zwe
}

// CountryCode "private" section, not exported.

int sdkCoreCountrycodeToFfi(CountryCode value) {
  switch (value) {
  case CountryCode.abw:
    return 0;
  case CountryCode.afg:
    return 1;
  case CountryCode.ago:
    return 2;
  case CountryCode.aia:
    return 3;
  case CountryCode.ala:
    return 4;
  case CountryCode.alb:
    return 5;
  case CountryCode.and:
    return 6;
  case CountryCode.are:
    return 7;
  case CountryCode.arg:
    return 8;
  case CountryCode.arm:
    return 9;
  case CountryCode.asm:
    return 10;
  case CountryCode.ata:
    return 11;
  case CountryCode.atf:
    return 12;
  case CountryCode.atg:
    return 13;
  case CountryCode.aus:
    return 14;
  case CountryCode.aut:
    return 15;
  case CountryCode.aze:
    return 16;
  case CountryCode.bdi:
    return 17;
  case CountryCode.bel:
    return 18;
  case CountryCode.ben:
    return 19;
  case CountryCode.bes:
    return 20;
  case CountryCode.bfa:
    return 21;
  case CountryCode.bgd:
    return 22;
  case CountryCode.bgr:
    return 23;
  case CountryCode.bhr:
    return 24;
  case CountryCode.bhs:
    return 25;
  case CountryCode.bih:
    return 26;
  case CountryCode.blm:
    return 27;
  case CountryCode.blr:
    return 28;
  case CountryCode.blz:
    return 29;
  case CountryCode.bmu:
    return 30;
  case CountryCode.bol:
    return 31;
  case CountryCode.bra:
    return 32;
  case CountryCode.brb:
    return 33;
  case CountryCode.brn:
    return 34;
  case CountryCode.btn:
    return 35;
  case CountryCode.bvt:
    return 36;
  case CountryCode.bwa:
    return 37;
  case CountryCode.caf:
    return 38;
  case CountryCode.can:
    return 39;
  case CountryCode.cck:
    return 40;
  case CountryCode.che:
    return 41;
  case CountryCode.chl:
    return 42;
  case CountryCode.chn:
    return 43;
  case CountryCode.civ:
    return 44;
  case CountryCode.cmr:
    return 45;
  case CountryCode.cod:
    return 46;
  case CountryCode.cog:
    return 47;
  case CountryCode.cok:
    return 48;
  case CountryCode.col:
    return 49;
  case CountryCode.com:
    return 50;
  case CountryCode.cpv:
    return 51;
  case CountryCode.cri:
    return 52;
  case CountryCode.cub:
    return 53;
  case CountryCode.cuw:
    return 54;
  case CountryCode.cxr:
    return 55;
  case CountryCode.cym:
    return 56;
  case CountryCode.cyp:
    return 57;
  case CountryCode.cze:
    return 58;
  case CountryCode.deu:
    return 59;
  case CountryCode.dji:
    return 60;
  case CountryCode.dma:
    return 61;
  case CountryCode.dnk:
    return 62;
  case CountryCode.dom:
    return 63;
  case CountryCode.dza:
    return 64;
  case CountryCode.ecu:
    return 65;
  case CountryCode.egy:
    return 66;
  case CountryCode.eri:
    return 67;
  case CountryCode.esh:
    return 68;
  case CountryCode.esp:
    return 69;
  case CountryCode.est:
    return 70;
  case CountryCode.eth:
    return 71;
  case CountryCode.fin:
    return 72;
  case CountryCode.fji:
    return 73;
  case CountryCode.flk:
    return 74;
  case CountryCode.fra:
    return 75;
  case CountryCode.fro:
    return 76;
  case CountryCode.fsm:
    return 77;
  case CountryCode.gab:
    return 78;
  case CountryCode.gbr:
    return 79;
  case CountryCode.geo:
    return 80;
  case CountryCode.ggy:
    return 81;
  case CountryCode.gha:
    return 82;
  case CountryCode.gib:
    return 83;
  case CountryCode.gin:
    return 84;
  case CountryCode.glp:
    return 85;
  case CountryCode.gmb:
    return 86;
  case CountryCode.gnb:
    return 87;
  case CountryCode.gnq:
    return 88;
  case CountryCode.grc:
    return 89;
  case CountryCode.grd:
    return 90;
  case CountryCode.grl:
    return 91;
  case CountryCode.gtm:
    return 92;
  case CountryCode.guf:
    return 93;
  case CountryCode.gum:
    return 94;
  case CountryCode.guy:
    return 95;
  case CountryCode.hkg:
    return 96;
  case CountryCode.hmd:
    return 97;
  case CountryCode.hnd:
    return 98;
  case CountryCode.hrv:
    return 99;
  case CountryCode.hti:
    return 100;
  case CountryCode.hun:
    return 101;
  case CountryCode.idn:
    return 102;
  case CountryCode.imn:
    return 103;
  case CountryCode.ind:
    return 104;
  case CountryCode.iot:
    return 105;
  case CountryCode.irl:
    return 106;
  case CountryCode.irn:
    return 107;
  case CountryCode.irq:
    return 108;
  case CountryCode.isl:
    return 109;
  case CountryCode.isr:
    return 110;
  case CountryCode.ita:
    return 111;
  case CountryCode.jam:
    return 112;
  case CountryCode.jey:
    return 113;
  case CountryCode.jor:
    return 114;
  case CountryCode.jpn:
    return 115;
  case CountryCode.kaz:
    return 116;
  case CountryCode.ken:
    return 117;
  case CountryCode.kgz:
    return 118;
  case CountryCode.khm:
    return 119;
  case CountryCode.kir:
    return 120;
  case CountryCode.kna:
    return 121;
  case CountryCode.kor:
    return 122;
  case CountryCode.kwt:
    return 123;
  case CountryCode.lao:
    return 124;
  case CountryCode.lbn:
    return 125;
  case CountryCode.lbr:
    return 126;
  case CountryCode.lby:
    return 127;
  case CountryCode.lca:
    return 128;
  case CountryCode.lie:
    return 129;
  case CountryCode.lka:
    return 130;
  case CountryCode.lso:
    return 131;
  case CountryCode.ltu:
    return 132;
  case CountryCode.lux:
    return 133;
  case CountryCode.lva:
    return 134;
  case CountryCode.mac:
    return 135;
  case CountryCode.maf:
    return 136;
  case CountryCode.mar:
    return 137;
  case CountryCode.mco:
    return 138;
  case CountryCode.mda:
    return 139;
  case CountryCode.mdg:
    return 140;
  case CountryCode.mdv:
    return 141;
  case CountryCode.mex:
    return 142;
  case CountryCode.mhl:
    return 143;
  case CountryCode.mkd:
    return 144;
  case CountryCode.mli:
    return 145;
  case CountryCode.mlt:
    return 146;
  case CountryCode.mmr:
    return 147;
  case CountryCode.mne:
    return 148;
  case CountryCode.mng:
    return 149;
  case CountryCode.mnp:
    return 150;
  case CountryCode.moz:
    return 151;
  case CountryCode.mrt:
    return 152;
  case CountryCode.msr:
    return 153;
  case CountryCode.mtq:
    return 154;
  case CountryCode.mus:
    return 155;
  case CountryCode.mwi:
    return 156;
  case CountryCode.mys:
    return 157;
  case CountryCode.myt:
    return 158;
  case CountryCode.nam:
    return 159;
  case CountryCode.ncl:
    return 160;
  case CountryCode.ner:
    return 161;
  case CountryCode.nfk:
    return 162;
  case CountryCode.nga:
    return 163;
  case CountryCode.nic:
    return 164;
  case CountryCode.niu:
    return 165;
  case CountryCode.nld:
    return 166;
  case CountryCode.nor:
    return 167;
  case CountryCode.npl:
    return 168;
  case CountryCode.nru:
    return 169;
  case CountryCode.nzl:
    return 170;
  case CountryCode.omn:
    return 171;
  case CountryCode.pak:
    return 172;
  case CountryCode.pan:
    return 173;
  case CountryCode.pcn:
    return 174;
  case CountryCode.per:
    return 175;
  case CountryCode.phl:
    return 176;
  case CountryCode.plw:
    return 177;
  case CountryCode.png:
    return 178;
  case CountryCode.pol:
    return 179;
  case CountryCode.pri:
    return 180;
  case CountryCode.prk:
    return 181;
  case CountryCode.prt:
    return 182;
  case CountryCode.pry:
    return 183;
  case CountryCode.pse:
    return 184;
  case CountryCode.pyf:
    return 185;
  case CountryCode.qat:
    return 186;
  case CountryCode.reu:
    return 187;
  case CountryCode.rou:
    return 188;
  case CountryCode.rus:
    return 189;
  case CountryCode.rwa:
    return 190;
  case CountryCode.sau:
    return 191;
  case CountryCode.sdn:
    return 192;
  case CountryCode.sen:
    return 193;
  case CountryCode.sgp:
    return 194;
  case CountryCode.sgs:
    return 195;
  case CountryCode.shn:
    return 196;
  case CountryCode.sjm:
    return 197;
  case CountryCode.slb:
    return 198;
  case CountryCode.sle:
    return 199;
  case CountryCode.slv:
    return 200;
  case CountryCode.smr:
    return 201;
  case CountryCode.som:
    return 202;
  case CountryCode.spm:
    return 203;
  case CountryCode.srb:
    return 204;
  case CountryCode.ssd:
    return 205;
  case CountryCode.stp:
    return 206;
  case CountryCode.sur:
    return 207;
  case CountryCode.svk:
    return 208;
  case CountryCode.svn:
    return 209;
  case CountryCode.swe:
    return 210;
  case CountryCode.swz:
    return 211;
  case CountryCode.sxm:
    return 212;
  case CountryCode.syc:
    return 213;
  case CountryCode.syr:
    return 214;
  case CountryCode.tca:
    return 215;
  case CountryCode.tcd:
    return 216;
  case CountryCode.tgo:
    return 217;
  case CountryCode.tha:
    return 218;
  case CountryCode.tjk:
    return 219;
  case CountryCode.tkl:
    return 220;
  case CountryCode.tkm:
    return 221;
  case CountryCode.tls:
    return 222;
  case CountryCode.ton:
    return 223;
  case CountryCode.tto:
    return 224;
  case CountryCode.tun:
    return 225;
  case CountryCode.tur:
    return 226;
  case CountryCode.tuv:
    return 227;
  case CountryCode.twn:
    return 228;
  case CountryCode.tza:
    return 229;
  case CountryCode.uga:
    return 230;
  case CountryCode.ukr:
    return 231;
  case CountryCode.umi:
    return 232;
  case CountryCode.ury:
    return 233;
  case CountryCode.usa:
    return 234;
  case CountryCode.uzb:
    return 235;
  case CountryCode.vat:
    return 236;
  case CountryCode.vct:
    return 237;
  case CountryCode.ven:
    return 238;
  case CountryCode.vgb:
    return 239;
  case CountryCode.vir:
    return 240;
  case CountryCode.vnm:
    return 241;
  case CountryCode.vut:
    return 242;
  case CountryCode.wlf:
    return 243;
  case CountryCode.wsm:
    return 244;
  case CountryCode.yem:
    return 245;
  case CountryCode.zaf:
    return 246;
  case CountryCode.zmb:
    return 247;
  case CountryCode.zwe:
    return 248;
  default:
    throw StateError("Invalid enum value $value for CountryCode enum.");
  }
}

CountryCode sdkCoreCountrycodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return CountryCode.abw;
  case 1:
    return CountryCode.afg;
  case 2:
    return CountryCode.ago;
  case 3:
    return CountryCode.aia;
  case 4:
    return CountryCode.ala;
  case 5:
    return CountryCode.alb;
  case 6:
    return CountryCode.and;
  case 7:
    return CountryCode.are;
  case 8:
    return CountryCode.arg;
  case 9:
    return CountryCode.arm;
  case 10:
    return CountryCode.asm;
  case 11:
    return CountryCode.ata;
  case 12:
    return CountryCode.atf;
  case 13:
    return CountryCode.atg;
  case 14:
    return CountryCode.aus;
  case 15:
    return CountryCode.aut;
  case 16:
    return CountryCode.aze;
  case 17:
    return CountryCode.bdi;
  case 18:
    return CountryCode.bel;
  case 19:
    return CountryCode.ben;
  case 20:
    return CountryCode.bes;
  case 21:
    return CountryCode.bfa;
  case 22:
    return CountryCode.bgd;
  case 23:
    return CountryCode.bgr;
  case 24:
    return CountryCode.bhr;
  case 25:
    return CountryCode.bhs;
  case 26:
    return CountryCode.bih;
  case 27:
    return CountryCode.blm;
  case 28:
    return CountryCode.blr;
  case 29:
    return CountryCode.blz;
  case 30:
    return CountryCode.bmu;
  case 31:
    return CountryCode.bol;
  case 32:
    return CountryCode.bra;
  case 33:
    return CountryCode.brb;
  case 34:
    return CountryCode.brn;
  case 35:
    return CountryCode.btn;
  case 36:
    return CountryCode.bvt;
  case 37:
    return CountryCode.bwa;
  case 38:
    return CountryCode.caf;
  case 39:
    return CountryCode.can;
  case 40:
    return CountryCode.cck;
  case 41:
    return CountryCode.che;
  case 42:
    return CountryCode.chl;
  case 43:
    return CountryCode.chn;
  case 44:
    return CountryCode.civ;
  case 45:
    return CountryCode.cmr;
  case 46:
    return CountryCode.cod;
  case 47:
    return CountryCode.cog;
  case 48:
    return CountryCode.cok;
  case 49:
    return CountryCode.col;
  case 50:
    return CountryCode.com;
  case 51:
    return CountryCode.cpv;
  case 52:
    return CountryCode.cri;
  case 53:
    return CountryCode.cub;
  case 54:
    return CountryCode.cuw;
  case 55:
    return CountryCode.cxr;
  case 56:
    return CountryCode.cym;
  case 57:
    return CountryCode.cyp;
  case 58:
    return CountryCode.cze;
  case 59:
    return CountryCode.deu;
  case 60:
    return CountryCode.dji;
  case 61:
    return CountryCode.dma;
  case 62:
    return CountryCode.dnk;
  case 63:
    return CountryCode.dom;
  case 64:
    return CountryCode.dza;
  case 65:
    return CountryCode.ecu;
  case 66:
    return CountryCode.egy;
  case 67:
    return CountryCode.eri;
  case 68:
    return CountryCode.esh;
  case 69:
    return CountryCode.esp;
  case 70:
    return CountryCode.est;
  case 71:
    return CountryCode.eth;
  case 72:
    return CountryCode.fin;
  case 73:
    return CountryCode.fji;
  case 74:
    return CountryCode.flk;
  case 75:
    return CountryCode.fra;
  case 76:
    return CountryCode.fro;
  case 77:
    return CountryCode.fsm;
  case 78:
    return CountryCode.gab;
  case 79:
    return CountryCode.gbr;
  case 80:
    return CountryCode.geo;
  case 81:
    return CountryCode.ggy;
  case 82:
    return CountryCode.gha;
  case 83:
    return CountryCode.gib;
  case 84:
    return CountryCode.gin;
  case 85:
    return CountryCode.glp;
  case 86:
    return CountryCode.gmb;
  case 87:
    return CountryCode.gnb;
  case 88:
    return CountryCode.gnq;
  case 89:
    return CountryCode.grc;
  case 90:
    return CountryCode.grd;
  case 91:
    return CountryCode.grl;
  case 92:
    return CountryCode.gtm;
  case 93:
    return CountryCode.guf;
  case 94:
    return CountryCode.gum;
  case 95:
    return CountryCode.guy;
  case 96:
    return CountryCode.hkg;
  case 97:
    return CountryCode.hmd;
  case 98:
    return CountryCode.hnd;
  case 99:
    return CountryCode.hrv;
  case 100:
    return CountryCode.hti;
  case 101:
    return CountryCode.hun;
  case 102:
    return CountryCode.idn;
  case 103:
    return CountryCode.imn;
  case 104:
    return CountryCode.ind;
  case 105:
    return CountryCode.iot;
  case 106:
    return CountryCode.irl;
  case 107:
    return CountryCode.irn;
  case 108:
    return CountryCode.irq;
  case 109:
    return CountryCode.isl;
  case 110:
    return CountryCode.isr;
  case 111:
    return CountryCode.ita;
  case 112:
    return CountryCode.jam;
  case 113:
    return CountryCode.jey;
  case 114:
    return CountryCode.jor;
  case 115:
    return CountryCode.jpn;
  case 116:
    return CountryCode.kaz;
  case 117:
    return CountryCode.ken;
  case 118:
    return CountryCode.kgz;
  case 119:
    return CountryCode.khm;
  case 120:
    return CountryCode.kir;
  case 121:
    return CountryCode.kna;
  case 122:
    return CountryCode.kor;
  case 123:
    return CountryCode.kwt;
  case 124:
    return CountryCode.lao;
  case 125:
    return CountryCode.lbn;
  case 126:
    return CountryCode.lbr;
  case 127:
    return CountryCode.lby;
  case 128:
    return CountryCode.lca;
  case 129:
    return CountryCode.lie;
  case 130:
    return CountryCode.lka;
  case 131:
    return CountryCode.lso;
  case 132:
    return CountryCode.ltu;
  case 133:
    return CountryCode.lux;
  case 134:
    return CountryCode.lva;
  case 135:
    return CountryCode.mac;
  case 136:
    return CountryCode.maf;
  case 137:
    return CountryCode.mar;
  case 138:
    return CountryCode.mco;
  case 139:
    return CountryCode.mda;
  case 140:
    return CountryCode.mdg;
  case 141:
    return CountryCode.mdv;
  case 142:
    return CountryCode.mex;
  case 143:
    return CountryCode.mhl;
  case 144:
    return CountryCode.mkd;
  case 145:
    return CountryCode.mli;
  case 146:
    return CountryCode.mlt;
  case 147:
    return CountryCode.mmr;
  case 148:
    return CountryCode.mne;
  case 149:
    return CountryCode.mng;
  case 150:
    return CountryCode.mnp;
  case 151:
    return CountryCode.moz;
  case 152:
    return CountryCode.mrt;
  case 153:
    return CountryCode.msr;
  case 154:
    return CountryCode.mtq;
  case 155:
    return CountryCode.mus;
  case 156:
    return CountryCode.mwi;
  case 157:
    return CountryCode.mys;
  case 158:
    return CountryCode.myt;
  case 159:
    return CountryCode.nam;
  case 160:
    return CountryCode.ncl;
  case 161:
    return CountryCode.ner;
  case 162:
    return CountryCode.nfk;
  case 163:
    return CountryCode.nga;
  case 164:
    return CountryCode.nic;
  case 165:
    return CountryCode.niu;
  case 166:
    return CountryCode.nld;
  case 167:
    return CountryCode.nor;
  case 168:
    return CountryCode.npl;
  case 169:
    return CountryCode.nru;
  case 170:
    return CountryCode.nzl;
  case 171:
    return CountryCode.omn;
  case 172:
    return CountryCode.pak;
  case 173:
    return CountryCode.pan;
  case 174:
    return CountryCode.pcn;
  case 175:
    return CountryCode.per;
  case 176:
    return CountryCode.phl;
  case 177:
    return CountryCode.plw;
  case 178:
    return CountryCode.png;
  case 179:
    return CountryCode.pol;
  case 180:
    return CountryCode.pri;
  case 181:
    return CountryCode.prk;
  case 182:
    return CountryCode.prt;
  case 183:
    return CountryCode.pry;
  case 184:
    return CountryCode.pse;
  case 185:
    return CountryCode.pyf;
  case 186:
    return CountryCode.qat;
  case 187:
    return CountryCode.reu;
  case 188:
    return CountryCode.rou;
  case 189:
    return CountryCode.rus;
  case 190:
    return CountryCode.rwa;
  case 191:
    return CountryCode.sau;
  case 192:
    return CountryCode.sdn;
  case 193:
    return CountryCode.sen;
  case 194:
    return CountryCode.sgp;
  case 195:
    return CountryCode.sgs;
  case 196:
    return CountryCode.shn;
  case 197:
    return CountryCode.sjm;
  case 198:
    return CountryCode.slb;
  case 199:
    return CountryCode.sle;
  case 200:
    return CountryCode.slv;
  case 201:
    return CountryCode.smr;
  case 202:
    return CountryCode.som;
  case 203:
    return CountryCode.spm;
  case 204:
    return CountryCode.srb;
  case 205:
    return CountryCode.ssd;
  case 206:
    return CountryCode.stp;
  case 207:
    return CountryCode.sur;
  case 208:
    return CountryCode.svk;
  case 209:
    return CountryCode.svn;
  case 210:
    return CountryCode.swe;
  case 211:
    return CountryCode.swz;
  case 212:
    return CountryCode.sxm;
  case 213:
    return CountryCode.syc;
  case 214:
    return CountryCode.syr;
  case 215:
    return CountryCode.tca;
  case 216:
    return CountryCode.tcd;
  case 217:
    return CountryCode.tgo;
  case 218:
    return CountryCode.tha;
  case 219:
    return CountryCode.tjk;
  case 220:
    return CountryCode.tkl;
  case 221:
    return CountryCode.tkm;
  case 222:
    return CountryCode.tls;
  case 223:
    return CountryCode.ton;
  case 224:
    return CountryCode.tto;
  case 225:
    return CountryCode.tun;
  case 226:
    return CountryCode.tur;
  case 227:
    return CountryCode.tuv;
  case 228:
    return CountryCode.twn;
  case 229:
    return CountryCode.tza;
  case 230:
    return CountryCode.uga;
  case 231:
    return CountryCode.ukr;
  case 232:
    return CountryCode.umi;
  case 233:
    return CountryCode.ury;
  case 234:
    return CountryCode.usa;
  case 235:
    return CountryCode.uzb;
  case 236:
    return CountryCode.vat;
  case 237:
    return CountryCode.vct;
  case 238:
    return CountryCode.ven;
  case 239:
    return CountryCode.vgb;
  case 240:
    return CountryCode.vir;
  case 241:
    return CountryCode.vnm;
  case 242:
    return CountryCode.vut;
  case 243:
    return CountryCode.wlf;
  case 244:
    return CountryCode.wsm;
  case 245:
    return CountryCode.yem;
  case 246:
    return CountryCode.zaf;
  case 247:
    return CountryCode.zmb;
  case 248:
    return CountryCode.zwe;
  default:
    throw StateError("Invalid numeric value $handle for CountryCode enum.");
  }
}

void sdkCoreCountrycodeReleaseFfiHandle(int handle) {}

final _sdkCoreCountrycodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_CountryCode_create_handle_nullable'));
final _sdkCoreCountrycodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_CountryCode_release_handle_nullable'));
final _sdkCoreCountrycodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_CountryCode_get_value_nullable'));

Pointer<Void> sdkCoreCountrycodeToFfiNullable(CountryCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreCountrycodeToFfi(value);
  final result = _sdkCoreCountrycodeCreateHandleNullable(_handle);
  sdkCoreCountrycodeReleaseFfiHandle(_handle);
  return result;
}

CountryCode? sdkCoreCountrycodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreCountrycodeGetValueNullable(handle);
  final result = sdkCoreCountrycodeFromFfi(_handle);
  sdkCoreCountrycodeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreCountrycodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreCountrycodeReleaseHandleNullable(handle);

// End of CountryCode "private" section.


