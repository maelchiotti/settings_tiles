# settings_tiles

![Pub Version](https://img.shields.io/pub/v/settings_tiles)

A collection of settings tiles to easily create a settings screen.

## Installing

See the [installing instructions](https://pub.dev/packages/settings_tiles/install).

## Usage

### Section

Create a setting section that displays a list of setting tiles, optionally separated by a divider, with a title at the top:

```dart
SettingSection(
  title: 'A setting section',
  tiles: [
    // A list of tiles
  ],
)
```

To remove the dividers between the setting tiles, set the `divider` parameter to `null`.

### Tiles

#### Text

A simple tile that only displays text and has no interactions:

```dart
const SettingTextTile(
  icon: Icons.abc,
  title: 'Text',
  description: 'This is a text tile',
)
```

#### Action

A tile that calls an action when tapped:

```dart
SettingActionTile(
  icon: Icons.touch_app,
  title: 'Action',
  description: 'This is an action tile',
  onTap: () {
    print('The action tile was tapped');
  },
),
```

#### Switch

A tile that displays a switch:

```dart
SettingSwitchTile(
  icon: Icons.toggle_on,
  title: 'Switch',
  description: 'This is a switch tile',
  toggled: true,
  onChanged: (value) {
    // Handle state change
  },
)
```

#### Checkbox

A tile that displays a checkbox:

```dart
SettingCheckboxTile(
  icon: Icons.check_box,
  title: 'Checkbox',
  description: 'This is a checkbox tile',
  checked: true,
  onChanged: (value) {
    if (value == null) {
      return;
    }

    // Handle state change
  },
)
```

#### Single option

A tile that shows a dialog with a single option to choose:

```dart
SettingSingleOptionTile(
  icon: Icons.radio_button_on,
  title: 'Single option',
  description: 'This is a single option tile',
  dialogTitle: 'Options',
  options: const ['Option 1', 'Option 2', 'Option 3'],
  initialOption: 'Option 1',
  onSubmitted: (value) {
    // Handle state change
  },
)
```

#### Multiple options

A tile that shows a dialog with multiple options to choose from:

```dart
SettingMultipleOptionsTile(
  icon: Icons.checklist,
  title: 'Multiple options',
  description: 'This is a multiple options tile',
  dialogTitle: 'Options',
  options: const ['Option 1', 'Option 2', 'Option 3'],
  initialOptions: const ['Option 1', 'Option 3'],
  onSubmitted: (value) {
    // Handle state change
  },
)
```

The `.detailed` named constructor allows you to specify the title and an optional subtitle for each value.
The list of options must be a list of `MultipleOptionsDetails`, which is a record containing the value, the title and the optional subtitle of the option:

```dart
SettingMultipleOptionsTile.detailed(
  icon: Icons.checklist,
  title: 'Multiple options (detailed)',
  description: 'This is a detailed multiple options tile',
  dialogTitle: 'Options',
  options: const [
    (value: 'Option 1', title: 'Option n°1', subtitle: 'This is option n°1'),
    (value: 'Option 2', title: 'Option n°2', subtitle: 'This is option n°2'),
    (value: 'Option 3', title: 'Option n°3', subtitle: 'This is option n°3'),
  ],
  initialOptions: const ['Option 1', 'Option 3'],
  onSubmitted: (value) {
    // Handle state change
  },
),
``` 

#### Text field

A tile that shows a dialog with a text field:

```dart
SettingTextFieldTile(
  icon: Icons.text_fields,
  title: 'Text field',
  description: 'This is a text field tile',
  dialogTitle: 'Text',
  initialText: 'Some text',
  onSubmitted: (value) {
    // Handle state change
  },
)
```

#### Slider

A tile that shows a dialog with a slider:

```dart
SettingSliderTile(
  icon: Icons.linear_scale,
  title: 'Slider',
  description: 'This is a slider tile',
  dialogTitle: 'Slider',
  min: 1.0,
  max: 10.0,
  divisions: 9,
  initialValue: 5.0,
  onSubmitted: (value) {
    // Handle state change
  },
)
```

#### Color picker

A tile that shows a dialog with some color pickers and a preview of the picked color:

```dart
SettingColorTile(
  icon: Icons.color_lens,
  title: 'Color',
  description: 'This is a color tile',
  dialogTitle: 'Color',
  initialColor: Colors.blue,
  onSubmitted: (value) {
    // Handle state change
  },
)
```

To change the available color pickers, set the `colorPickers` parameter. To enable all the color pickers, set it to `ColorPickerType.values`.

#### About

A tile that shows information about the application and opens Flutter's `AboutDialog` when tapped:

```dart
const SettingAboutTile(
  applicationIcon: Image.asset('assets/icon/icon.png'),
  title: 'Application name',
  description: 'v1.0.0',
)
```

The name of the application needs to passed to the `title` parameter, and the version to the `description` parameter.

## Example

See the [example app](https://pub.dev/packages/settings_tiles/example).
