import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';

class DisabledButton extends StatelessWidget {
  final Color color;
  final double size;
  final IconData icon;

  static const IconData TARGET1 = Icons.adjust_rounded;
  static const IconData TARGET2 = Icons.ads_click;
  static const IconData TARGET3 = Icons.location_searching_sharp;
  static const IconData QUEUE = Icons.auto_awesome_motion;
  static const IconData RANKING1 = Icons.bar_chart;
  static const IconData RANKING2 = Icons.leaderboard_sharp;

  static const IconData XXXXXX7 = Icons.double_arrow;
  static const IconData XXXXXX9 = Icons.forward;

  const DisabledButton({
    required this.color,
    required this.size,
    required this.icon,
  });

  factory DisabledButton.noResources({
    required double size,
  }) =>
      DisabledButton(
        icon: Icons.money_off,
        color: Palette.buttonDisabled,
        size: size,
      );

  factory DisabledButton.queueFull({
    required double size,
  }) =>
      DisabledButton(
        icon: Icons.block,
        color: Palette.buttonDisabled,
        size: size,
      );
  factory DisabledButton.disabled({
    required double size,
  }) =>
      DisabledButton(
        icon: Icons.close,
        color: Palette.buttonDisabled,
        size: size,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
      child: Center(
        child: Icon(
          icon,
          color: Palette.icon,
          size: size * 0.5,
        ),
      ),
    );
  }
}
