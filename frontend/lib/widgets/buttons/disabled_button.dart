import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class DisabledButton extends StatelessWidget {
  final Color color;
  final double size;
  final String text;

  const DisabledButton({
    required this.color,
    required this.size,
    required this.text,
  });

  factory DisabledButton.noResources({
    required double size,
  }) =>
      DisabledButton(
        text: 'NO\nRESOURCES',
        color: Palette.buttonBlocked,
        size: size,
      );

  factory DisabledButton.queueFull({
    required double size,
  }) =>
      DisabledButton(
        text: 'QUEUE\nFULL',
        color: Palette.buttonBlocked,
        size: size,
      );

  factory DisabledButton.disabled({
    required double size,
  }) =>
      DisabledButton(
        text: 'XXX',
        color: Palette.buttonBlocked,
        size: size,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
      child: Center(
        child: Label(
          text: text,
          size: size * 0.15,
          align: TextAlign.center,
        ),
      ),
    );
  }
}
