part of 'cubit.dart';

class ChapterDataProvider {
  static final cache = Hive.box('data');
  static Dio ins = Dio();

  static Future<Chapter?> chapterApi(num id) async {
    try {
      final resp = await ins.get(
        'https://api.quran.com/api/v4/quran/verses/indopak?chapter_number=$id',
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
        'chapter$id',
        chapter,
      );

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

  static Future<Chapter?> chapterHive(num id) async {
    try {
      final chapter = await cache.get('chapter$id');
      return chapter;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
