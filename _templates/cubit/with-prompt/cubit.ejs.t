---
to: lib/cubits/<%= h.changeCase.snake(name) %>/cubit.dart
---
<% pascal = h.changeCase.pascal(name) %>
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:al_quran/models/<%= h.changeCase.snake(model) %>.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class <%= pascal %>Cubit extends Cubit< <%= pascal %>State> {
  static <%= pascal %>Cubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of< <%= pascal %>Cubit>(context, listen: listen);

  <%= pascal %>Cubit() : super(<%= pascal %>Default());

  final repo = <%= pascal %>Repository();

  Future<void> fetch() async {
    emit(<%= pascal %>FetchLoading());
    try {
      final data = await repo.fetch();

      emit(<%= pascal %>FetchSuccess(data: data));
    } catch (e) {
      emit(<%= pascal %>FetchFailed(message: e.toString()));
    }
  } 
}
