---
inject: true
before: part
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart
skip_if: flutter_bloc/flutter_bloc.dart
---
import 'package:flutter_bloc/flutter_bloc.dart';