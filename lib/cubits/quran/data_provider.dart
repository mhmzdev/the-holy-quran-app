part of 'cubit.dart';

class QuranDataProvider {
  static final cache = Hive.box('data');
  static Dio ins = Dio();

  static Future<Chapter?> quranApi() async {
    try {
      final resp = await ins.get(
        'https://api.quran.com/api/v4/quran/verses/indopak',
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

      await cache.put('quran', chapter);

      return chapter;
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        throw Exception('Problem with internet connection');
      } else {
        throw Exception('Problem on our side, Please try again');
      }
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<Chapter?> quranHive() async {
    try {
      final cachedData = await cache.get('quran');
      return cachedData;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
