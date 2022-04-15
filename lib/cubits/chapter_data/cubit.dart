import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:al_quran/models/chapter_data/chapter_data.dart';
import 'package:hive_flutter/adapters.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class ChapterDataCubit extends Cubit<ChapterDataState> {
  static ChapterDataCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<ChapterDataCubit>(context, listen: listen);

  ChapterDataCubit() : super(ChapterDataDefault());

  final repo = ChapterDataRepository();

  Future<void> fetch() async {
    emit(const ChapterDataFetchLoading());
    try {
      List<ChapterData?>? cached = await repo.chapterDataListHive();
      if (cached == null) {
        List<ChapterData?>? data = await repo.chapterDataListApi();
        emit(ChapterDataFetchSuccess(data: data));
      } else {
        emit(ChapterDataFetchSuccess(data: cached));
      }
    } catch (e) {
      emit(ChapterDataFetchFailed(message: e.toString()));
    }
  }
}
