import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/presentation/widgets/labels/label.dart';
import 'package:nucleartension/utils/palette.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String text;
  final double labelSize;
  final double textSize;
  final Color labelColor;
  final Color textColor;
  final bool labelUppercase;
  final bool textUppercase;

  const LabeledText({
    required this.label,
    required this.text,
    required this.labelSize,
    required this.textSize,
    this.labelColor = Palette.textPrimary,
    this.textColor = Palette.textPrimary,
    this.labelUppercase = true,
    this.textUppercase = true,
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
          size: labelSize,
          uppercase: labelUppercase,
        ),
        const HBox(5),
        Label(
          text: text,
          color: textColor,
          size: textSize,
          uppercase: textUppercase,
        ),
      ],
    );
  }
}
