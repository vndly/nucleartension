import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class InformationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonAccept;
  final VoidCallback? onAccept;

  const InformationDialog._({
    required this.title,
    required this.message,
    required this.buttonAccept,
    required this.onAccept,
  });

  static DialogController _show({
    required String title,
    required String message,
    required String buttonAccept,
    VoidCallback? onAccept,
  }) {
    final BuildContext context = Navigation.context;

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Palette.transparent,
      builder: (context) => InformationDialog._(
        title: title,
        message: message,
        buttonAccept: buttonAccept,
        onAccept: onAccept,
      ),
    );

    return DialogController(context);
  }

  static DialogController information({
    required String title,
    required String message,
  }) =>
      _show(
        title: title,
        message: message,
        buttonAccept: 'Ok',
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(25, 20, 25, 25),
      backgroundColor: Palette.dialog,
      title: Label(
        text: title,
        color: Palette.textLight,
        weight: FontWeight.bold,
      ),
      content: Label(
        text: message,
        color: Palette.textLight,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
            bottom: 10,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Palette.textLight,
            ),
            onPressed: () {
              Navigation.pop();
              onAccept?.call();
            },
            child: Label(
              text: buttonAccept,
            ),
          ),
        ),
      ],
    );
  }
}
