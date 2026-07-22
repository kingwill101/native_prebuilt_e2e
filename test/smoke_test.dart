import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('repo scaffold exists', () {
    expect(File('hook/build.dart').existsSync(), isTrue);
    expect(File('native_prebuilt.yaml').existsSync(), isTrue);
    expect(File('src/native/demo.c').existsSync(), isTrue);
  });
}
