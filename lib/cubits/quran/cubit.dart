import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:al_quran/models/ayah/ayah.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class QuranCubit extends Cubit<QuranState> {
  static QuranCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<QuranCubit>(context, listen: listen);

  QuranCubit() : super(QuranDefault());

  final repo = QuranRepository();

  Future<void> fetch(int pg) async {
    emit(const QuranFetchLoading());
    try {
      List<Ayah?>? cached = await repo.quranHive(pg);

      if (cached == null) {
        List<Ayah?>? data = await repo.quranApi(pg);
        emit(QuranFetchSuccess(data: data));
      } else {
        emit(QuranFetchSuccess(data: cached));
      }
    } catch (e) {
      emit(QuranFetchFailed(message: e.toString()));
    }
  }
}
