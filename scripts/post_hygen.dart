import 'dart:io';

main(List<String> args) async {
  if (args.length < 2) {
    return;
  }
  final index = args.indexOf("--screen");
  if (index < 0) {
    return;
  }

  final List<List<String>> scripts = [
    ["scripts/routes.dart"],
  ];
  for (final script in scripts) {
    Process.runSync(
      "dart",
      script,
      runInShell: Platform.isWindows,
    );
  }
}
