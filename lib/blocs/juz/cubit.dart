import 'dart:async';

import 'package:al_quran_api/al_quran_api.dart';
import 'package:al_quran_repo/al_quran_repo.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class JuzCubit extends Cubit<JuzState> {
  static JuzCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<JuzCubit>(context, listen: listen);

  JuzCubit({required JuzRepo repo})
      : _repo = repo,
        super(JuzDefault());

  final JuzRepo _repo;

  Future<void> fetch(num juzNumber) async {
    emit(const JuzFetchLoading());

    try {
      final cached = await _repo.juzFetchHive(juzNumber);
      if (cached == null) {
        final data = await _repo.juzFetchApi(juzNumber);
        emit(JuzFetchSuccess(data: data));
      } else {
        emit(JuzFetchSuccess(data: cached));
      }
    } catch (e) {
      emit(JuzFetchFailed(message: e.toString()));
    }
  }
}
