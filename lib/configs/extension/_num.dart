part of '../app.dart';

extension SuperNum on num {
  String get currency => '\$${toStringAsFixed(2)}';
}
