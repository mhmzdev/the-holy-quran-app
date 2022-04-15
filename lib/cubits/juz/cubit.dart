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

class JuzCubit extends Cubit<JuzState> {
  static JuzCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<JuzCubit>(context, listen: listen);

  JuzCubit() : super(JuzDefault());

  final repo = JuzRepository();

  Future<void> fetch(num juzNumber) async {
    emit(const JuzFetchLoading());
    try {
      final data = await repo.juzFetchApi(juzNumber);

      emit(JuzFetchSuccess(data: data));
    } catch (e) {
      emit(JuzFetchFailed(message: e.toString()));
    }
  }
}
