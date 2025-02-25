import 'package:flutter/material.dart';
import '../setting_tile.dart';
import '../../widgets/empty.dart';

/// A setting tile that performs an action when tapped.
class SettingActionTile extends SettingTile {
  /// A setting tile that calls [onTap] when tapped to allow performing any action.
  const SettingActionTile({
    super.key,
    super.visible,
    super.enabled,
    super.icon,
    super.title,
    super.value,
    super.description,
    super.trailing,
    required this.onTap,
  });

  /// Called when the tile is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const Empty();
    }

    return InkWell(
      onTap: enabled ? onTap : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            leading(context),
            leadingBodyPadding,
            body(context),
            if (trailing != null) ...[
              bodyTrailingPadding,
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
