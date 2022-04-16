---
to: lib/cubits/<%= h.changeCase.snake(name) %>/state.dart
---
<% pascal = h.changeCase.pascal(name) %>
<% rootClass = h.changeCase.pascal(name)+"State" %>
part of 'cubit.dart';
<%= props = "" %>
<%= constructor = "" %>
<%= equatable = "" %>
<%= copyWithArgs = "" %>
<%= copyWithBody = "" %>
<%= defaultConstuctor = "" %>

<% args.forEach(function(arg){ %>

<% module = h.changeCase.pascal(arg.module) %>
<% model = h.changeCase.pascal(arg.model) %>
<% state = h.changeCase.camel(arg.state) %>
<% moduleClass = pascal+module %>
<% baseClass = moduleClass+"State" %>
<% props += "\tfinal "+baseClass+" "+state+";\n" %>
<% constructor += "\t\tthis."+state+",\n" %>
<% equatable += "\t\t\t\t"+state+",\n" %>
<% copyWithArgs += "\t\t"+baseClass+" "+state+",\n" %>
<% copyWithBody += "\t\t\t\t"+state+": "+state+" ?? this."+state+",\n" %>
<% defaultConstuctor += "\t\t\t\t\t"+state+": const "+baseClass+"(),\n" %>

@immutable
class <%= baseClass %> extends Equatable {
  static bool match(<%+ rootClass %> a, <%+ rootClass %> b) => a.<%= state %> != b.<%= state %>;

  final <%= model %> data;
  final String message;

  const <%= baseClass %>({
    this.data,
    this.message,
  });

  @override
  List<Object> get props => [data, message,];
}

@immutable
class <%= moduleClass %>Default extends <%= baseClass %> {}

@immutable
class <%= moduleClass %>Loading extends <%= baseClass %> {
    const <%= moduleClass %>Loading(): super();
}

@immutable
class <%= moduleClass %>Success extends <%= baseClass %> {
    const <%= moduleClass %>Success({<%= model %> data}): super(data: data);
}

@immutable
class <%= moduleClass %>Failed extends <%= baseClass %> {
    const <%= moduleClass %>Failed({String message}): super(message: message);
}
<% }); %>

// root-state
@immutable
class <%= rootClass %> extends Equatable {
<%= props %>

  const <%= rootClass %>({
<%= constructor %>
  });

  @override
  List<Object> get props => [
<%= equatable %>
  ];

  <%= rootClass %> copyWith({
<%= copyWithArgs %>
  }) {
    return <%= rootClass %>(
<%= copyWithBody %>
    );
  }
}

@immutable
class <%= rootClass %>Default extends <%= rootClass %> {
 const <%= rootClass %>Default()
      : super(
 <%= defaultConstuctor %>
        );
}