import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';

class RowSeparator extends StatelessWidget {
  const RowSeparator();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.2,
      color: Palette.borderSeparator,
    );
  }
}
