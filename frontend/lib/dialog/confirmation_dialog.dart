import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/base_dialog.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final String buttonAccept;
  final String buttonCancel;
  final VoidCallback onAccept;
  final VoidCallback onCancel;

  const ConfirmationDialog._({
    required this.message,
    required this.buttonAccept,
    required this.buttonCancel,
    required this.onAccept,
    required this.onCancel,
  });

  static DialogController show({
    required String message,
    required String buttonAccept,
    required String buttonCancel,
    required VoidCallback onAccept,
    VoidCallback? onCancel,
  }) =>
      BaseDialog.show(ConfirmationDialog._(
        message: message,
        buttonAccept: buttonAccept,
        buttonCancel: buttonCancel,
        onAccept: onAccept,
        onCancel: onCancel ?? () {},
      ));

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: Label(
        text: message.toUpperCase(),
        color: Palette.textPrimary,
        weight: FontWeight.bold,
      ),
      content: const Empty(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.buttonEnabled,
              minimumSize: const Size(0, 45),
            ),
            onPressed: () {
              Navigation.pop();
              onCancel.call();
            },
            child: Label(
              text: buttonCancel,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
            bottom: 10,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.error,
              minimumSize: const Size(0, 45),
            ),
            onPressed: () {
              Navigation.pop();
              onAccept.call();
            },
            child: Label(
              text: buttonAccept,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
