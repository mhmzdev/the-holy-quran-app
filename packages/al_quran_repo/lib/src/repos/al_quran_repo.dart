import 'package:al_quran_api/al_quran_api.dart';

class AlQuranRepo {
  AlQuranRepo({AlQuranDataProvider? provider})
      : _provider = provider ?? AlQuranDataProvider();

  final AlQuranDataProvider _provider;

  Future<List<Chapter>?> getChapters() async {
    try {
      return await _provider.getChapters();
    } catch (e) {
      throw Exception('Internal Repository Error');
    }
  }

  Future<List<Chapter>?> getChaptersHive() async {
    try {
      return await _provider.getChaptersHive();
    } catch (e) {
      throw Exception('Internal Repository Error');
    }
  }

  Future<Juz?> juzFetchApi(num juzNumber) async {
    try {
      return await _provider.juzFetchApi(juzNumber);
    } catch (e) {
      throw Exception('Internal Repository Error');
    }
  }

  Future<Juz?> juzFetchHive(num juzNumber) async {
    try {
      return await _provider.juzFetchHive(juzNumber);
    } catch (e) {
      throw Exception('Internal Repository Error');
    }
  }
}
