import 'package:intl/intl.dart';

extension DurationExtension on Duration {
  String get formatted {
    final NumberFormat formatter = NumberFormat('00');

    int totalTime = inSeconds;
    final int hours = totalTime ~/ 3600;

    totalTime -= hours * 3600;
    final int minutes = totalTime ~/ 60;

    totalTime -= minutes * 60;
    final int seconds = totalTime;

    return '${formatter.format(minutes)}:${formatter.format(seconds)}';
  }
}
