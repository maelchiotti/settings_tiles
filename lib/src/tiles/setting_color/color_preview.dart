import 'package:flutter/material.dart';

/// A color preview.
class ColorPreview extends StatelessWidget {
  /// A circle filled with the [color] to preview it.
  const ColorPreview({
    super.key,
    required this.color,
  });

  /// The color to preview.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
