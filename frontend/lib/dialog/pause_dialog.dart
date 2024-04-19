import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/base_dialog.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/primary_button.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class PauseDialog extends StatelessWidget {
  final VoidCallback onResume;

  const PauseDialog._({
    required this.onResume,
  });

  static DialogController show({
    required VoidCallback onResume,
  }) =>
      BaseDialog.show(PauseDialog._(
        onResume: onResume,
      ));

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: const Center(
        child: Label(
          text: 'PAUSE',
          color: Palette.textPrimary,
          weight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryButton(
            text: 'RESUME',
            color: Palette.buttonEnabled,
            onPressed: () {
              Navigation.pop();
              onResume();
            },
          ),
        ],
      ),
      actions: const [],
    );
  }
}
