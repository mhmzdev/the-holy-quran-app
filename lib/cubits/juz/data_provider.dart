part of 'cubit.dart';

class JuzDataProvider {
  static final cache = Hive.box('data');
  static Dio ins = Dio();

  static Future<Chapter?> juzFetchApi(num juzNumber) async {
    try {
      final resp = await ins.get(
        'https://api.quran.com/api/v4/quran/verses/indopak?juz_number=$juzNumber',
      );
      final List raw = resp.data['verses'];
      final List<Verse> verses = List.generate(
        raw.length,
        (index) => Verse.fromMap(
          raw[index],
        ),
      );

      final chapter = Chapter(
        verses: verses,
      );

      await cache.put(
        'juz$juzNumber',
        chapter,
      );

      return chapter;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<Chapter?> juzFetchHive(num juzNumber) async {
    try {
      final chapter = await cache.get('juz$juzNumber');
      return chapter;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
