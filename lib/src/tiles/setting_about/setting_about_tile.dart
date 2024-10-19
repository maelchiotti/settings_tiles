import 'package:flutter/material.dart';
import 'package:settings_tiles/src/tiles/setting_tile.dart';

/// A setting tile that shows information about the application.
class SettingAboutTile extends SettingTile {
  /// A setting tile that shows the icon, the name and the version of the application,
  /// and opens the default Flutter's [AboutDialog] when tapped.
  ///
  /// The name of the application should be passed to the [title] parameter.
  ///
  /// The version of the application should be passed to the [description] parameter.
  const SettingAboutTile({
    super.key,
    super.icon = Icons.info,
    required super.title,
    required super.description,
    required this.applicationIcon,
    this.applicationLegalese,
    this.dialogChildren,
  });

  /// The icon of the application.
  final Widget applicationIcon;

  /// The application's legalese used in the Flutter's [AboutDialog].
  final String? applicationLegalese;

  /// A list of widgets to display in the Flutter's [AboutDialog]
  final List<Widget>? dialogChildren;

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationIcon: applicationIcon,
      applicationName: title,
      applicationVersion: description,
      applicationLegalese: applicationLegalese,
      children: dialogChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showAboutDialog(context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            leading(context),
            leadingBodyPadding,
            body(context),
          ],
        ),
      ),
    );
  }
}
