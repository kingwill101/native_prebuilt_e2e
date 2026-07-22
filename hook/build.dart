import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:native_prebuilt/hooks.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

import '../lib/src/hook/demo_prebuilts.g.dart';

void main(List<String> args) async {
  await build(args, (input, output) async {
    if (!input.config.buildCodeAssets) {
      return;
    }

    await PrebuiltCodeAssetBuilder(
      assetName: 'native_prebuilt_e2e_bindings_generated.dart',
      libraryStem: 'native_prebuilt_e2e',
      manifest: native_prebuilt_e2ePrebuilts,
      linkModeResolver: (_) => DynamicLoadingBundled(),
      fallback: CBuilder.library(
        name: 'native_prebuilt_e2e',
        packageName: input.packageName,
        assetName: 'native_prebuilt_e2e_bindings_generated.dart',
        sources: const ['src/native/demo.c'],
      ),
    ).run(input: input, output: output, logger: null);
  });
}
