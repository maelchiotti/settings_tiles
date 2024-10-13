import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:settings_tiles/src/tiles/setting_multiple_options/setting_multiple_options_dialog.dart';
import 'package:settings_tiles/src/tiles/setting_tile.dart';
import 'package:settings_tiles/src/widgets/empty.dart';

/// A setting tile with multiple options.
class SettingMultipleOptionsTile<T> extends SettingTile {
  /// A setting tile with multiple options that can be checked.
  const SettingMultipleOptionsTile({
    super.key,
    super.visible,
    super.enabled,
    super.icon,
    super.title,
    super.value,
    super.description,
    super.trailing,
    required this.dialogTitle,
    required this.options,
    this.initialOptions,
    required this.onSubmitted,
    this.onCanceled,
  });

  /// The title of the dialog.
  final String dialogTitle;

  /// The list of options to choose from.
  final List<T> options;

  /// The initial options that are checked.
  final List<T>? initialOptions;

  /// Called when the options are chosen.
  final Function(List<T>) onSubmitted;

  /// Called when the dialog is canceled.
  final Function()? onCanceled;

  Future<void> _openDialog(BuildContext context) async {
    final result = await showAdaptiveDialog<List<T>>(
      context: context,
      builder: (context) {
        return SettingMultipleOptionsDialog(
          title: dialogTitle,
          options: options,
          defaultOptions: initialOptions,
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
