import 'dart:developer';
import 'dart:io';

import 'package:recase/recase.dart';

import 'utils.dart';

const codeFilePath = './lib/static/assets.dart';

Future<void> main(List<String> args) async {
  final start = DateTime.now();

  final assetsDir = Directory(normalize('./assets/'));
  final assetsDirPaths = assetsDir.listSync();

  final keys = [];

  for (var file in assetsDirPaths) {
    if (file.path.contains('.DS_Store')) {
      continue;
    }
    final dir = Directory(file.path);
    final chunks = file.path.split(normalize('/'));
    final scope = chunks.last;
    keys.add('\n\t// $scope paths');
    dir.listSync().forEach((element) {
      if (!element.path.contains(RegExp('(?:jpg|svg|gif|png|json)'))) {
        return;
      }
      final filePath = element.path.replaceFirst(".${normalize("/")}", '');
      final fileName = filePath.split(normalize('/')).last.split('.').first;
      final varName = "$scope ${fileName.replaceAll(RegExp(r'[^\w\s]+'), " ")}";
      final key =
          "\tstatic const ${varName.camelCase} = '${filePath.replaceAll(normalize('/'), '/')}';";
      keys.add(key);
    });
  }

  final classData = generateStaticClass(keys.join('\n'));
  final classFile = File(codeFilePath);
  await classFile.writeAsString(classData);

  final end = DateTime.now();
  log('${end.difference(start).inMilliseconds}ms');
}

String generateStaticClass(String keys) {
  return '''
// This is an auto generated file. Do not make any change on this.

final class StaticAssets {
$keys
}
''';
}
