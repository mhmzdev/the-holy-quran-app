---
inject: true
to: lib/app.dart
after: // provider-imports-start
before: // provider-imports-end
skip_if: import 'providers/<%= h.changeCase.snake(name) %>.dart';
---
import 'providers/<%= h.changeCase.snake(name) %>.dart';