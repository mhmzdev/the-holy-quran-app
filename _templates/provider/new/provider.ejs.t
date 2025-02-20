---
to: lib/providers/<%= h.changeCase.snake(name) %>.dart
---
<% pascal = h.changeCase.pascal(name)+"Provider" %>
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class <%= pascal %> extends ChangeNotifier {
    static <%= pascal %> s(BuildContext context, [bool listen = false]) =>
        Provider.of<<%= pascal %>>(context, listen: listen);
} 