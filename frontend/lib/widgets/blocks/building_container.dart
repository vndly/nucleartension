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
      color: Palette.backgroundBuilding,
      child: child,
    );
  }
}
