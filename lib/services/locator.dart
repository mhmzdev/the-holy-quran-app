import 'package:al_quran/blocs/bookmarks/bloc.dart';
import 'package:al_quran/blocs/chapter/bloc.dart';
import 'package:al_quran/blocs/juz/bloc.dart';
import 'package:al_quran_api/al_quran_api.dart';
import 'package:al_quran_repo/al_quran_repo.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Providers
  sl.registerSingleton<AlQuranDataProviderImpl>(AlQuranDataProviderImpl());

  // Repos
  sl.registerSingleton<ChapterRepo>(
    ChapterRepo(
      provider: sl(),
    ),
  );
  sl.registerSingleton<JuzRepo>(
    JuzRepo(
      provider: sl(),
    ),
  );
  sl.registerSingleton<BookmarksRepo>(
    BookmarksRepo(
      provider: sl(),
    ),
  );

  // Blocs
  sl.registerSingleton<ChapterBloc>(
    ChapterBloc(
      repo: sl(),
    ),
  );

  sl.registerSingleton<JuzBloc>(
    JuzBloc(
      repo: sl(),
    ),
  );

  sl.registerSingleton<BookmarksBloc>(
    BookmarksBloc(
      repo: sl(),
    ),
  );
}
