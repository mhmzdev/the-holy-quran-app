import 'dart:async';

import 'package:al_quran_api/al_quran_api.dart';
import 'package:al_quran_repo/al_quran_repo.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class ChapterCubit extends Cubit<ChapterState> {
  static ChapterCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<ChapterCubit>(context, listen: listen);

  ChapterCubit() : super(ChapterDefault());

  final _repo = AlQuranRepo();

  Future<void> fetch({bool api = false}) async {
    emit(const ChapterFetchLoading());
    try {
      List<Chapter>? cached;

      if (api) {
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
