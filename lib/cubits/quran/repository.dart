part of 'cubit.dart';

class QuranRepository {
  Future<List<Ayah?>?> quranApi(int pg) => QuranDataProvider.quranApi(pg);
  Future<List<Ayah?>?> quranHive(int pg) => QuranDataProvider.quranHive(pg);
}
