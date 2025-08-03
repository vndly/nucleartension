import 'dart:ui';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/palette.dart';

class BaseDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  static int instances = 0;

  const BaseDialog({
    required this.title,
    required this.content,
    required this.actions,
  });

  static DialogController show(Widget dialog) {
    final BuildContext context = Navigation.context;
    instances++;

    Delayed.post(
      () => showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Palette.transparent,
        builder: (context) => dialog,
      ),
    );

    return DialogController(context);
  }

  static bool get hasInstances => instances > 0;

  static void close() {
    instances--;
    Navigation.pop();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: AlertDialog(
        titlePadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        actionsPadding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
        backgroundColor: Palette.backgroundDialog,
        title: title,
        content: content,
        actions: actions,
      ),
    );
  }
}
