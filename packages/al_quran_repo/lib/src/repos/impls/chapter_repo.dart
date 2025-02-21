import 'package:al_quran_api/al_quran_api.dart';
import 'package:al_quran_repo/src/repos/interfaces/chapter_interface.dart';

class ChapterRepo implements IChapterRepo {
  ChapterRepo({AlQuranDataProviderImpl? provider})
      : _provider = provider ?? AlQuranDataProviderImpl();

  final AlQuranDataProviderImpl _provider;

  @override
  Future<List<Chapter>> getChapters() async {
    try {
      return await _provider.getChapters();
    } catch (e) {
      throw Exception('Internal Repository Error');
    }
  }

  @override
  Future<List<Chapter>?> getChaptersHive() async {
    try {
      return await _provider.getChaptersHive();
    } catch (e) {
      throw Exception('Internal Repository Error');
    }
  }
}
