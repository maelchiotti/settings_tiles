import 'package:flutter/material.dart';
import 'package:settings_tiles/src/tiles/setting_tile.dart';
import 'package:settings_tiles/src/widgets/empty.dart';

/// A setting tile with a switch.
class SettingSwitchTile extends SettingTile {
  /// A setting tile with a checkbox that can be toggled and untoggled.
  const SettingSwitchTile({
    required this.toggled,
    required this.onChanged,
    super.key,
    super.visible,
    super.enabled,
    super.icon,
    super.title,
    super.value,
    super.description,
  });

  /// Whether the switch it toggled.
  final bool toggled;

  /// Called when the status of the switch is changed.
  ///
  /// If `null`, the tile will be disabled.
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool toggled)? onChanged;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const Empty();
    }

    return InkWell(
      onTap: enabled && onChanged != null ? () => onChanged!(!toggled) : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            leading(context),
            leadingBodyPadding,
            body(context),
            bodyTrailingPadding,
            Switch(
              value: toggled,
              onChanged: enabled ? onChanged : null,
            ),
          ],
        ),
      ),
    );
  }
}
