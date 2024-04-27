import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/confirmation_dialog.dart';
import 'package:nucleartension/extensions/duration_extension.dart';
import 'package:nucleartension/models/tasks/task.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class TaskProgressIndicator extends StatelessWidget {
  final double size;
  final Task task;

  const TaskProgressIndicator({
    required this.size,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ConfirmationDialog.cancelUpgrade(
        task: task,
        onAccept: task.cancel,
      ),
      child: ProgressOverlay(
        size: size,
        progress: task.progress,
        child: Container(
          color: Palette.buttonBlocked,
          child: Center(
            child: Label(
              text: task.timeLeft.formatted,
              size: task.timeLeft.hasHours ? (size / 6) : (size / 4.5),
              weight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressOverlay extends StatelessWidget {
  final double size;
  final double progress;
  final Widget child;

  const ProgressOverlay({
    required this.size,
    required this.progress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: size,
              height: size - (size * progress),
              color: Palette.overlayProgress,
            ),
          )
        ],
      ),
    );
  }
}
