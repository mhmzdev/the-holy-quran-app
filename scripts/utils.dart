import 'dart:io';

String normalize(String path) {
  if (Platform.isWindows) {
    return path.replaceAll("/", "\\");
  }
  return path;
}
