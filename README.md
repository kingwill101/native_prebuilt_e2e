# native_prebuilt_e2e

End-to-end validation repo for `native_prebuilt`.

This repo shows the full stack:

- `hooks` build hook
- `native_prebuilt` manifest + resolver
- native source fallback via `native_toolchain_c`
- release metadata YAML for prebuilt publication
- workflow scaffolding for the release pipeline

## Layout

```text
hook/build.dart
native_prebuilt.yaml
lib/src/hook/demo_prebuilts.g.dart
src/native/demo.c
.github/workflows/release.yml
```

## Local development

```bash
dart pub get
dart run native_prebuilt workflow init
```

## Manifest generation

```bash
dart run native_prebuilt manifest update \
  --config native_prebuilt.yaml \
  --output lib/src/hook/demo_prebuilts.g.dart
```

## Release flow

1. Build/publish prebuilt tarballs for each platform
2. Run `native_prebuilt manifest update`
3. Commit the generated manifest
4. Publish/tag the release

The hook falls back to native compilation when prebuilt downloads are not available.
