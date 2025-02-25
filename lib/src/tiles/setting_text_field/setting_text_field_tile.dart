import 'package:flutter/material.dart';
import 'setting_text_field_dialog.dart';
import '../setting_tile.dart';
import '../../widgets/empty.dart';

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
    required this.onSubmitted,
    this.onCanceled,
  });

  /// The title of the dialog.
  final String dialogTitle;

  /// The initial text displayed in the text field.
  final String? initialText;

  /// Called when the text is submitted.
  final void Function(String) onSubmitted;

  /// Called when the dialog is canceled.
  final void Function()? onCanceled;

  Future<void> _openDialog(BuildContext context) async {
    final result = await showAdaptiveDialog<String>(
      context: context,
      useRootNavigator: false,
      builder: (context) {
        return SettingTextFieldDialog(
          title: dialogTitle,
          initialText: initialText,
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
