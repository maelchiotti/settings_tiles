// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class SettingTextFieldDialog extends StatefulWidget {
  const SettingTextFieldDialog({
    super.key,
    required this.title,
    required this.initialText,
  });

  final String title;

  final String? initialText;

  @override
  State<SettingTextFieldDialog> createState() => _SettingTextFieldDialogState();
}

class _SettingTextFieldDialogState extends State<SettingTextFieldDialog> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(widget.title),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: TextField(
            controller: _textEditingController,
            autofocus: true,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            Localizations.of<MaterialLocalizations>(
                        context, MaterialLocalizations)
                    ?.cancelButtonLabel ??
                'Cancel',
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _textEditingController.text),
          child: Text(
            Localizations.of<MaterialLocalizations>(
                        context, MaterialLocalizations)
                    ?.okButtonLabel ??
                'OK',
          ),
        ),
      ],
    );
  }
}
