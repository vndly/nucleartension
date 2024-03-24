import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/images/image_asset.dart';
import 'package:nucleartension/widgets/images/image_grayscale.dart';

class SymbolButton extends StatelessWidget {
  final Color color;
  final double size;
  final VoidCallback? onTap;
  final IconData? icon;
  final String? sprite;

  const SymbolButton({
    required this.color,
    required this.size,
    required this.onTap,
    this.icon,
    this.sprite,
  });

  factory SymbolButton.add({
    required double size,
    required VoidCallback? onTap,
  }) =>
      SymbolButton(
        icon: Icons.add,
        color: Palette.success,
        size: size,
        onTap: onTap,
      );

  factory SymbolButton.remove({
    required double size,
    required VoidCallback? onTap,
  }) =>
      SymbolButton(
        icon: Icons.remove,
        color: Palette.error,
        size: size,
        onTap: onTap,
      );

  factory SymbolButton.create({
    required double size,
    required VoidCallback? onTap,
  }) =>
      SymbolButton(
        icon: Icons.add,
        color: Palette.success,
        size: size,
        onTap: onTap,
      );

  factory SymbolButton.upgrade({
    required double size,
    required VoidCallback? onTap,
  }) =>
      SymbolButton(
        icon: Icons.arrow_upward,
        color: Palette.success,
        size: size,
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    final double dimensions = size * 2 / 3;
    final Widget image = (icon != null)
        ? Icon(
            icon,
            color: Palette.icon,
            size: dimensions,
          )
        : ImageAsset(
            path: sprite!,
            size: dimensions,
          );

    return Container(
      width: size,
      height: size,
      color: (onTap != null) ? color : Palette.buttonDisabled,
      child: Material(
        color: Palette.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: (onTap != null)
                ? image
                : ImageGrayScale(
                    size: dimensions,
                    child: image,
                  ),
          ),
        ),
      ),
    );
  }
}
