---
inject: true
to: lib/router/router.dart
after: appRoutes
skip_if: AppRoutes.<%= h.changeCase.camel(name) %>
---
AppRoutes.<%= h.changeCase.camel(name) %>: (_) => const <%= h.changeCase.pascal(name) %>Screen(),