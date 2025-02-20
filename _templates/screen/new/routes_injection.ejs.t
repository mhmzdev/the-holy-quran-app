---
inject: true
to: lib/router/routes.dart
after: class AppRoutes {
skip_if: static const <%= h.changeCase.camel(name) %> = '/<%= h.changeCase.camel(name) %>';
---
static const <%= h.changeCase.camel(name) %> = '/<%= h.changeCase.camel(name) %>';