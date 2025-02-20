---
inject: true
after: <%= h.changeCase.pascal(name) %>State.def
to: lib/blocs/<%= h.changeCase.snake(name) %>/cubit.dart
---
<% pascal = h.changeCase.pascal(name) %>
<% args.forEach(function(arg){ %>
<% pModule = h.changeCase.pascal(arg.module) %>
<% cModule = h.changeCase.camel(arg.module) %>
<% model = h.changeCase.pascal(arg.model) %>

  Future<void> <%= cModule %>() async {
    _<%= cModule %>Loading();
    try {
      final data = await _<%= pascal %>Provider.<%= cModule %>();
      _<%= cModule %>Success(data);
    } on Fault catch (e) {
      _<%= cModule %>Failed(e);
    }
  }

<% }); %>