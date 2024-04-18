import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String text;
  final double size;
  final Color labelColor;
  final Color textColor;

  const LabeledText({
    required this.label,
    required this.text,
    required this.size,
    this.labelColor = Palette.textPrimary,
    this.textColor = Palette.textPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Label(
          text: label,
          color: labelColor,
          weight: FontWeight.bold,
          size: size,
        ),
        const HBox(5),
        Label(
          text: text,
          color: textColor,
          size: size,
        ),
      ],
    );
  }
}
