---
to: lib/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart
---
import 'package:flutter/material.dart';
<% if (state) { %>
import 'package:provider/provider.dart';
<% } %>

<% if (state) { %>
import 'provider.dart';

class <%=h.changeCase.pascal(name)%>Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return ChangeNotifierProvider< <%=Name%>StateProvider>(
      create: (_) => <%=Name%>StateProvider(),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
<% } else { %>
class <%=h.changeCase.pascal(name)%>Screen extends StatelessWidget {
<% } %>
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Text(App.tr(<%=Name%>Messages.title,context)),
          ],
        ),
      ),
    );
  }
}
