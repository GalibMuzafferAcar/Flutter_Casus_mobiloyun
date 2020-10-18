import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Oyuncular {
  String ad;
  String rol;
  String konum;
  Color renk;
  String image;
  static List<Oyuncular> tumOyuncular;
  Oyuncular(this.ad,this.renk);
}
List<String> lokasyonlar = [
  'Uçak',
  'Banka',
  'Kumsal',
  'Tiyatro',
  'Kumarhane',
  'Katedral',
  'Sirk Çadırı',
  'İş Partisi',
  'Haçlı Ordusu',
  'Spa',
  'Büyükelçilik',
  'Hastane',
  'Otel',
  'Askeri Üs',
  'Film Stüdyosu',
  'Yolcu Gemisi',
  'Yolcu Treni',
  'Korsan Gemisi',
  'Kutup Araştırma Merkezi',
  'Polis Merkezi',
  'Restoran',
  'Okul',
  'Araba Tamircisi',
  'Uzay İstasyonu',
  'Denizaltı',
  'Süpermarket',
  'Üniversite',
  'Lünapark',
  'Sanat Müzesi',
  'Şeker Fabrikası',
  'Mezarlık',
  'Kömür Madeni',
  'İnşaat Alanı',
  'Oyun Fuarı',
  'Benzin İstasyonu',
  'Liman',
  'Hapishane',
  'Caz Kulübü',
  'Kütüphane',
  'Gece Kulübü',
  'Yarış Pisti',
  'Huzurevi',
  'Gezi Otobüsü',
  'Stadyum',
  'Metro',
  'Düğün',
  'Hayvanat Bahçesi'
];
int SpySayisi = 1;
List<String> oyunlokasyon = lokasyonlar;
Brightness secim= Brightness.dark;