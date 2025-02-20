---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/_listener.dart
---
part of '<%= h.changeCase.snake(name) %>.dart';
<% cubit = h.changeCase.pascal(arg.cubit) %>
<% module = h.changeCase.camel(arg.module) %>

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< <%= cubit %>Cubit, <%= cubit %>State>(
      listenWhen: (a, b) => a.<%= module %> != b.<%= module %>,
      listener: (_, state) {
        if (state.<%= module %>.isFailed) {
          UIFlash.error(context, state.<%= module %>.fault?.message ?? 'Failed to perform action');
        }
        if (state.<%= module %>.isSuccess) {
          UIFlash.success(context, 'Request completed successfully');
        }
      },
      builder: (context, state) {
        final loading = state.<%= module %>.isLoading;
        return FullScreenLoader(loading: loading);
      },
    );
  }
}
