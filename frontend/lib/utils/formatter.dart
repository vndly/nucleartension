import 'package:intl/intl.dart';

class Formatter {
  static String production(num amount) {
    final NumberFormat formatter = NumberFormat('#.##');

    return formatter.format(amount);
  }

  static String rate(num amount) {
    final NumberFormat formatter = NumberFormat('#.##');
    final String value = formatter.format(amount * 100);

    return '$value%';
  }

  static String yield(num amount) {
    final NumberFormat yieldFormatter = NumberFormat('0');
    final NumberFormat populationFormatter = NumberFormat('0,000');

    if (amount < 1000) {
      final String value = yieldFormatter.format(amount);

      return '$value Kt (~${populationFormatter.format(amount * 1000)} people)';
    } else {
      final String value = yieldFormatter.format(amount / 1000);

      return '$value Mt (~${populationFormatter.format(amount * 1000)} people)';
    }
  }

  static String resource(num amount) {
    final int intAmount = amount.floor();

    if (intAmount < 1000) {
      final NumberFormat formatter = NumberFormat('##0');

      return formatter.format(intAmount);
    } else if (intAmount < 1000000) {
      final NumberFormat formatter = NumberFormat('##0');
      final String value = formatter.format(intAmount / 1000);

      return '${value}K';
    } else {
      final NumberFormat formatter = NumberFormat('##0');
      final String value = formatter.format(intAmount / 1000000);

      return '${value}M';
    }
  }
}
