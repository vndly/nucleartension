import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class LabeledInfo extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const LabeledInfo({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Label(
          text: title,
          color: Palette.textPrimary,
          weight: FontWeight.bold,
        ),
        const HBox(10),
        GestureDetector(
          onTap: onTap,
          child: const Icon(
            Icons.info_outline,
            color: Palette.icon,
            size: 14,
          ),
        ),
      ],
    );
  }
}
