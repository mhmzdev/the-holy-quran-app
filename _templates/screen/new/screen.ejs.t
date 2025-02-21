---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart
---
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:al_quran/configs/app.dart';
import 'package:al_quran/ui/widgets/core/screen/screen.dart';

part 'widgets/_body.dart';
<% if (widgets.length) { widgets.forEach(function(key){ %>part 'widgets/_<%=h.changeCase.snake(key)%>.dart';<% }); } %>

part '_state.dart';

class <%=h.changeCase.pascal(name)%>Screen extends StatelessWidget {
  const <%=h.changeCase.pascal(name)%>Screen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
