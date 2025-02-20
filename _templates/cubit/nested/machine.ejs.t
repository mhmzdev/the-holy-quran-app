---
to: lib/blocs/<%= h.changeCase.snake(name) %>/machine.dart
---
<% pascal = h.changeCase.pascal(name) %>
part of 'cubit.dart';



mixin _<%= pascal %>Machine on Cubit< <%= pascal %>State> {

<% args.forEach(function(arg){ %>

<% module = h.changeCase.pascal(arg.module) %>
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

  /// Implement this method in the cubit to reset the state
  /// and if there is any releated data to it.
  void _reset() => UnimplementedError('Method not implemented');

}
