import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';

class BuildingContainer extends StatelessWidget {
  final Widget child;

  const BuildingContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Palette.backgroundBuilding,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Palette.separator,
          ),
        ),
      ),
      child: child,
    );
  }
}
