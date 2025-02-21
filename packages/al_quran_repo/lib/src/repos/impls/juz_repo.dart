import 'package:al_quran_api/al_quran_api.dart';
import 'package:al_quran_repo/src/repos/interfaces/juz_interface.dart';

class JuzRepo implements IJuzRepo {
  JuzRepo({AlQuranDataProviderImpl? provider})
      : _provider = provider ?? AlQuranDataProviderImpl();

  final AlQuranDataProviderImpl _provider;

  @override
  Future<Juz?> juzFetchApi(num juzNumber) async {
    try {
      return await _provider.juzFetchApi(juzNumber);
    } catch (e) {
      throw Exception('Internal Repository Error');
    }
  }

  @override
  Future<Juz?> juzFetchHive(num juzNumber) async {
    try {
      return await _provider.juzFetchHive(juzNumber);
    } catch (e) {
      throw Exception('Internal Repository Error');
    }
  }
}
