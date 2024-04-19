import 'package:flutter/material.dart';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/utils/palette.dart';

class Label extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextDecoration decoration;
  final TextAlign? align;
  final TextOverflow? overflow;
  final bool uppercase;

  const Label({
    required this.text,
    this.color = Palette.textPrimary,
    this.size = 14,
    this.weight = FontWeight.normal,
    this.decoration = TextDecoration.none,
    this.align,
    this.overflow,
    this.uppercase = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      uppercase ? text.toUpperCase() : text,
      textAlign: align,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: Constants.FONT_NAME,
        decoration: decoration,
      ),
    );
  }
}
