---
to: "<%= formData ? `lib/ui/screens/${h.changeCase.snake(name)}/static/_form_data.dart` : null %>"
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
<% if (formKeys.length) { %>

<% formKeys.forEach(function(key){ %>
      _FormKeys.<%= h.changeCase.camelCase(key) %>: '<%= h.changeCase.pascal(key) %>',
<% }); %>

<% } else { %>
      'key': 'value',
<% } %>
    };
  }
}
