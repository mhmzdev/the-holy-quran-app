part of 'cubit.dart';

class JuzDataProvider {
  static Dio ins = Dio();

  static Future<Chapter> juzFetchApi(num juzNumber) async {
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

      return Chapter(
        verses: verses,
      );
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
