import 'package:nucleartension/models/inventory/resource_inventory.dart';

class Task {
  num totalTime = 0;
  num remainingTime = 0;
  bool canceled = false;
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

  void cancel() {
    if (!isCompleted) {
      canceled = true;
    }
  }

  bool update(double dt) {
    if (!canceled) {
      remainingTime -= dt;

      return isCompleted;
    } else {
      return false;
    }
  }
}
