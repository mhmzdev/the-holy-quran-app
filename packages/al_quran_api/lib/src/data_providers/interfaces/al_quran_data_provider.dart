import 'package:al_quran_api/src/models/base.dart';

abstract interface class IAlQuranDataProvider {
  /// Chapters API
  Future<List<Chapter>> getChapters();
  Future<List<Chapter>?> getChaptersHive();

  /// Juz API
  Future<Juz?> juzFetchHive(num juxIndex);
  Future<Juz?> juzFetchApi(num juxIndex);
}
