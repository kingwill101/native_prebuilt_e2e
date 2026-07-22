# native_prebuilt_e2e

End-to-end validation repo for `native_prebuilt`.

This repo uses `native_prebuilt: ^0.0.3` from pub.dev.

This repo shows the full stack:

- `hooks` build hook
- `native_prebuilt` manifest + resolver
- native source fallback via `native_toolchain_c`
- `ffigen` bindings that call the built native asset
- release metadata YAML for prebuilt publication (GitLab release source)
- workflow scaffolding for GitHub Actions and GitLab CI

## Layout

```text
bin/main.dart
ffigen.yaml
hook/build.dart
native_prebuilt.yaml
lib/src/ffi/native_prebuilt_e2e.dart
lib/src/hook/demo_prebuilts.g.dart
src/native/demo.c
src/native/demo.h
.github/workflows/release.yml
.gitlab-ci.yml
.gitlab/ci/*.yml
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

The release workflow is a scaffold for the package's normal native-toolchain-driven build and manifest update flow.

The hook falls back to native compilation when prebuilt downloads are not available.
The GitLab CI scaffold uses the official Dart Docker image and runs `dart test` so hooks are executed automatically. The build job uploads `.dart_tool/lib/`, which is where the native asset lands.
