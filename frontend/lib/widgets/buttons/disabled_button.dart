import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';

class DisabledButton extends StatelessWidget {
  final Color color;
  final double size;
  final IconData icon;

  const DisabledButton({
    required this.color,
    required this.size,
    required this.icon,
  });

  factory DisabledButton.noResources({
    required double size,
  }) =>
      DisabledButton(
        icon: Icons.money_off,
        color: Palette.buttonDisabled,
        size: size,
      );

  factory DisabledButton.queueFull({
    required double size,
  }) =>
      DisabledButton(
        icon: Icons.block,
        color: Palette.buttonDisabled,
        size: size,
      );
  factory DisabledButton.disabled({
    required double size,
  }) =>
      DisabledButton(
        icon: Icons.close,
        color: Palette.buttonDisabled,
        size: size,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
      child: Center(
        child: Icon(
          icon,
          color: Palette.icon,
          size: size * 0.5,
        ),
      ),
    );
  }
}
