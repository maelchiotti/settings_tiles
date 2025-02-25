import 'package:flutter/material.dart';

/// Cancel button.
class CancelButton extends StatelessWidget {
  /// A cancel button that pops the current route.
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)
                ?.cancelButtonLabel ??
            'Cancel',
      ),
    );
  }
}
