import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class DisabledButton extends StatelessWidget {
  final Color color;
  final double size;
  final Widget child;

  const DisabledButton({
    required this.color,
    required this.size,
    required this.child,
  });

  factory DisabledButton.noResources({
    required double size,
  }) =>
      DisabledButton.icon(
        icon: Icons.money_off,
        size: size,
      );

  factory DisabledButton.queueFull({
    required double size,
  }) =>
      DisabledButton.icon(
        icon: Icons.block,
        size: size,
      );

  factory DisabledButton.disabled({
    required double size,
  }) =>
      DisabledButton.icon(
        icon: Icons.close,
        size: size,
      );

  factory DisabledButton.icon({
    required IconData icon,
    required double size,
  }) =>
      DisabledButton(
        color: Palette.buttonDisabled,
        size: size,
        child: Icon(
          icon,
          color: Palette.icon,
          size: size * 0.5,
        ),
      );

  factory DisabledButton.text({
    required String text,
    required double size,
  }) =>
      DisabledButton(
        color: Palette.buttonBlocked,
        size: size,
        child: Label(
          text: text,
          size: size / 3,
          color: Palette.textPrimary,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
      child: Center(
        child: child,
      ),
    );
  }
}
