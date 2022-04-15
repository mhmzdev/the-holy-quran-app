part of 'cubit.dart';

class QuranDataProvider {
  static Dio ins = Dio();

  static Future<Chapter> quranApi() async {
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

      return Chapter(
        verses: verses,
      );
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
}
