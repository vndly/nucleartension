import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/domain/models/attacks/attack.dart';
import 'package:nucleartension/extensions/duration_extension.dart';
import 'package:nucleartension/presentation/widgets/labels/label.dart';
import 'package:nucleartension/presentation/widgets/separators/row_separator.dart';
import 'package:nucleartension/utils/palette.dart';

class AttackBlock extends StatelessWidget {
  final Attack attack;

  const AttackBlock(this.attack);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 15,
            right: 15,
          ),
          color: Palette.backgroundRow,
          child: Row(
            children: [
              Expanded(
                child: Label(
                  text: attack.toString(),
                  color: attack.attackType.color,
                  weight: FontWeight.bold,
                  size: 12,
                ),
              ),
              const HBox(10),
              Label(
                text: attack.timeLeft.formatted,
                color: attack.attackType.color,
                weight: FontWeight.bold,
                size: 12,
              ),
            ],
          ),
        ),
        const RowSeparator(),
      ],
    );
  }
}
