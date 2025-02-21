part of '../app.dart';

extension SuperNullableString<T> on String? {
  bool get available => this != null && this!.isNotEmpty;
}

extension SuperString<T> on String {
  Future<T?> push<V>(BuildContext context, {Object? arguments}) =>
      Navigator.pushNamed<T?>(
        context,
        this,
        arguments: arguments,
      );

  Future<void> pushReplace(BuildContext context, {Object? arguments}) =>
      Navigator.pushReplacementNamed(
        context,
        this,
        arguments: arguments,
      );

  Future<void> pop<Type extends Object?>(
    BuildContext context, [
    T? result,
  ]) async =>
      Navigator.pop(context, result);

  Future<void> popUntil(BuildContext context) async =>
      Navigator.popUntil(context, ModalRoute.withName(this));

  String get splitError => split(': ').lastOrNull ?? 'Unknown error';
}
