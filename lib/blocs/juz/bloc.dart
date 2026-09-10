import 'package:al_quran_api/al_quran_api.dart';
import 'package:al_quran_repo/al_quran_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.dart';
part 'state.dart';

class JuzBloc extends Bloc<JuzEvent, JuzState> {
  JuzBloc({required this._repo}) : super(JuzDefault()) {
    // Sequential: the splash dispatches JuzFetch for all 30 juz at once and
    // api.alquran.cloud allows ~12 requests/second. Processing one at a time
    // keeps the preload under the limit (equivalent to bloc_concurrency's
    // `sequential()` without the extra dependency).
    on<JuzFetch>(
      _onJuzFetch,
      transformer: (events, mapper) => events.asyncExpand(mapper),
    );
  }

  final JuzRepo _repo;

  void _onJuzFetch(JuzFetch event, Emitter<JuzState> emit) async {
    emit(const JuzFetchLoading());

    try {
      final cached = await _repo.juzFetchHive(event.juzIndex);
      if (cached == null) {
        final data = await _repo.juzFetchApi(event.juzIndex);
        emit(JuzFetchSuccess(data: data));
      } else {
        emit(JuzFetchSuccess(data: cached));
      }
    } catch (e) {
      emit(JuzFetchFailed(message: e.toString()));
    }
  }
}
