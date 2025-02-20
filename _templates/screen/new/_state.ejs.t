---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/_state.dart
---
part of '<%= h.changeCase.snake(name) %>.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  <% if (formData) { %>
  final formKey = GlobalKey<FormBuilderState>();
  <% } %>
}
