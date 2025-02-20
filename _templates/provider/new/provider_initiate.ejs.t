---
inject: true
to: lib/app.dart
after: // provider-initiate-start
before: // provider-initiate-end
skip_if: "ChangeNotifierProvider[(]create: [(]_[)] => <%= h.changeCase.pascal(name) %>State[())]"
---
ChangeNotifierProvider(create: (_) => <%= h.changeCase.pascal(name) %>State()),