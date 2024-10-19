import 'package:flutter/material.dart';
import 'package:settings_tiles/src/tiles/setting_tile.dart';

/// A section of the settings.
class SettingSection extends StatelessWidget {
  /// A setting section groups a list of settings [tiles], optionally separated by a [divider], with a [title] at the top.
  ///
  /// By default, a simple divider is shown between the tiles.
  /// To disable it completely, set the [divider] parameter to `null`.
  const SettingSection({
    super.key,
    this.title,
    required this.tiles,
    this.divider = const Divider(),
  });

  /// The title of the setting section, displayed at the top of the setting [tiles].
  final String? title;

  /// The list of setting tiles.
  final List<SettingTile> tiles;

  /// An optional divider shown between the setting tiles.
  final Divider? divider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
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
