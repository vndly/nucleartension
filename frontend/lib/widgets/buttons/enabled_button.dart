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
        icon: Icons.construction,
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

  factory EnabledButton.attackMilitary({
    required double size,
    required VoidCallback onTap,
  }) =>
      EnabledButton(
        icon: Icons.ads_click,
        color: Palette.success,
        size: size,
        onTap: onTap,
      );

  factory EnabledButton.attackMissiles({
    required double size,
    required VoidCallback onTap,
  }) =>
      EnabledButton(
        icon: Icons.location_searching_sharp,
        color: Palette.error,
        size: size,
        onTap: onTap,
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
