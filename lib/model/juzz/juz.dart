import 'package:hive/hive.dart';

part 'juz.g.dart';

@HiveType(typeId: 2)
class JuzAyahs {
  @HiveField(0)
  final String? ayahsText;
  @HiveField(1)
  final int? ayahNumber;
  @HiveField(2)
  final String? surahName;

  JuzAyahs({this.ayahsText, this.surahName, this.ayahNumber});

  factory JuzAyahs.fromJSON(Map<String, dynamic> json) {
    return JuzAyahs(
      ayahNumber: json['number'],
      ayahsText: json['text'],
      surahName: json['surah']['name'],
    );
  }
}
