// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class SettingSliderDialog extends StatefulWidget {
  const SettingSliderDialog({
    super.key,
    required this.title,
    required this.min,
    required this.max,
    required this.divisions,
    required this.defaultValue,
    required this.overrideSlider,
  });

  final String title;

  final double min;
  final double max;
  final int? divisions;
  final double defaultValue;

  final Slider? overrideSlider;

  @override
  State<SettingSliderDialog> createState() => _SettingSliderDialogState();
}

class _SettingSliderDialogState<T> extends State<SettingSliderDialog> {
  late double _value;

  @override
  void initState() {
    super.initState();

    _value = widget.defaultValue;
  }

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final slider = widget.overrideSlider ??
        Slider(
          value: _value,
          label: _value.toString(),
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          onChanged: _onChanged,
        );

    return AlertDialog(
      clipBehavior: Clip.hardEdge,
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: slider,
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
