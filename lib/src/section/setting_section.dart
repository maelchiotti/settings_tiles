import 'package:flutter/material.dart';
import 'package:settings_tiles/src/tiles/setting_tile.dart';

/// A section of the settings.
class SettingSection extends StatelessWidget {
  /// A setting section groups a list of settings [tiles] with a [title].
  ///
  /// By default, a simple divider is shown between the tiles.
  /// To disable it completely, set the [divider] parameter to `null`.
  const SettingSection({
    required this.tiles,
    super.key,
    this.title,
    this.divider,
  });

  /// The title of the setting section.
  final String? title;

  /// The list of setting tiles.
  final List<SettingTile> tiles;

  /// An optional divider shown between the setting tiles.
  final Divider? divider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Text(
                title!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
          for (final (index, tile) in tiles.indexed) ...[
            if (index != 0 && divider != null) divider!,
            tile,
          ],
        ],
      ),
    );
  }
}
