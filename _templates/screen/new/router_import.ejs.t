---
inject: true
to: lib/router/router.dart
after: // imports
skip_if: import 'package:al_quran/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';
---
import 'package:al_quran/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';