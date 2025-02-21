import 'package:al_quran_api/al_quran_api.dart';

abstract interface class IJuzRepo {
  Future<Juz?> juzFetchHive(num juxIndex);
  Future<Juz?> juzFetchApi(num juxIndex);
}
