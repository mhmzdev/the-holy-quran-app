part of 'cubit.dart';

class JuzRepository {
  Future<Juz?> juzFetchApi(num juzNumber) =>
      JuzDataProvider.juzFetchApi(juzNumber);

  Future<Juz?> juzFetchHive(num juzNumber) =>
      JuzDataProvider.juzFetchHive(juzNumber);
}
