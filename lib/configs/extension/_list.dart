part of '../app.dart';

extension ListExt on List? {
  bool get available => this != null && this!.isNotEmpty;
}
