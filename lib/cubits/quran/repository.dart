part of 'cubit.dart';

class QuranRepository {
  Future<Chapter?> quranApi() => QuranDataProvider.quranApi();
  Future<Chapter?> quranHive() => QuranDataProvider.quranHive();
}
