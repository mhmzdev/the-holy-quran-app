---
to: lib/cubits/<%= h.changeCase.snake(name) %>/repository.dart
---
part of 'cubit.dart';

class <%= h.changeCase.pascal(name) %>Repository {
  Future< <%= h.changeCase.pascal(model) %>> fetch() => <%= h.changeCase.pascal(name) %>DataProvider.fetch();
}
