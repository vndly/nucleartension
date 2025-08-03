import 'package:flutter/material.dart';
import 'package:nucleartension/presentation/widgets/labels/label.dart';
import 'package:nucleartension/utils/palette.dart';

class BlockTitle extends StatelessWidget {
  final String title;

  const BlockTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.backgroundTitle,
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Label(
          text: title,
          color: Palette.textPrimary,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}
