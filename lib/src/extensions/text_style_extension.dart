import 'package:flutter/material.dart';
import 'package:settings_tiles/src/extensions/color_extension.dart';

/// Extensions on the [TextStyle] class.
extension TextStyleExtension on TextStyle {
  /// Returns this text style but with a subdued color.
  TextStyle get subdued {
    return copyWith(color: color?.subdued);
  }
}
