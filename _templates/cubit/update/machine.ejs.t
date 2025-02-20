---
inject: true
after: mixin _<%= h.changeCase.pascal(name) %>Machine
to: lib/blocs/<%= h.changeCase.snake(name) %>/machine.dart
---
<% pascal = h.changeCase.pascal(name) %>
<% args.forEach(function(arg){ %>
<% pModule = h.changeCase.pascal(arg.module) %>
<% cModule = h.changeCase.camel(arg.module) %>
<% model = h.changeCase.pascal(arg.model) %>

void _<%= cModule %>Loading() {
  emit(
    state.copyWith(
      <%= cModule %>: state.<%= cModule %>.copyWith(
        action: CubitAction.loading,
      ),
    ),
  );
}

void _<%= cModule %>Success(<%= model %> data) {
  emit(
    state.copyWith(
      <%= cModule %>: state.<%= cModule %>.copyWith(
        action: CubitAction.success,
        data: data,
      ),
    ),
  );
}

void _<%= cModule %>Failed(Fault e) {
  emit(
    state.copyWith(
      <%= cModule %>: state.<%= cModule %>.copyWith(
        action: CubitAction.failed,
        fault: e,
      ),
    ),
  );
}

<% }); %>