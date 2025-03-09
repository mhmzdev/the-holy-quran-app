part of 'bloc.dart';

sealed class JuzEvent {
  const JuzEvent();
}

class JuzFetch extends JuzEvent {
  const JuzFetch({required this.juzIndex});

  final num juzIndex;
}
