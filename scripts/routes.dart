import 'dart:io';
import 'package:recase/recase.dart';

import 'utils.dart';

const codeFilePath = "./lib/app_routes.dart";
const navigatorFilePaht = "./lib/main.dart";
const importMatch = "// screen imports";
const routeMatch = "routes: {";

void main(List<String> args) async {
  final assetsDir = Directory(normalize("./lib/screens/"));
  final assetsDirPaths = assetsDir.listSync();

  final keys = [];
  final importStrings = <String>[];
  final routeStrings = <String>[];
  final classFile = File(codeFilePath);
  final classFileData = File(codeFilePath).readAsLinesSync();
  final toIgnore = classFileData.first
      .split(":")
      .last
      .trim()
      .split(",")
      .map((e) => e.toLowerCase())
      .toList();

  for (var file in assetsDirPaths) {
    if (file.path.contains('.DS_Store')) {
      continue;
    }
    final chunks = file.path.split(normalize("/"));
    final scope = chunks.last;
    final camel = scope.camelCase;
    final snake = scope.snakeCase;
    final pascal = scope.pascalCase;
    keys.add("\tstatic const $camel = '$camel';");
    importStrings.add("import 'screens/$snake/$snake.dart';");
    if (toIgnore.contains(camel.toLowerCase())) {
      continue;
    }

    final renderString = "AppRoutes.$camel: (_) => ${pascal}Screen(),";
    routeStrings.add(renderString);
  }

  final classData = generateStaticClass(keys.join("\n"), classFileData[0]);
  await classFile.writeAsString(classData);

  final navigator = File(navigatorFilePaht);
  final newAppNavigator = [];
  final navLines = navigator.readAsLinesSync().map((e) => e.trim()).toList();
  bool flag4Screens = false;
  for (final line in navLines) {
    if (flag4Screens) {
      if (line == '},') {
        flag4Screens = false;
        return;
      }
      final parsed = line.split(":").first.split('.').last.toLowerCase();

      if (toIgnore.contains(parsed)) {
        continue;
      }
    }
    newAppNavigator.add(line);
    if (line.contains(importMatch)) {
      for (var element in importStrings) {
        if (navLines.contains(element)) {
          continue;
        } else {
          newAppNavigator.add(element);
        }
      }
    }
    if (line.contains(routeMatch)) {
      flag4Screens = true;
      for (var element in routeStrings) {
        if (navLines.contains(element)) {
          continue;
        } else {
          newAppNavigator.add(element);
        }
      }
    }
  }

  navigator.writeAsStringSync(newAppNavigator.join("\n"));

  Process.runSync("dart", ["format", "lib"]);
}

String generateStaticClass(String keys, ignore) {
  return '''
$ignore
// This is an auto generated file. Do not make any change on this.

$keys
}
''';
}
