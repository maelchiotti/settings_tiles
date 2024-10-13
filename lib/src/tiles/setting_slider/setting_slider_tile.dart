import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:settings_tiles/src/tiles/setting_slider/setting_slider_dialog.dart';
import 'package:settings_tiles/src/tiles/setting_tile.dart';
import 'package:settings_tiles/src/widgets/empty.dart';

/// A setting tile with a slider.
class SettingSliderTile extends SettingTile {
  /// A setting tile with a slider to choose a value between a [min] value, a [max] value with a number of [divisions].
  const SettingSliderTile({
    super.key,
    super.visible,
    super.enabled,
    super.icon,
    super.title,
    super.value,
    super.description,
    super.trailing,
    required this.dialogTitle,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    required this.initialValue,
    this.overrideSlider,
    required this.onSubmitted,
    this.onCanceled,
  });

  /// The title of the dialog.
  final String dialogTitle;

  /// The minimum value that can be selected in the slider.
  final double min;

  /// The maximum value that can be selected in the slider.
  final double max;

  /// The number of divisions of the slider between the [min] and the [max].
  final int? divisions;

  /// The initial value that the slider is set to.
  final double initialValue;

  /// A custom [Slider] widget to override the default one.
  ///
  /// Is set, it will completely replace the default slider created by this package.
  final Slider? overrideSlider;

  /// Called when the slider value is chosen.
  final Function(double) onSubmitted;

  /// Called when the dialog is canceled.
  final Function()? onCanceled;

  Future<void> _openDialog(BuildContext context) async {
    final result = await showAdaptiveDialog<double>(
      context: context,
      builder: (context) {
        return SettingSliderDialog(
          title: dialogTitle,
          min: min,
          max: max,
          divisions: divisions,
          defaultValue: initialValue,
          overrideSlider: overrideSlider,
        );
      },
    );

    if (result == null) {
      if (onCanceled == null) {
        return;
      } else {
        onCanceled!();
      }
    } else {
      return onSubmitted(result);
    }
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
            const Gap(8.0),
            body(context),
            const Gap(8.0),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
