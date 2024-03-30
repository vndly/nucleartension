import 'package:intl/intl.dart';

class Formatter {
  static String production(num amount) {
    final NumberFormat formatter = NumberFormat('#.##');

    return formatter.format(amount);
  }

  static String resource(num amount) {
    final int intAmount = amount.ceil();

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
