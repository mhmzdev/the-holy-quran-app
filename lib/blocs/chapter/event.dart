part of 'bloc.dart';

sealed class ChapterEvent {
  const ChapterEvent();
}

class ChapterFetch extends ChapterEvent {
  const ChapterFetch({this.api = false});

  final bool api;
}
