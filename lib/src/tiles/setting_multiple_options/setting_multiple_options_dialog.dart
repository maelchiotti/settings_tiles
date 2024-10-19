// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class SettingMultipleOptionsDialog<T> extends StatefulWidget {
  const SettingMultipleOptionsDialog({
    super.key,
    required this.title,
    required this.options,
    required this.defaultOptions,
  });

  final String title;

  final List<({T value, String title, String? subtitle})> options;
  final List<T>? defaultOptions;

  @override
  State<SettingMultipleOptionsDialog<T>> createState() => _SettingMultipleOptionsDialogState<T>();
}

class _SettingMultipleOptionsDialogState<T> extends State<SettingMultipleOptionsDialog<T>> {
  late List<T> _selectedOptions;

  @override
  void initState() {
    super.initState();

    // Create a new list so it can be modified
    _selectedOptions = List.from(widget.defaultOptions ?? []);
  }

  bool _isSelected(T option) {
    return _selectedOptions.contains(option);
  }

  void _onChanged(T option, bool? selected) {
    if (selected == null) {
      return;
    }

    setState(() {
      selected ? _selectedOptions.add(option) : _selectedOptions.remove(option);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.options.map((option) {
            final (:value, :title, :subtitle) = option;

            return CheckboxListTile(
              value: _isSelected(value),
              title: Text(title),
              subtitle: subtitle != null ? Text(subtitle) : null,
              selected: _isSelected(value),
              onChanged: (selected) => _onChanged(value, selected),
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
          onPressed: () => Navigator.pop(context, _selectedOptions),
          child: Text(
            Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)?.okButtonLabel ?? 'OK',
          ),
        ),
      ],
    );
  }
}
