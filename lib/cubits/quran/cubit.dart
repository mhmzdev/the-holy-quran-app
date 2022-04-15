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

class QuranCubit extends Cubit<QuranState> {
  static QuranCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<QuranCubit>(context, listen: listen);

  QuranCubit() : super(QuranDefault());

  final repo = QuranRepository();

  Future<void> fetch() async {
    emit(const QuranFetchLoading());
    try {
      Chapter? cached = await repo.quranHive();
      if (cached == null) {
        Chapter? data = await repo.quranApi();
        emit(QuranFetchSuccess(data: data));
      } else {
        emit(QuranFetchSuccess(data: cached));
      }
    } catch (e) {
      emit(QuranFetchFailed(message: e.toString()));
    }
  }
}
