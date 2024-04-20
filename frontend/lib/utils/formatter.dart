import 'package:intl/intl.dart';

class Formatter {
  static String hoursMinutes(DateTime dateTime) =>
      DateFormat.Hm().format(dateTime.toLocal());

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
    if (amount < 1000) {
      final NumberFormat formatter = NumberFormat('0');
      final String value = formatter.format(amount);

      return '$value Kt'; // TODO(momo): localize
    } else {
      final NumberFormat formatter = NumberFormat('0.#');
      final String value = formatter.format(amount / 1000);

      return '$value Mt'; // TODO(momo): localize
    }
  }

  static String resource(num amount) {
    final int intAmount = amount.floor();

    if (intAmount < 1000000) {
      final NumberFormat formatter = NumberFormat('#,##0');

      return formatter.format(intAmount);
    } else {
      final NumberFormat formatter = NumberFormat('##0.###');
      final String value = formatter.format(intAmount / 1000000);

      return '${value}M'; // TODO(momo): localize
    }
  }

  static String resourceRaw(num amount) {
    final NumberFormat formatter = NumberFormat('#,##0');

    return formatter.format(amount);
  }
}
