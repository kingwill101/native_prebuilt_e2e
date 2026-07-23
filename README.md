# native_prebuilt_e2e

End-to-end validation repo for `native_prebuilt`.

This repo uses `native_prebuilt` from the GitHub mirror (`v0.0.9`) for validation.

This repo shows the full stack:

- `hooks` build hook
- `native_prebuilt` manifest + resolver
- native source fallback via `native_toolchain_c`
- `ffigen` bindings that call the built native asset
- release metadata YAML for prebuilt publication (GitHub release source)
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
.github/workflows/prebuilt.yml
.gitlab-ci.yml
.gitlab/ci/native-prebuilt-build-*.yml
.gitlab/ci/native-prebuilt-release.yml
.gitlab/ci/native-prebuilt-update-manifest.yml
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

The workflows are scaffolds for the package's native-toolchain-driven build and manifest update flow.

The hook falls back to native compilation when prebuilt downloads are not available.
The GitHub Actions workflow mirrors the GitLab CI scaffold so the repo can be exercised on either platform family.
