import 'dart:async';

import 'package:al_quran/models/verse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:al_quran/models/chapter.dart';

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
      final data = await repo.quranApi();

      emit(QuranFetchSuccess(data: data));
    } catch (e) {
      emit(QuranFetchFailed(message: e.toString()));
    }
  }
}
