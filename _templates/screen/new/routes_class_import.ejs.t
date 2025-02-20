---
inject: true
to: lib/router/router.dart
skip_if: import 'routes.dart';
before: final appRouterKey
---
import 'routes.dart';