# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 7.0.1 - 2026-11-16

### Changed

- The package now requires Flutter 3.35 and Dart 3.9 or higher.

### Fixed

- The `SettingSingleOptionTile` dialog uses a `RadioGroup` instead of the `groupValue` and `onChanged` parameters of the radio buttons, deprecated since Flutter 3.32.

## 7.0.0 - 2026-11-15

### BREAKING CHANGES

- The `onSubmitted` callback of the `SettingColorTile` is now called when the dialog is validated with the OK button, instead of each time a color is clicked (use the new `onSelectionChanged` callback for that).

### Added

- Added the `onSelectionChanged` parameter to the `SettingColorTile`, called each time a color is selected in the dialog.

### Fixed

- The `SettingCustomSliderTile` dialog no longer crashes when the `initialValue` is not in the `values`, it selects the closest value instead.
- The `onChanged` callback of the `SettingCustomSliderTile` receives the value instead of the index of the slider.
- The `SettingColorTile` calls `onCanceled` when the dialog is canceled.
- The controller of the `SettingTextFieldTile` dialog is disposed.
- The `SettingCustomSliderTile` dialog no longer crashes when `values` has a single value, and asserts that it has at least two.

## 6.0.1 - 2025-06-12

### Added

- Export the base `SettingsTile` class.

## 6.0.0 - 2025-05-08

### BREAKING CHANGES

- Reworked the tiles to be based on a `ListTile`, changing their appearance (use the `SettingSectionTitle`, `SettingTileIcon` and `SettingTileValue` widgets to have pre-styled widgets).
- Changed the `icon`, `title`, `value` and `description` parameters to take a `Widget`.

### Added

- Added the `applicationName` and `applicationVersion` parameters to the `SettingAboutTile`.

### Removed

- Removed the padding above a `SettingSection`.

## 5.0.0 - 2025-04-28

### BREAKING CHANGES

- The `divider` parameter of the `SettingSection` is `null` by default.
- Removed the `TextStyle` and `Color` extensions from the package exports.

## 4.1.0 - 2025-02-25

### Added

- Add `SettingCustomSliderTile` that displays a slider with a set of custom values.

## 4.0.0 - 2025-01-11

### BREAKING CHANGES

- Update `SettingSingleOptionTile.detailed` so that the `options` parameter is a list of `MultipleOptionsDetails` record.

## 3.0.0 - 2025-01-11

### BREAKING CHANGES

- Update `SettingMultipleOptionsTile.detailed` so that the `options` parameter is a list of `MultipleOptionsDetails` record.

### Added

- Minimum number of selected options for `SettingMultipleOptionsTile`.

## 2.0.4 - 2024-12-15

### Changed

- Update example.

## 2.0.3 - 2024-10-19

### Changed

- Do not use the root navigator to show the dialogs.

## 2.0.2 - 2024-10-19

### Changed

- Reduce section padding.

## 2.0.1 - 2024-10-19

### Changed

- Reduce section padding.

## 2.0.0 - 2024-10-19

### BREAKING CHANGES

- Remove override widgets for `SettingSliderTile`, `SettingTextFieldTile` and `SettingColorTile`.

### Added

- Allow to provide a title and a description to the options of `SettingSingleOptionTile` and `SettingMultipleOptionsTile`.
- Allow to customize the label of the slider label of `SettingSliderTile`.
- On changed callback for `SettingSliderTile`.
- Use adaptive dialogs when applicable.

### Changed

- Reduce the title size.
- Improve the icon spacing.

## 1.0.0 - 2024-10-13

Initial release.
