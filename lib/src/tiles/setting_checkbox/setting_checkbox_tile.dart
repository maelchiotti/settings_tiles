import 'package:flutter/material.dart';
import 'package:settings_tiles/src/tiles/setting_tile.dart';
import 'package:settings_tiles/src/widgets/empty.dart';

/// A setting tile with a checkbox.
class SettingCheckboxTile extends SettingTile {
  /// A setting tile with a checkbox that can be checked and unchecked.
  const SettingCheckboxTile({
    required this.checked,
    required this.onChanged,
    super.key,
    super.visible,
    super.enabled,
    super.icon,
    super.title,
    super.value,
    super.description,
  });

  /// Whether the checkbox is checked.
  final bool checked;

  /// Called when the status of the checkbox is changed.
  ///
  /// If `null`, the tile will be disabled.
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool? checked)? onChanged;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const Empty();
    }

    return InkWell(
      onTap: enabled && onChanged != null ? () => onChanged!(!checked) : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            leading(context),
            leadingBodyPadding,
            body(context),
            bodyTrailingPadding,
            Checkbox(
              value: checked,
              onChanged: enabled ? onChanged : null,
            ),
          ],
        ),
      ),
    );
  }
}
