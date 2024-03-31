import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';

class BlockSeparator extends StatelessWidget {
  const BlockSeparator();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Palette.borderSeparator,
    );
  }
}
