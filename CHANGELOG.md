# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project
adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 4.0.0

### BREAKING CHANGES

- Update `SettingSingleOptionTile.detailed` so that the `options` parameter is a list of `MultipleOptionsDetails` record

## 3.0.0

### BREAKING CHANGES

- Update `SettingMultipleOptionsTile.detailed` so that the `options` parameter is a list of `MultipleOptionsDetails` record

### Added

- Minimum number of selected options for `SettingMultipleOptionsTile`

## 2.0.4

- Update example

## 2.0.3

### Changed

- Do not use the root navigator to show the dialogs

## 2.0.2

### Changed

- Reduce section padding

## 2.0.1

### Changed

- Reduce section padding

## 2.0.0

### BREAKING CHANGES

- Remove override widgets for `SettingSliderTile`, `SettingTextFieldTile` and `SettingColorTile`

### Added

- Allow to provide a title and a description to the options of `SettingSingleOptionTile` and `SettingMultipleOptionsTile`
- Allow to customize the label of the slider label of `SettingSliderTile`
- On changed callback for `SettingSliderTile`
- Use adaptive dialogs when applicable

### Changed

- Reduce the title size
- Improve the icon spacing

## 1.0.0

Initial release.
