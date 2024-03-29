import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';

class BuildingSeparator extends StatelessWidget {
  const BuildingSeparator();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Palette.separator,
    );
  }
}
