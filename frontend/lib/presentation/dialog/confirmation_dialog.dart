import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/domain/models/tasks/task.dart';
import 'package:nucleartension/presentation/dialog/base_dialog.dart';
import 'package:nucleartension/presentation/widgets/labels/label.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final String buttonAccept;
  final String buttonCancel;
  final VoidCallback onAccept;
  final VoidCallback? onCancel;

  const ConfirmationDialog._({
    required this.message,
    required this.buttonAccept,
    required this.buttonCancel,
    required this.onAccept,
    required this.onCancel,
  });

  static DialogController _show({
    required String message,
    required String buttonAccept,
    required String buttonCancel,
    required VoidCallback onAccept,
    VoidCallback? onCancel,
  }) => BaseDialog.show(
    ConfirmationDialog._(
      message: message,
      buttonAccept: buttonAccept,
      buttonCancel: buttonCancel,
      onAccept: onAccept,
      onCancel: onCancel,
    ),
  );

  static DialogController cancelUpgrade({
    required Task task,
    required VoidCallback onAccept,
  }) => _show(
    message: Localized.get.dialogConfirmationCancelUpgradeMessage,
    buttonAccept: Localized.get.buttonCancel,
    buttonCancel: Localized.get.buttonDismiss,
    onAccept: onAccept,
  );

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: Label(
        text: message,
        color: Palette.textPrimary,
        weight: FontWeight.bold,
      ),
      content: const Empty(),
      actions: [
        TextButton(
          onPressed: () {
            BaseDialog.close();
            onCancel?.call();
          },
          child: Label(
            text: buttonCancel,
            color: Palette.textPrimary,
            weight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            BaseDialog.close();
            onAccept();
          },
          child: Label(
            text: buttonAccept,
            color: Palette.error,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
