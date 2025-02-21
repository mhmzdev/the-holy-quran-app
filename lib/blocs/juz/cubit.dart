import 'dart:async';

import 'package:al_quran/services/http/api.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:al_quran/models/juz/juz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      final cached = await repo.juzFetchHive(juzNumber);
      if (cached == null) {
        final data = await repo.juzFetchApi(juzNumber);
        emit(JuzFetchSuccess(data: data));
      } else {
        emit(JuzFetchSuccess(data: cached));
      }
    } catch (e) {
      emit(JuzFetchFailed(message: e.toString()));
    }
  }
}
