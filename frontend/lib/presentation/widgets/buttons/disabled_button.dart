import 'package:flutter/material.dart';
import 'package:nucleartension/presentation/widgets/labels/label.dart';
import 'package:nucleartension/utils/palette.dart';

class DisabledButton extends StatelessWidget {
  final Color color;
  final double size;
  final Widget child;

  const DisabledButton({
    required this.color,
    required this.size,
    required this.child,
  });

  factory DisabledButton.noResources({required double size}) =>
      DisabledButton.icon(icon: Icons.money_off, size: size);

  factory DisabledButton.queueFull({required double size}) =>
      DisabledButton.icon(icon: Icons.block, size: size);

  factory DisabledButton.disabled({required double size}) =>
      DisabledButton.icon(icon: Icons.close, size: size);

  factory DisabledButton.icon({required IconData icon, required double size}) =>
      DisabledButton(
        color: Palette.buttonDisabled,
        size: size,
        child: Icon(icon, color: Palette.iconLevel1, size: size * 0.5),
      );

  factory DisabledButton.text({required String text, required double size}) =>
      DisabledButton(
        color: Palette.buttonBlocked,
        size: size,
        child: Label(
          text: text,
          size: size / 3,
          color: Palette.textPrimary,
          weight: FontWeight.bold,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: size,
        height: size,
        color: color,
        child: Center(child: child),
      ),
    );
  }
}
