---
name: new-tile
description: Add a new setting tile, or a new option to an existing one, to the settings_tiles package (tile, dialog, export, README, example, CHANGELOG).
---

# New tile or option

Read the closest existing tile first and copy its shape: `setting_switch` for an inline control, `setting_text_field` or `setting_single_option` for a tile that opens a dialog.

1. **Tile**: `lib/src/tiles/setting_<name>/setting_<name>_tile.dart`, a class `Setting<Name>Tile extends SettingTile` that forwards `visible`, `enabled`, `icon`, `title`, `value` and `description` to `super`, and builds with `tile(context, onTap: ...)`. Pass no `onTap` when the tile is disabled.
2. **Dialog**, if the tile opens one: `setting_<name>_dialog.dart` in the same folder, with `CancelButton` and `OkButton`, returning the value with `Navigator.pop(context, value)`. The tile opens it with `showAdaptiveDialog<T>(useRootNavigator: false, ...)` and calls its callback only when the result is not `null`.
3. **Export** the tile (not the dialog) from `lib/settings_tiles.dart`, in alphabetical order.
4. **Docs**: a `///` comment on the class, the constructor and every field.
5. **README.md**: a `#### <Name>` section under `### Tiles` with a short example, like the others.
6. **Example**: add the tile to the section with all the tiles in `example/lib/main.dart`.
7. **CHANGELOG.md**: the change under `### Added` of the next version (the `release` skill bumps it).
8. Run the `check` skill.

A new optional parameter with a default that keeps the current behavior is a minor change. Changing a default, a type or a required parameter is breaking.
