import 'package:flutter/material.dart';
import 'package:settings_tiles/src/extensions/color_extension.dart';
import 'package:settings_tiles/src/extensions/text_style_extension.dart';

/// A setting tile.
abstract class SettingTile extends StatelessWidget {
  /// A setting tile displays information about a setting and handles the necessary interactions to modify it.
  ///
  /// It can be hidden by setting [visible] to `false`, and disabled by setting [enabled] to `false`.
  const SettingTile({
    super.key,
    this.visible = true,
    this.enabled = true,
    this.icon,
    this.value,
    this.title,
    this.description,
    this.trailing,
  });

  /// Whether the tile is visible.
  final bool visible;

  /// Whether the tile is enabled.
  final bool enabled;

  /// The icon of the tile.
  final IconData? icon;

  /// The title of the tile.
  final String? title;

  /// The current value of the setting.
  ///
  /// If set, it is displayed between the title and the description.
  final String? value;

  /// The description of the title.
  final String? description;

  /// An optional widget to show at the end of the tile.
  final Widget? trailing;

  /// Returns the leading widget of the tile.
  ///
  /// Contains the [icon].
  Widget leading(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 48,
      child: Icon(
        icon,
        size: 32,
        color: enabled ? null : theme.iconTheme.color?.subdued,
      ),
    );
  }

  /// Returns the body of the tile.
  ///
  /// Contains the [title], the [value] and the [description].
  Widget body(BuildContext context) {
    final theme = Theme.of(context);

    final titleLarge = theme.textTheme.titleLarge;
    final titleSmall = theme.textTheme.titleSmall;
    final bodyMedium = theme.textTheme.bodyMedium;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: Text(
                title!,
                style: enabled ? titleLarge : titleLarge?.subdued,
              ),
            ),
          if (value != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Text(
                value!,
                style: enabled ? titleSmall : titleSmall?.subdued,
              ),
            ),
          if (description != null)
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Text(
                description!,
                style: enabled ? bodyMedium : bodyMedium?.subdued,
              ),
            ),
        ],
      ),
    );
  }
}
