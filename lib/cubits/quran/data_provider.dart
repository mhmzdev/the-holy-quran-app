part of 'cubit.dart';

class QuranDataProvider {
  static final cache = Hive.box('data');
  static Dio ins = Dio();

  static Future<List<Ayah?>?> quranApi(int pageNumber) async {
    try {
      final resp = await ins.get(
        'http://api.alquran.cloud/v1/page/$pageNumber/quran-uthmani',
      );
      final Map<String, dynamic> raw = resp.data['data'];
      final List ayahs = raw['ayahs'];

      final List<Ayah?>? pageAyahs = List.generate(
        ayahs.length,
        (index) => Ayah.fromMap(
          ayahs[index],
        ),
      );

      await cache.put('ayahs$pageNumber', pageAyahs);

      return pageAyahs;
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

  static Future<List<Ayah?>?> quranHive(int pageNumber) async {
    try {
      final cachedData = await cache.get('ayahs$pageNumber');
      if (cachedData == null) return null;

      final List<Ayah?>? ayahs = List.from(cachedData);

      return ayahs;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
