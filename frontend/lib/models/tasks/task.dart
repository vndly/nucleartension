import 'package:nucleartension/models/inventory/resource_inventory.dart';

class Task {
  num totalTime = 0;
  num remainingTime = 0;
  final ResourceMap cost;

  Task({
    required this.cost,
    required num duration,
  }) {
    totalTime = duration;
    remainingTime = totalTime;
  }

  double get progress => 1 - (remainingTime / totalTime);

  Duration get timeLeft => Duration(seconds: remainingTime.ceil());

  bool get isCompleted => remainingTime <= 0;

  bool update(double dt) {
    remainingTime -= dt;

    return isCompleted;
  }

  static void updater<T extends Task>({
    required double dt,
    required List<T> tasks,
    required Function(T) callback,
  }) {
    final List<T> tasksToRemove = [];

    for (final T task in tasks) {
      if (task.update(dt)) {
        callback(task);
        tasksToRemove.add(task);
      }
    }

    for (final T task in tasksToRemove) {
      tasks.remove(task);
    }
  }
}
