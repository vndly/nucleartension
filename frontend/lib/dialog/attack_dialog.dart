import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/base_dialog.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class AttackDialog extends StatefulWidget {
  final String title;
  final String message;
  final int max;
  final String buttonAccept;
  final String buttonCancel;
  final Function(int) onAccept;

  const AttackDialog._({
    required this.title,
    required this.message,
    required this.max,
    required this.buttonAccept,
    required this.buttonCancel,
    required this.onAccept,
  });

  static DialogController _show({
    required String title,
    required String message,
    required int max,
    required String buttonAccept,
    required String buttonCancel,
    required Function(int) onAccept,
  }) =>
      BaseDialog.show(AttackDialog._(
        title: title,
        message: message,
        max: max,
        buttonAccept: buttonAccept,
        buttonCancel: buttonCancel,
        onAccept: onAccept,
      ));

  static DialogController military({
    required int max,
    required Function(int) onAccept,
  }) =>
      _show(
        title: Localized.get.dialogAttackMilitaryTitle,
        message: Localized.get.dialogAttackMilitaryMessage,
        max: max,
        buttonAccept: Localized.get.buttonAttack,
        buttonCancel: Localized.get.buttonCancel,
        onAccept: onAccept,
      );

  static DialogController missiles({
    required int max,
    required Function(int) onAccept,
  }) =>
      _show(
        title: Localized.get.dialogAttackMissilesTitle,
        message: Localized.get.dialogAttackMissilesMessage,
        max: max,
        buttonAccept: Localized.get.buttonAttack,
        buttonCancel: Localized.get.buttonCancel,
        onAccept: onAccept,
      );

  @override
  State<AttackDialog> createState() => _AttackDialogState();
}

class _AttackDialogState extends State<AttackDialog> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: Label(
        text: widget.title,
        color: Palette.textPrimary,
        weight: FontWeight.bold,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Label(
            text: widget.message,
            color: Palette.textPrimary,
            uppercase: false,
          ),
          const VBox(20),
          Center(
            child: Label(
              text: _selected.toString(),
              color: Palette.textPrimary,
              weight: FontWeight.bold,
              size: 18,
            ),
          ),
          const VBox(10),
          Slider(
            value: _selected.toDouble(),
            max: widget.max.toDouble(),
            divisions: widget.max,
            label: Formatter.resourceRaw(_selected),
            onChanged: (value) {
              setState(() {
                _selected = value.toInt();
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Palette.textPrimary,
          ),
          onPressed: Navigation.pop,
          child: Label(
            text: widget.buttonCancel,
            color: Palette.textPrimary,
            weight: FontWeight.bold,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Palette.textPrimary,
          ),
          onPressed: (_selected > 0)
              ? () {
                  Navigation.pop();
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
