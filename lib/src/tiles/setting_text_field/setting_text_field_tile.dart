import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:settings_tiles/src/tiles/setting_text_field/setting_text_field_dialog.dart';
import 'package:settings_tiles/src/tiles/setting_tile.dart';
import 'package:settings_tiles/src/widgets/empty.dart';

/// A setting tile with a text field.
class SettingTextFieldTile extends SettingTile {
  /// A setting tile with a text field to enter some text.
  const SettingTextFieldTile({
    super.key,
    super.visible,
    super.enabled,
    super.icon,
    super.title,
    super.value,
    super.description,
    super.trailing,
    required this.dialogTitle,
    this.initialText,
    this.overrideTextField,
    required this.onSubmitted,
    this.onCanceled,
  });

  /// The title of the dialog.
  final String dialogTitle;

  /// The initial text displayed in the text field.
  final String? initialText;

  /// A custom [TextField] widget to override the default one.
  ///
  /// Is set, it will completely replace the default text field created by this package.
  ///
  /// It needs to have a [TextEditingController], otherwise the text entered won't be returned when submitted.
  final TextField? overrideTextField;

  /// Called when the text is submitted.
  final Function(String) onSubmitted;

  /// Called when the dialog is canceled.
  final Function()? onCanceled;

  Future<void> _openDialog(BuildContext context) async {
    final result = await showAdaptiveDialog<String>(
      context: context,
      builder: (context) {
        return SettingTextFieldDialog(
          title: dialogTitle,
          initialText: initialText,
          overrideTextField: overrideTextField,
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
