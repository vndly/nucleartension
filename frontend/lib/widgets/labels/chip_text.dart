import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class ChipText extends StatelessWidget {
  final String label;
  final String text;

  const ChipText({
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Label(
          text: label.toUpperCase(),
          color: Palette.text,
          weight: FontWeight.bold,
        ),
        const HBox(10),
        Container(
          decoration: const BoxDecoration(
            color: Palette.chip,
            borderRadius: BorderRadius.all(Radius.circular(4)),
            shape: BoxShape.rectangle,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 1,
                bottom: 2,
                left: 4,
                right: 4,
              ),
              child: Label(
                text: text,
                color: Palette.text,
                align: TextAlign.center,
                weight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
