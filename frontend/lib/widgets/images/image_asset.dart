import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';

class ImageAsset extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final double? size;
  final bool grayscale;

  const ImageAsset({
    required this.path,
    this.width,
    this.height,
    this.size,
    this.grayscale = false,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width ?? size,
      height: height ?? size,
      fit: BoxFit.cover,
      color: grayscale ? Palette.textMain : null,
      colorBlendMode: grayscale ? BlendMode.saturation : null,
    );
  }
}
