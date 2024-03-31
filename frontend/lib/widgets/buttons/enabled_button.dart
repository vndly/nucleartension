import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';

class EnabledButton extends StatelessWidget {
  final Color color;
  final double size;
  final VoidCallback onTap;
  final IconData icon;
  final int rotation;

  const EnabledButton({
    required this.color,
    required this.size,
    required this.onTap,
    required this.icon,
    this.rotation = 0,
  });

  factory EnabledButton.create({
    required double size,
    required VoidCallback onTap,
  }) =>
      EnabledButton(
        icon: Icons.add,
        color: Palette.success,
        size: size,
        onTap: onTap,
      );

  factory EnabledButton.build({
    required double size,
    required VoidCallback onTap,
  }) =>
      EnabledButton(
        icon: Icons.front_loader,
        color: Palette.success,
        size: size,
        onTap: onTap,
      );

  factory EnabledButton.upgrade({
    required double size,
    required VoidCallback onTap,
  }) =>
      EnabledButton(
        icon: Icons.forward,
        color: Palette.success,
        size: size,
        onTap: onTap,
        rotation: 3,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
      child: Material(
        color: Palette.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: RotatedBox(
              quarterTurns: rotation,
              child: Icon(
                icon,
                color: Palette.icon,
                size: size * 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
