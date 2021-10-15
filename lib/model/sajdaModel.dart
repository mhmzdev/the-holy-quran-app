class SajdaList {
  final List<SajdaAyat>? sajdaAyahs;
  SajdaList({this.sajdaAyahs});

  factory SajdaList.fromJSON(Map<String, dynamic> json) {
    Iterable allSajdas = json['data']['ayahs'];
    List<SajdaAyat> sajdas =
        allSajdas.map((e) => SajdaAyat.fromJSON(e)).toList();

    return SajdaList(sajdaAyahs: sajdas);
  }
}

class SajdaAyat {
  final int? number;
  final String? text;
  final String? surahName;
  final String? surahEnglishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final int? juzNumber;
  final int? manzilNumber;
  final int? rukuNumber;
  final int? sajdaNumber;

  SajdaAyat(
      {this.number,
      this.sajdaNumber,
      this.englishNameTranslation,
      this.juzNumber,
      this.manzilNumber,
      this.revelationType,
      this.rukuNumber,
      this.surahEnglishName,
      this.surahName,
      this.text});

  factory SajdaAyat.fromJSON(Map<String, dynamic> json) {
    return SajdaAyat(
        number: json['number'],
        text: json['text'],
        surahName: json['surah']['name'],
        surahEnglishName: json['surah']['englishName'],
        englishNameTranslation: json['surah']['englishNameTranslation'],
        juzNumber: json['juz'],
        manzilNumber: json['manzil'],
        rukuNumber: json['ruku'],
        revelationType: json['surah']['revelationType'],
        sajdaNumber: json['sajda']['id']);
  }
}
