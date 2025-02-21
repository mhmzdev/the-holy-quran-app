import 'package:al_quran_api/al_quran_api.dart';

abstract interface class IChapterRepo {
  Future<List<Chapter>> getChapters();
  Future<List<Chapter>?> getChaptersHive();
}
