// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class SettingTextFieldDialog extends StatefulWidget {
  const SettingTextFieldDialog({
    super.key,
    required this.title,
    required this.initialText,
    required this.overrideTextField,
  });

  final String title;

  final String? initialText;

  final TextField? overrideTextField;

  @override
  State<SettingTextFieldDialog> createState() => _SettingTextFieldDialogState();
}

class _SettingTextFieldDialogState<T> extends State<SettingTextFieldDialog> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    _textEditingController = widget.overrideTextField?.controller ?? TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    final textField = widget.overrideTextField ??
        TextField(
          controller: _textEditingController,
          autofocus: true,
        );

    return AlertDialog(
      clipBehavior: Clip.hardEdge,
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      title: Text(widget.title),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: textField,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)?.cancelButtonLabel ?? 'Cancel',
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _textEditingController.text),
          child: Text(
            Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)?.okButtonLabel ?? 'OK',
          ),
        ),
      ],
    );
  }
}
