---
inject: true
before: part
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart
skip_if: utils/flash.dart
---
import 'package:al_quran/utils/flash.dart';