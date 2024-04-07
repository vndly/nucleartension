import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class ResourceIndicator extends StatelessWidget {
  final Icon icon;
  final String value;
  final double textSize;
  final Color textColor;

  const ResourceIndicator({
    required this.icon,
    required this.value,
    required this.textSize,
    this.textColor = Palette.textMain,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Label(
          text: value,
          size: textSize,
          color: textColor,
        ),
        HBox(textSize / 4),
        icon
      ],
    );
  }
}
