import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:settings_tiles/src/tiles/setting_color/color_preview.dart';
import 'package:settings_tiles/src/tiles/setting_tile.dart';
import 'package:settings_tiles/src/widgets/empty.dart';

/// A setting tile with color pickers.
class SettingColorTile extends SettingTile {
  /// A setting tile with configurable color pickers and a current color preview.
  ///
  /// By default, the two color pickers available are [ColorPickerType.primary] that shows primary colors,
  /// and [ColorPickerType.accent] that shows accent colors.
  /// To enable all the color pickers, pass [ColorPickerType.values] to the [colorPickers] parameter.
  const SettingColorTile({
    super.key,
    super.visible,
    super.enabled,
    super.icon,
    super.title,
    super.value,
    super.description,
    super.trailing,
    required this.dialogTitle,
    this.colorPickers = const [ColorPickerType.primary, ColorPickerType.accent],
    this.enableOpacity = true,
    this.initialColor = Colors.white,
    this.overrideColorPicker,
    required this.onSubmitted,
    this.onCanceled,
  });

  /// The title of the dialog.
  final String dialogTitle;

  /// The list of color pickers available.
  final List<ColorPickerType> colorPickers;

  /// Whether to enable the slider to change the opacity of the picked color.
  ///
  /// If set to `false`, the color picked will always have 100% opacity (meaning no transparency).
  final bool enableOpacity;

  /// The initial color that should be selected in the color pickers and should be previewed at the end of the tile.
  final Color initialColor;

  /// A custom [ColorPicker] widget to override the default one.
  ///
  /// Is set, it will completely replace the default color picker created by this package.
  /// To use it, you need to import the <https://pub.dev/packages/flex_color_picker> package.
  final ColorPicker? overrideColorPicker;

  /// Called when the color is picked.
  final Function(Color) onSubmitted;

  /// Called when the dialog is canceled.
  final Function()? onCanceled;

  Future<void> _openDialog(BuildContext context) async {
    final colorPickersMap = {
      for (final colorPickerType in ColorPickerType.values) colorPickerType: colorPickers.contains(colorPickerType),
    };

    final colorPicker = overrideColorPicker ??
        ColorPicker(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              dialogTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          pickersEnabled: colorPickersMap,
          enableOpacity: enableOpacity,
          color: initialColor,
          onColorChanged: onSubmitted,
        );

    await colorPicker.showPickerDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const Empty();
    }

    return InkWell(
      onTap: enabled ? () => _openDialog(context) : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            leading(context),
            leadingBodyPadding,
            body(context),
            bodyTrailingPadding,
            ColorPreview(color: initialColor),
          ],
        ),
      ),
    );
  }
}
