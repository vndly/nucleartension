import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/presentation/dialog/base_dialog.dart';
import 'package:nucleartension/presentation/widgets/buttons/primary_button.dart';
import 'package:nucleartension/presentation/widgets/labels/label.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

class PauseDialog extends StatelessWidget {
  final VoidCallback onResume;
  final VoidCallback onQuit;

  const PauseDialog._({required this.onResume, required this.onQuit});

  static DialogController show({
    required VoidCallback onResume,
    required VoidCallback onQuit,
  }) => BaseDialog.show(PauseDialog._(onResume: onResume, onQuit: onQuit));

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: Center(
        child: Label(
          text: Localized.get.dialogPauseTitle,
          color: Palette.textPrimary,
          weight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryButton(
            text: Localized.get.dialogPauseResume,
            color: Palette.buttonEnabled,
            onPressed: () {
              BaseDialog.close();
              onResume();
            },
          ),
        ],
      ),
      actions: const [],
    );
  }
}
