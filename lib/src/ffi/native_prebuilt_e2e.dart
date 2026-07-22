import 'dart:ffi';
import 'dart:io';

import 'native_prebuilt_e2e_bindings.g.dart';

/// Loads the native asset built by `native_prebuilt` and exposes its FFI API.
final class NativePrebuiltE2e {
  NativePrebuiltE2e._(this._bindings);

  final NativePrebuiltE2eBindings _bindings;

  factory NativePrebuiltE2e.open({String? libraryPath}) {
    final path = libraryPath ?? _defaultLibraryPath();
    return NativePrebuiltE2e._(
      NativePrebuiltE2eBindings(DynamicLibrary.open(path)),
    );
  }

  int answer() => _bindings.native_prebuilt_e2e_answer();
}

String _defaultLibraryPath() {
  if (Platform.isLinux) {
    return '.dart_tool/lib/libnative_prebuilt_e2e.so';
  }
  if (Platform.isMacOS) {
    return '.dart_tool/lib/libnative_prebuilt_e2e.dylib';
  }
  if (Platform.isWindows) {
    return '.dart_tool/lib/native_prebuilt_e2e.dll';
  }
  throw UnsupportedError('Unsupported platform: ${Platform.operatingSystem}');
}
