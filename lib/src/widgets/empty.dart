import 'package:flutter/material.dart';

/// An empty widget.
class Empty extends StatelessWidget {
  /// An empty widget shrinks so it takes no space and becomes invisible.
  const Empty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
