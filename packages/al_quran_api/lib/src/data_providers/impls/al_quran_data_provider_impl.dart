import 'package:al_quran_api/src/data_providers/interfaces/al_quran_data_provider.dart';
import 'package:al_quran_api/src/models/base.dart';
import 'package:al_quran_api/src/services/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AlQuranDataProviderImpl implements IAlQuranDataProvider {
  AlQuranDataProviderImpl({BaseApi? api}) : _api = api ?? Api.ins;

  final cache = Hive.box('data');
  final BaseApi _api;

  @override
  Future<Juz?> juzFetchApi(num juzNumber) async {
    try {
      final resp = await Api.ins.get(
        '/v1/juz/$juzNumber/quran-uthmani',
      );
      final Map<String, dynamic> raw = resp.data['data'];
      final juz = Juz.fromJson(raw);

      await cache.put(
        'juz$juzNumber',
        juz,
      );

      return juz;
    } catch (e) {
      throw Exception('Internal Juz API Error');
    }
  }

  @override
  Future<Juz?> juzFetchHive(num juzNumber) async {
    try {
      final data = await cache.get('juz$juzNumber');
      if (data == null) return null;

      final Juz? juz = data;
      return juz;
    } catch (e) {
      throw Exception('Internal Juz Hive Error');
    }
  }

  @override
  Future<List<Chapter>> getChapters() async {
    try {
      final response = await _api.get('/v1/quran/quran-uthmani');
      final Map<String, dynamic> raw = response.data['data'];

      final List data = raw['surahs'];
      final chapters = data.map((e) => Chapter.fromJson(e)).toList();

      await cache.put(
        'chapters',
        chapters,
      );

      return chapters;
    } catch (e) {
      throw Exception('Internal Chapters API Error');
    }
  }

  @override
  Future<List<Chapter>?> getChaptersHive() async {
    try {
      final chapter = await cache.get('chapters');
      if (chapter == null) return null;

      final chapters = List<Chapter>.from(chapter);

      return chapters;
    } catch (e) {
      throw Exception('Internal Chapters Hive Error');
    }
  }
}
