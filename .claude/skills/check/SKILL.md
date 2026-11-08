---
name: check
description: Run every check of the settings_tiles package (format, analyze, tests, example, publish dry run) and fix what fails. Use before saying a change is done.
---

# Checks

Run each step and fix every failure before moving on. Report the result of each step.

1. Format: `dart format` on the changed files, then `dart format --set-exit-if-changed lib example/lib`.
2. Analyze: `dart analyze --fatal-infos` at the root (it covers `example` too).
3. Tests: `flutter test` when a `test` directory exists.
4. Example: `cd example && flutter pub get`; it must use the new API without error.
5. `dart pub publish --dry-run` when `pubspec.yaml`, the README or the public API changed.

Then re-read the diff against `CLAUDE.md`: every public member has a `///` doc comment, the README and the example show the changed API, and the CHANGELOG lists the change.

Never add `// ignore:` unless the existing code already does it in the same situation.
