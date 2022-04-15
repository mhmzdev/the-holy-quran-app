import 'dart:async';

import 'package:al_quran/models/chapter_data.dart';
import 'package:al_quran/models/verse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:al_quran/models/chapter.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class ChapterCubit extends Cubit<ChapterState> {
  static ChapterCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<ChapterCubit>(context, listen: listen);

  ChapterCubit() : super(ChapterDefault());

  final repo = ChapterRepository();

  Future<void> fetch(num id) async {
    emit(const ChapterFetchLoading());
    try {
      final data = await repo.chapterApi(id);

      emit(ChapterFetchSuccess(data: data));
    } catch (e) {
      emit(ChapterFetchFailed(message: e.toString()));
    }
  }
}
