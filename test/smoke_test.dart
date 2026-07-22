import 'package:native_prebuilt_e2e/native_prebuilt_e2e.dart';
import 'package:test/test.dart';

void main() {
  test('native asset returns the expected answer', () {
    expect(NativePrebuiltE2e.open().answer(), 42);
  });
}
