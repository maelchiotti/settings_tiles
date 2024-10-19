import 'package:flutter/material.dart';
import 'package:settings_tiles/src/tiles/setting_tile.dart';
import 'package:settings_tiles/src/widgets/empty.dart';

/// A setting tile that displays text.
class SettingTextTile extends SettingTile {
  /// A setting tile that only displays text with no interactions.
  const SettingTextTile({
    super.key,
    super.visible,
    super.icon,
    super.title,
    super.value,
    super.description,
    super.trailing,
  });

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const Empty();
    }

    return Padding(
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
    );
  }
}
