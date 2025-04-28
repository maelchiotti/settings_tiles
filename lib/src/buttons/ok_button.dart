import 'package:flutter/material.dart';

/// OK button.
class OkButton extends StatelessWidget {
  /// An OK button that executes a function when pressed.
  const OkButton({
    required this.onPressed,
    super.key,
  });

  /// Function executed when this is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)
                ?.okButtonLabel ??
            'OK',
      ),
    );
  }
}
