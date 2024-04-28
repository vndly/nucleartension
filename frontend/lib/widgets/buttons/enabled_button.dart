import 'package:flutter/material.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/icons/svg_icon.dart';

class EnabledButton extends StatelessWidget {
  final Color color;
  final double size;
  final VoidCallback onTap;
  final Widget icon;
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
        icon: _materialIcon(
          icon: Icons.add,
          size: size,
        ),
        color: Palette.success,
        size: size,
        onTap: onTap,
      );

  factory EnabledButton.build({
    required double size,
    required VoidCallback onTap,
  }) =>
      EnabledButton(
        icon: _materialIcon(
          icon: Icons.construction,
          size: size,
        ),
        color: Palette.success,
        size: size,
        onTap: onTap,
      );

  factory EnabledButton.upgrade({
    required double size,
    required VoidCallback onTap,
  }) =>
      EnabledButton(
        icon: _materialIcon(
          icon: Icons.forward,
          size: size,
        ),
        color: Palette.success,
        size: size,
        onTap: onTap,
        rotation: 3,
      );

  factory EnabledButton.attackTroops({
    required double size,
    required VoidCallback onTap,
  }) =>
      EnabledButton(
        icon: _svgIcon(
          icon: Assets.ICONS_TANK,
          size: size,
        ),
        color: Palette.success,
        size: size,
        onTap: onTap,
      );

  factory EnabledButton.attackMissiles({
    required double size,
    required VoidCallback onTap,
  }) =>
      EnabledButton(
        icon: _svgIcon(
          icon: Assets.ICONS_MISSILE,
          size: size,
        ),
        color: Palette.error,
        size: size,
        onTap: onTap,
      );

  static Widget _materialIcon({
    required IconData icon,
    required double size,
  }) =>
      Icon(
        icon,
        color: Palette.icon,
        size: size * 0.5,
      );

  static Widget _svgIcon({
    required String icon,
    required double size,
  }) =>
      SvgIcon(
        icon: icon,
        size: size * 0.6,
        color: Palette.icon,
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
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
