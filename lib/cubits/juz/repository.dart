part of 'cubit.dart';

class JuzRepository {
  Future<Chapter?> juzFetchApi(num juzNumber) =>
      JuzDataProvider.juzFetchApi(juzNumber);

  Future<Chapter?> juzFetchHive(num juzNumber) =>
      JuzDataProvider.juzFetchHive(juzNumber);
}
