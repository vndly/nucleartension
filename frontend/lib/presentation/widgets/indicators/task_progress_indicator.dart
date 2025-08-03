import 'package:flutter/material.dart';
import 'package:nucleartension/domain/models/tasks/task.dart';
import 'package:nucleartension/extensions/duration_extension.dart';
import 'package:nucleartension/presentation/dialog/confirmation_dialog.dart';
import 'package:nucleartension/presentation/widgets/labels/label.dart';
import 'package:nucleartension/utils/palette.dart';

class TaskProgressIndicator extends StatelessWidget {
  final double size;
  final Task task;
  final bool cancellable;

  const TaskProgressIndicator({
    required this.size,
    required this.task,
    required this.cancellable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cancellable
          ? () => ConfirmationDialog.cancelUpgrade(
              task: task,
              onAccept: task.cancel,
            )
          : () {},
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
          ),
        ],
      ),
    );
  }
}
