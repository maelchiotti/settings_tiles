// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class SettingSingleOptionDialog<T> extends StatefulWidget {
  const SettingSingleOptionDialog({
    super.key,
    required this.title,
    required this.options,
    required this.defaultOption,
  });

  final String title;

  final List<T> options;
  final T? defaultOption;

  @override
  State<SettingSingleOptionDialog<T>> createState() => _SettingSingleOptionDialogState<T>();
}

class _SettingSingleOptionDialogState<T> extends State<SettingSingleOptionDialog<T>> {
  late T? _selectedOption;

  @override
  void initState() {
    super.initState();

    _selectedOption = widget.defaultOption;
  }

  bool _isSelected(T option) {
    return _selectedOption == option;
  }

  void _onChanged(T? option) {
    if (option == null) {
      return;
    }

    setState(() {
      _selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.hardEdge,
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.options.map((option) {
            return RadioListTile<T>(
              value: option,
              groupValue: _selectedOption,
              title: Text(option.toString()),
              // subtitle: Text(''), // TODO: enable specifying a subtitle
              selected: _isSelected(option),
              onChanged: (selected) => _onChanged(option),
            );
          }).toList(),
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
          onPressed: () => Navigator.pop(context, _selectedOption),
          child: Text(
            Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)?.okButtonLabel ?? 'OK',
          ),
        ),
      ],
    );
  }
}