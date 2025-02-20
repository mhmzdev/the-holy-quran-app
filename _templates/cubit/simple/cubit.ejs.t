---
to: lib/blocs/<%= h.changeCase.snake(name) %>/cubit.dart
---
<% pascal = h.changeCase.pascal(name) %>
<% pmodel = h.changeCase.pascal(model) %>
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:al_quran/configs/configs.dart';
import 'package:al_quran/services/api.dart';


part 'data_provider.dart';
part 'data_parser.dart';
part 'data_mocks.dart';

class <%= pascal %>Cubit extends Cubit< CubitState< <%= pmodel %>>> {
  static <%= pascal %>Cubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of< <%= pascal %>Cubit>(context, listen: listen);

  <%= pascal %>Cubit() : super(CubitState< <%= pmodel %>>());

  Future<void> fetch() async {
    emit(state.copyWith(action: CubitAction.loading));
    try {
      final data = await _<%= pascal %>Provider.fetch();
      emit(state.copyWith(action: CubitAction.success, data: data));
    } catch (e) {
      emit(
        state.copyWith(
          action: CubitAction.failed,
          message: e.toString(),
        ),
      );
    }
  }
}
// end-cubit
