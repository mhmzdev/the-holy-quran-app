import 'package:al_quran/model/juzz/juz.dart';
import 'package:hive/hive.dart';

part 'juz_list.g.dart';

@HiveType(typeId: 1)
class JuzList {
  @HiveField(0)
  final int? juzNumber;

  @HiveField(1)
  final List<JuzAyahs>? juzAyahs;

  JuzList({this.juzAyahs, this.juzNumber});

  factory JuzList.fromJSON(Map<String, dynamic> json) {
    Iterable juzAyahs = json['data']['ayahs'];
    List<JuzAyahs> juzAyahsList =
        juzAyahs.map((e) => JuzAyahs.fromJSON(e)).toList();

    return JuzList(juzAyahs: juzAyahsList, juzNumber: json['data']['number']);
  }
}
