part of 'cubit.dart';

class ChapterDataDataProvider {
  static Dio ins = Dio();

  static Future<List<ChapterData>> chapterDataListApi() async {
    try {
      final resp = await ins.get(
        'https://api.quran.com/api/v4/chapters',
      );
      final List raw = resp.data['chapters'];
      final List<ChapterData> chapters = List.generate(
        raw.length,
        (index) => ChapterData.fromMap(
          raw[index],
        ),
      );

      return chapters;
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
