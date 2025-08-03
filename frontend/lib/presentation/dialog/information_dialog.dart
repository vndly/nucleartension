import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/presentation/dialog/base_dialog.dart';
import 'package:nucleartension/presentation/widgets/labels/label.dart';
import 'package:nucleartension/utils/localizations.dart';
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

  static DialogController _show({
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
  );

  static DialogController _messageInfo({
    required String title,
    required String message,
    required VoidCallback onAccept,
  }) => _show(
    title: Label(
      text: title,
      color: Palette.textPrimary,
      weight: FontWeight.bold,
    ),
    content: Label(text: message, color: Palette.textPrimary, uppercase: false),
    buttonAccept: Localized.get.buttonOk,
    onAccept: onAccept,
  );

  static DialogController playerWon({
    required String time,
    required VoidCallback onAccept,
  }) => _messageInfo(
    title: Localized.get.dialogInformationPlayerWonTitle,
    message: Localized.get.dialogInformationPlayerWonMessage(time),
    onAccept: onAccept,
  );

  /*static List<Widget> _debugPlayer(String label, Object? text) => [
    const VBox(10),
    LabeledText(
      label: label,
      text: text.toString(),
      labelSize: 12,
      textSize: 12,
      labelColor: Palette.textPrimary,
      textColor: Palette.textPrimary,
      labelUppercase: false,
      textUppercase: false,
    ),
  ];*/

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
