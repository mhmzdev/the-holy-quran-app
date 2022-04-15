import 'dart:async';

import 'package:al_quran/models/verse/verse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:al_quran/models/chapter/chapter.dart';
import 'package:hive_flutter/adapters.dart';

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
      Chapter? cached = await repo.chapterHive(id);
      if (cached == null) {
        Chapter? data = await repo.chapterApi(id);
        emit(ChapterFetchSuccess(data: data));
      } else {
        emit(ChapterFetchSuccess(data: cached));
      }
    } catch (e) {
      emit(ChapterFetchFailed(message: e.toString()));
    }
  }
}
