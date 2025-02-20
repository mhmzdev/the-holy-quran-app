---
to: lib/blocs/<%= h.changeCase.snake(name) %>/state.dart
---
<% pascal = h.changeCase.pascal(name) %>
<% rootClass = h.changeCase.pascal(name)+"State" %>
part of 'cubit.dart';
<%= props = "" %>
<%= constructor = "" %>
<%= defConstructor = "" %>
<%= equatable = "" %>
<%= copyWithArgs = "" %>
<%= copyWithBody = "" %>
<%= defaultConstuctor = "" %>

<% args.forEach(function(arg, index){ %>

<% module = h.changeCase.pascal(arg.module) %>
<% cModule = h.changeCase.camel(arg.module) %>
<% model = h.changeCase.pascal(arg.model) %>
<% props += "\tfinal CubitState \<"+model+"\> "+cModule+";\n" %>
<% constructor += "required this."+cModule+",\n" %>
<% defConstructor += cModule+" = CubitState(),\n" %>
<% equatable += cModule+",\n" %>
<% copyWithArgs += "CubitState<"+model+">? "+cModule+",\n" %>
<% copyWithBody += "\t\t\t\t"+cModule+": "+cModule+" ?? this."+cModule+",\n" %>

<% }); %>

// root-state
@immutable
class <%= rootClass %> extends Equatable {
<%- props %>

  const <%= rootClass %>({
<%= constructor %>
  });

  <%= rootClass %>.def()
    : // root-def-constructor
    <%= defConstructor.slice(0,-2) %>;

  <%= rootClass %> copyWith({
<%- copyWithArgs %>
  }) {
    return <%= rootClass %>(
<%= copyWithBody %>
    );
  }
  @override
  List<Object> get props => [
    // root-state-props
<%= equatable %>
  ];
}
