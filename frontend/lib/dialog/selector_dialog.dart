import 'dart:ui';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class SelectorDialog extends StatefulWidget {
  final String title;
  final int max;
  final String buttonAccept;
  final String buttonCancel;
  final Function(int) onAccept;

  const SelectorDialog._({
    required this.title,
    required this.max,
    required this.buttonAccept,
    required this.buttonCancel,
    required this.onAccept,
  });

  static DialogController _show({
    required String title,
    required int max,
    required String buttonAccept,
    required String buttonCancel,
    required Function(int) onAccept,
  }) {
    final BuildContext context = Navigation.context;

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Palette.transparent,
      builder: (context) => SelectorDialog._(
        title: title,
        max: max,
        buttonAccept: buttonAccept,
        buttonCancel: buttonCancel,
        onAccept: onAccept,
      ),
    );

    return DialogController(context);
  }

  static DialogController military({
    required int max,
    required Function(int) onAccept,
  }) =>
      _show(
        title: 'Select military power',
        max: max,
        buttonAccept: 'Attack',
        buttonCancel: 'Cancel',
        onAccept: onAccept,
      );

  static DialogController missiles({
    required int max,
    required Function(int) onAccept,
  }) =>
      _show(
        title: 'Select amount of missiles',
        max: max,
        buttonAccept: 'Attack',
        buttonCancel: 'Cancel',
        onAccept: onAccept,
      );

  @override
  State<SelectorDialog> createState() => _SelectorDialogState();
}

class _SelectorDialogState extends State<SelectorDialog> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: AlertDialog(
        titlePadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        actionsPadding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
        backgroundColor: Palette.backgroundDialog,
        title: Label(
          text: widget.title.toUpperCase(),
          color: Palette.textPrimary,
          weight: FontWeight.bold,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
              color:
                  (_selected > 0) ? Palette.textPrimary : Palette.textDisabled,
              weight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
