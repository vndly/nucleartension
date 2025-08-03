import 'package:flutter/material.dart';
import 'package:nucleartension/presentation/dialog/base_dialog.dart';
import 'package:nucleartension/presentation/widgets/labels/label.dart';
import 'package:nucleartension/utils/palette.dart';

class InformationDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final String buttonAccept;
  final VoidCallback? onAccept;

  const InformationDialog._({
    required this.title,
    required this.content,
    required this.buttonAccept,
    required this.onAccept,
  });

  /*static DialogController _show({
    required Widget title,
    required Widget content,
    required String buttonAccept,
    VoidCallback? onAccept,
  }) => BaseDialog.show(
    InformationDialog._(
      title: title,
      content: content,
      buttonAccept: buttonAccept,
      onAccept: onAccept,
    ),
  );*/

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: title,
      content: content,
      actions: [
        TextButton(
          onPressed: () {
            BaseDialog.close();
            onAccept?.call();
          },
          child: Label(
            text: buttonAccept,
            color: Palette.textPrimary,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
