import 'package:al_quran_api/al_quran_api.dart';
import 'package:al_quran_repo/al_quran_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.dart';
part 'event.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  ChapterBloc({required ChapterRepo repo})
      : _repo = repo,
        super(ChapterDefault()) {
    on<ChapterFetch>(_onChapterFetch);
  }

  final ChapterRepo _repo;

  void _onChapterFetch(
    ChapterFetch event,
    Emitter<ChapterState> emit,
  ) async {
    emit(const ChapterFetchLoading());

    try {
      List<Chapter>? cached;

      if (event.api) {
        cached = await _repo.getChapters();
      } else {
        cached = await _repo.getChaptersHive();
      }

      if (cached == null) {
        final data = await _repo.getChapters();
        emit(ChapterFetchSuccess(data: data));
      } else {
        emit(ChapterFetchSuccess(data: cached));
      }
    } catch (e) {
      emit(ChapterFetchFailed(message: e.toString()));
    }
  }
}
