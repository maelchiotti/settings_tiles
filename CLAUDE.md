# settings_tiles

Flutter package published on pub.dev: a collection of setting tiles (switch, checkbox, single and multiple options, slider, custom slider, text field, color, action, about) and sections to build a settings screen. BSD-3-Clause.

Apps build their settings pages with it: check that a change keeps working in an app, and treat any change of a public signature or of the default appearance as breaking.

## Commands

- Install: `flutter pub get` (and in `example`).
- Format: `dart format .` (default width, 80).
- Analyze: `dart analyze --fatal-infos`. Two infos remain on `main`: `groupValue` and `onChanged` of `Radio` in `setting_single_option_dialog.dart` are deprecated since Flutter 3.32 (replace them with a `RadioGroup` when asked).
- Example: `cd example && flutter run`.
- Publish: `dart pub publish --dry-run` only; the maintainer publishes (`make publish`).

There are no tests. The `check` skill runs every check, the `release` skill prepares a version, the `new-tile` skill adds a tile.

Running `flutter pub get` with a newer Flutter rewrites `example/pubspec.lock`: only commit it when the dependencies are meant to change.

## Structure

- `lib/settings_tiles.dart` exports the public API, with `package:settings_tiles/src/...` paths. Anything not exported there is private.
- `lib/src/section`: `SettingSection` (a list of tiles with optional dividers) and `SettingSectionTitle`.
- `lib/src/tiles/setting_tile.dart`: the abstract `SettingTile` (`visible`, `enabled`, `icon`, `title`, `value`, `description`, `trailing`). Its `tile(context, onTap:)` builds the `ListTile` every tile uses.
- `lib/src/tiles/setting_<name>/`: one folder per tile, `setting_<name>_tile.dart` and, when the tile opens one, `setting_<name>_dialog.dart`.
- `lib/src/tiles/widgets`: the pre-styled `SettingTileIcon` and `SettingTileValue`, and the dialog buttons `OkButton` and `CancelButton` (labels from `MaterialLocalizations`, so the package has no translation of its own).
- `lib/src/types`: records used by the tiles (`MultipleOptionsDetails`).

## Code style

- `flutter_lints` with `strict-inference`, `public_member_api_docs`, `always_use_package_imports`, `always_put_control_body_on_new_line`, `curly_braces_in_flow_control_structures` and `unawaited_futures`.
- Package imports (`package:settings_tiles/...`), not relative ones.
- Every public member has a `///` doc comment. Constructor parameters: required ones first, then `super.key` and the inherited ones.
- Control bodies on their own line.
- The tiles take `Widget`s for `icon`, `title`, `value` and `description`, never `String`s, so that the app styles them.
- A tile is disabled by `enabled: false` or a `null` callback: handle both.

## Git

Every issue and pull request has a label for its kind: `bug`, `enhancement` or `documentation`. A pull request gets the label of its issue.

Commits on `main`, and a `vX.Y.Z` commit for each version. Keep `CHANGELOG.md` in the Keep a Changelog format, with a `### BREAKING CHANGES` section for a major version.
