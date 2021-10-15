class SurahsList {
  final List<Surah>? surahs;

  SurahsList({this.surahs});

  factory SurahsList.fromJSON(Map<String, dynamic> json) {
    Iterable surahlist = json['data']['surahs'];
    List<Surah> surahsList = surahlist.map((i) => Surah.fromJSON(i)).toList();

    return SurahsList(surahs: surahsList);
  }
}

class Surah {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final List<Ayat>? ayahs;

  Surah(
      {this.number,
      this.revelationType,
      this.name,
      this.ayahs,
      this.englishName,
      this.englishNameTranslation});

  factory Surah.fromJSON(Map<String, dynamic> json) {
    Iterable ayahs = json['ayahs'];
    List<Ayat> ayahsList = ayahs.map((e) => Ayat.fromJSON((e))).toList();

    return Surah(
        name: json['name'],
        number: json['number'],
        englishName: json['englishName'],
        revelationType: json['revelationType'],
        englishNameTranslation: json['englishNameTranslation'],
        ayahs: ayahsList);
  }
}

class Ayat {
  final String? text;
  final int? number;
  Ayat({this.text, this.number});

  factory Ayat.fromJSON(Map<String, dynamic> json) {
    return Ayat(text: json['text'], number: json['numberInSurah']);
  }
}
