import 'package:al_quran/blocs/chapter/bloc.dart';
import 'package:al_quran_api/al_quran_api.dart';

/// Mock Data
final chapterMocks = List.generate(
  114,
  (index) => Chapter(
    number: index + 1,
    name: 'Surah ${(index + 1).toString().padLeft(2, '0')}',
    revelationType: 'RANDOM',
    ayahs: List.generate(
      10,
      (index) => Ayah(
        number: index + 1,
        text: 'Ayah ${(index + 1).toString().padLeft(2, '0')}',
      ),
    ).toList(),
    englishName: 'Surah ${(index + 1).toString().padLeft(2, '0')}',
    englishNameTranslation: 'Surah ${(index + 1).toString().padLeft(2, '0')}',
  ),
);

/// States
class MockChapterState extends ChapterState {
  MockChapterState() : super(data: chapterMocks);
}
