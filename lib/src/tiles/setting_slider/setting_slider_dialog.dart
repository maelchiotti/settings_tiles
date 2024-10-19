// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class SettingSliderDialog extends StatefulWidget {
  const SettingSliderDialog({
    super.key,
    required this.title,
    required this.label,
    required this.min,
    required this.max,
    required this.divisions,
    required this.initialValue,
    required this.onChanged,
  });

  final String title;

  final String Function(double)? label;
  final double min;
  final double max;
  final int? divisions;
  final double initialValue;

  final Function(double)? onChanged;

  @override
  State<SettingSliderDialog> createState() => _SettingSliderDialogState();
}

class _SettingSliderDialogState<T> extends State<SettingSliderDialog> {
  late double _value;

  @override
  void initState() {
    super.initState();

    _value = widget.initialValue;
  }

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });

    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      content: SingleChildScrollView(
        child: Slider(
          value: _value,
          label: widget.label != null ? widget.label!(_value) : _value.toStringAsFixed(2),
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          onChanged: _onChanged,
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
          onPressed: () => Navigator.pop(context, _value),
          child: Text(
            Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)?.okButtonLabel ?? 'OK',
          ),
        ),
      ],
    );
  }
}
