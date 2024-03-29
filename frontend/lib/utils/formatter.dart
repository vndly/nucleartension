import 'package:intl/intl.dart';

class Formatter {
  static String production(num amount) {
    final NumberFormat formatter = NumberFormat('#.##');

    return formatter.format(amount);
  }

  static String resource(num amount) {
    final NumberFormat formatter = NumberFormat('#,##0');

    return formatter.format(amount);
  }

  static String time(num amount) {
    final NumberFormat formatter = NumberFormat('00');

    final int minutes = amount ~/ 60;
    final int seconds = amount.toInt() - minutes;

    return '${formatter.format(minutes)}:${formatter.format(seconds)}';
  }
}
