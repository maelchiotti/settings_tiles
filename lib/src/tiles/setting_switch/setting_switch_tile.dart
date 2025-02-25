import 'package:flutter/material.dart';
import '../setting_tile.dart';
import '../../widgets/empty.dart';

/// A setting tile with a switch.
class SettingSwitchTile extends SettingTile {
  /// A setting tile with a checkbox that can be toggled and untoggled.
  const SettingSwitchTile({
    super.key,
    super.visible,
    super.enabled,
    super.icon,
    super.title,
    super.value,
    super.description,
    required this.toggled,
    required this.onChanged,
  });

  /// Whether the switch it toggled.
  final bool toggled;

  /// Called when the status of the switch is changed.
  ///
  /// If `null`, the tile will be disabled.
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const Empty();
    }

    return InkWell(
      onTap: enabled && onChanged != null ? () => onChanged!(!toggled) : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
