import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';

class ProgressOverlay extends StatelessWidget {
  final double size;
  final double progress;
  final Widget child;

  const ProgressOverlay({
    required this.size,
    required this.progress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: size,
              height: size - (size * progress),
              color: Palette.buttonProgress,
            ),
          )
        ],
      ),
    );
  }
}
