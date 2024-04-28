import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/dialog/base_dialog.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class AttackDialog extends StatefulWidget {
  final String title;
  final Function(String) message;
  final int max;
  final String buttonAccept;
  final String buttonCancel;
  final Function(int) onAccept;
  final bool isMissileAttack;
  final int missileYield;

  const AttackDialog._({
    required this.title,
    required this.message,
    required this.max,
    required this.buttonAccept,
    required this.buttonCancel,
    required this.onAccept,
    required this.isMissileAttack,
    required this.missileYield,
  });

  static DialogController _show({
    required String title,
    required Function(String) message,
    required int max,
    required String buttonAccept,
    required String buttonCancel,
    required Function(int) onAccept,
    required bool isMissileAttack,
    required int missileYield,
  }) =>
      BaseDialog.show(AttackDialog._(
        title: title,
        message: message,
        max: max,
        buttonAccept: buttonAccept,
        buttonCancel: buttonCancel,
        onAccept: onAccept,
        isMissileAttack: isMissileAttack,
        missileYield: missileYield,
      ));

  static DialogController troops({
    required Player defender,
    required int max,
    required Function(int) onAccept,
  }) =>
      _show(
        title: Localized.get.dialogAttackTroopsTitle(defender.name),
        message: Localized.get.dialogAttackTroopsMessage,
        max: max,
        buttonAccept: Localized.get.buttonAttack,
        buttonCancel: Localized.get.buttonCancel,
        onAccept: onAccept,
        isMissileAttack: false,
        missileYield: 0,
      );

  static DialogController missiles({
    required Player defender,
    required int max,
    required int missileYield,
    required Function(int) onAccept,
  }) =>
      _show(
        title: Localized.get.dialogAttackMissilesTitle(defender.name),
        message: Localized.get.dialogAttackMissilesMessage,
        max: max,
        buttonAccept: Localized.get.buttonAttack,
        buttonCancel: Localized.get.buttonCancel,
        onAccept: onAccept,
        isMissileAttack: true,
        missileYield: missileYield,
      );

  @override
  State<AttackDialog> createState() => _AttackDialogState();
}

class _AttackDialogState extends State<AttackDialog> {
  int _selected = 0;
  num _yield = 0;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: Label(
        text: widget.title,
        color: Palette.textPrimary,
        weight: FontWeight.bold,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const VBox(5),
          Label(
            text: widget.isMissileAttack
                ? widget.message(
                    '${_selected.toString()} (${Formatter.yield(_yield)})')
                : widget.message(_selected.toString()),
            color: Palette.textPrimary,
            uppercase: false,
          ),
          const VBox(15),
          Label(
            text: widget.isMissileAttack
                ? Localized.get.dialogAttackMissilesSummary(
                    Formatter.resourceRaw(
                      _yield * Constants.MISSILE_ATTACK_DAMAGE_PER_KT,
                    ),
                  )
                : Localized.get.dialogAttackTroopsSummary(
                    Formatter.resourceRaw(
                      _selected * Constants.TROOP_ATTACK_DAMAGE,
                    ),
                  ),
            color: Palette.textPrimary,
            uppercase: false,
          ),
          const VBox(20),
          Slider(
            value: _selected.toDouble(),
            max: widget.max.toDouble(),
            divisions: widget.max,
            label: Formatter.resourceRaw(_selected),
            onChanged: (value) {
              setState(() {
                _selected = value.toInt();
                _yield = _selected * widget.missileYield;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: BaseDialog.close,
          child: Label(
            text: widget.buttonCancel,
            color: Palette.textPrimary,
            weight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: (_selected > 0)
              ? () {
                  BaseDialog.close();
                  widget.onAccept(_selected);
                }
              : null,
          child: Label(
            text: widget.buttonAccept,
            color: (_selected > 0) ? Palette.textPrimary : Palette.textDisabled,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
